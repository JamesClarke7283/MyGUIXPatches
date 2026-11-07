#!/bin/sh
# Regenerate modules/patches/npm/opencode.scm from opencode's bun.lock.
#
#   tools/update-opencode-npm.sh [VERSION]
#
# VERSION defaults to the version pinned in modules/patches/opencode.scm.
#
# This needs network access and Bun: it runs the same `bun install' that the
# package's build runs, against tools/opencode-registry-recorder.ts, a stand-in
# registry that logs every tarball Bun asks for and redirects to the real one.
# The logged paths, with the sha512 integrity bun.lock records for each, become
# one Guix origin apiece.  A fresh cache directory is used so that nothing is
# skipped.  Expect it to take as long as downloading ~1,700 npm tarballs.
#
# The `bun install' flags below must stay identical to the ones in the
# package's 'install-node-modules phase: they decide which tarballs Bun fetches.
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
ROOT=$SCRIPT_DIR/..
OUT=$ROOT/modules/patches/npm/opencode.scm

VERSION=${1:-$(sed -n 's/^ *(version "\([0-9.]*\)").*/\1/p' \
                   "$ROOT/modules/patches/opencode.scm" | head -n 1)}

# Agent shells started from Electron apps leak LD_LIBRARY_PATH, which breaks
# store binaries; Bun needs none of it.
unset LD_LIBRARY_PATH

BUN=$(guix build -L "$ROOT/modules" bun-bootstrap)/bin/bun

WORKDIR=$(mktemp -d)
RECORDER=
cleanup() {
    [ -n "$RECORDER" ] && kill "$RECORDER" 2>/dev/null || true
    rm -rf "$WORKDIR"
}
trap cleanup EXIT INT TERM

echo "Fetching opencode v$VERSION..."
curl -fsSL "https://github.com/anomalyco/opencode/archive/refs/tags/v$VERSION.tar.gz" \
    | tar -xz -C "$WORKDIR"
SRC=$WORKDIR/opencode-$VERSION

LOG=$WORKDIR/requests.log
: > "$LOG"
"$BUN" "$SCRIPT_DIR/opencode-registry-recorder.ts" "$LOG" 0 > "$WORKDIR/port" &
RECORDER=$!
while [ ! -s "$WORKDIR/port" ]; do sleep 0.2; done
PORT=$(cat "$WORKDIR/port")

echo "Running bun install through the recorder on port $PORT..."
(
    cd "$SRC"
    HOME=$WORKDIR/home \
    BUN_INSTALL_CACHE_DIR=$WORKDIR/cache \
    BUN_CONFIG_REGISTRY=http://127.0.0.1:$PORT/ \
    GITHUB_API_URL=http://127.0.0.1:$PORT \
        "$BUN" install --frozen-lockfile --ignore-scripts --no-progress \
            --os=linux --cpu=x64 \
            --filter ./packages/cli --filter ./packages/app
)

mkdir -p "$(dirname -- "$OUT")"
"$BUN" "$SCRIPT_DIR/opencode-npm.ts" "$SRC/bun.lock" "$LOG" "$VERSION" > "$OUT.tmp"
mv "$OUT.tmp" "$OUT"

COUNT=$(grep -c '^   (\(npm\|github\) ' "$OUT")
echo "Wrote $OUT ($COUNT origins)."
