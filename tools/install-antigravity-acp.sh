#!/usr/bin/env bash
# Install T3 Code's Antigravity ACP runtime with Guix's ELF loader.
# Upstream's packed executable must not be rewritten with patchelf.
set -euo pipefail

version=1.4.1
sha256=2e37012ceb2a5c7fc7309b6e6596234fb637ee3c62a5199f65d4cbe777871384
url="https://dl.google.com/agy-extensions/releases/linux/agy-acp-server-${version}-linux-x86_64.zip"
base_dir="${T3CODE_HOME:-$HOME/.t3}"
dest="$base_dir/tools/antigravity-acp/linux-x64/versions/$sha256"

archive="${ACP_ARCHIVE:-}"
cleanup_archive=
if [[ -z "$archive" ]]; then
  archive=$(mktemp /tmp/antigravity-acp.XXXXXX.zip)
  cleanup_archive=$archive
  curl -fL --retry 3 -o "$archive" "$url"
fi

printf '%s  %s\n' "$sha256" "$archive" | sha256sum -c -
work=$(mktemp -d /tmp/antigravity-acp.XXXXXX)
cleanup() {
  rm -rf "$work"
  if [[ -n "$cleanup_archive" ]]; then
    rm -f "$cleanup_archive"
  fi
}
trap cleanup EXIT
unzip -q "$archive" -d "$work"

glibc=$(guix build glibc | grep -v -E 'debug|static')
shell=$(guix build bash-minimal | grep -v -E 'doc|debug|static')/bin/sh
mkdir -p "$dest"
cp --reflink=auto "$work/agy_acp_server.par" "$dest/agy_acp_server.par.real"
cp --reflink=auto "$work/localharness_external" "$dest/localharness_external"
chmod 755 "$dest/agy_acp_server.par.real" "$dest/localharness_external"

cat > "$dest/agy_acp_server.par" <<EOF
#!$shell
exec $glibc/lib/ld-linux-x86-64.so.2 --library-path $glibc/lib $dest/agy_acp_server.par.real "\$@"
EOF
chmod 755 "$dest/agy_acp_server.par"

bytes=$(stat -c %s "$dest/agy_acp_server.par")
cat > "$dest/.install-complete.json" <<EOF
{
  "releaseId": "$sha256",
  "version": "$version",
  "executable": {
    "name": "agy_acp_server.par",
    "bytes": $bytes
  },
  "harness": {
    "name": "localharness_external",
    "bytes": $(stat -c %s "$dest/localharness_external")
  }
}
EOF

cat > "$base_dir/tools/antigravity-acp/linux-x64/active.json" <<EOF
{
  "releaseId": "$sha256"
}
EOF

"$dest/agy_acp_server.par" --version
printf '\nInstalled Antigravity ACP %s in %s\n' "$version" "$dest"
printf 'Restart T3 Code to refresh its provider cache.\n'
