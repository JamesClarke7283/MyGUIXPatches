#!/usr/bin/env bash
# Install T3 Code's Antigravity CLI ACP backend with Guix's ELF loader.
# The native CLI must not be confused with the legacy agy_acp_server.par runtime.
set -euo pipefail

version=1.5.13
build=5999302598852608
sha512=014b37387703acab1f47cd532c8bb60167a6a3537b0f9891de03f1b1ffa9614307bc83c4b2f7551273b0877d722716b0cd9e26782f6b2a50705db4f05e18c68f
release_id=${sha512:0:64}
url="https://storage.googleapis.com/antigravity-public/antigravity-cli/${version}-${build}/linux-x64/cli_linux_x64.tar.gz"
base_dir="${T3CODE_HOME:-$HOME/.t3}"
managed_dir="$base_dir/tools/antigravity-acp/linux-x64"
versions_dir="$managed_dir/versions"
dest="$versions_dir/$release_id"

archive="${ACP_ARCHIVE:-}"
cleanup_archive=
if [[ -z "$archive" ]]; then
  archive=$(mktemp /tmp/antigravity-cli.XXXXXX.tar.gz)
  cleanup_archive=$archive
  curl -fL --retry 3 -o "$archive" "$url"
fi

printf '%s  %s\n' "$sha512" "$archive" | sha512sum -c -
work=$(mktemp -d /tmp/antigravity-cli.XXXXXX)
staging=
cleanup() {
  rm -rf "$work"
  if [[ -n "$staging" ]]; then
    chmod -R u+w "$staging" 2>/dev/null || true
    rm -rf "$staging"
  fi
  if [[ -n "$cleanup_archive" ]]; then
    rm -f "$cleanup_archive"
  fi
}
trap cleanup EXIT
tar -xzf "$archive" -C "$work" antigravity

glibc=$(guix build glibc | grep -v -E 'debug|static')
shell=$(guix build bash-minimal | grep -v -E 'doc|debug|static')/bin/sh
mkdir -p "$versions_dir"
staging=$(mktemp -d "$versions_dir/.install-antigravity.XXXXXX")
cp --reflink=auto "$work/antigravity" "$staging/antigravity.real"
chmod 555 "$staging/antigravity.real"

# T3 launches the managed executable as `antigravity acp ...`.  Keep upstream's
# executable unchanged and put Guix's loader in a small launcher beside it.
# Disable the native self-updater: managed releases are updated as a whole.
cat > "$staging/antigravity" <<EOF
#!$shell
export AGY_CLI_DISABLE_AUTO_UPDATE=1
exec $glibc/lib/ld-linux-x86-64.so.2 --library-path $glibc/lib "\${0%/*}/antigravity.real" "\$@"
EOF
chmod 555 "$staging/antigravity"

# Smoke-test both the native executable and the ACP entry point before making
# this release active.  The install record and its byte count are T3's format.
"$staging/antigravity" --version
"$staging/antigravity" acp --help >/dev/null
bytes=$(stat -c %s "$staging/antigravity")
cat > "$staging/.install-complete.json" <<EOF
{"releaseId":"$release_id","version":"$version","executable":{"name":"antigravity","bytes":$bytes}}
EOF
chmod 400 "$staging/.install-complete.json"

if [[ -L "$dest" ]]; then
  rm -f "$dest"
elif [[ -d "$dest" ]]; then
  chmod -R u+w "$dest"
  rm -rf "$dest"
fi
mv "$staging" "$dest"
staging=
chmod 500 "$dest"

cat > "$managed_dir/active.json.tmp" <<EOF
{"releaseId":"$release_id"}
EOF
chmod 600 "$managed_dir/active.json.tmp"
mv "$managed_dir/active.json.tmp" "$managed_dir/active.json"

printf '\nInstalled Antigravity CLI ACP backend %s in %s\n' "$version" "$dest"
printf 'Restart T3 Code to refresh its provider cache.\n'
