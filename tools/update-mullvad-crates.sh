#!/bin/sh
# Regenerate modules/patches/crates/mullvad.scm from upstream's Cargo.lock.
#
#   tools/update-mullvad-crates.sh [VERSION]
#
# VERSION defaults to the version pinned in modules/patches/vpn.scm (2026.5).
#
# This needs network access: for every crate in the lockfile it asks
# crates.io for metadata in order to emit a crate-source origin with a
# correct hash.  Expect a few minutes on a cold cache.
#
# The generated file is what lets mullvad-vpn build offline: Guix builds
# have no network, so every crate must reach the build as a fixed-output
# origin (or as a package), and that list is exactly Cargo.lock.
set -eu

VERSION=${1:-2026.5}

# The workspace member we tell `guix import' about.  Any member works; the
# importer walks the lockfile from it and emits every crate it finds.
MEMBER=mullvad-daemon

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
OUT=$SCRIPT_DIR/../modules/patches/crates/mullvad.scm

WORKDIR=$(mktemp -d)
trap 'rm -rf "$WORKDIR"' EXIT INT TERM

LOCK=$WORKDIR/Cargo.lock
IMPORTED=$WORKDIR/crates.scm

echo "Fetching Cargo.lock for mullvad-vpn $VERSION..."
curl -fsSL -o "$LOCK" \
    "https://raw.githubusercontent.com/mullvad/mullvadvpn-app/$VERSION/Cargo.lock"

echo "Importing crates from $LOCK (this takes a while)..."
guix import crate "$MEMBER" -f "$LOCK" > "$IMPORTED"

if ! grep -q '^(' "$IMPORTED"; then
    echo "error: crate import produced no output" >&2
    exit 1
fi

mkdir -p "$(dirname -- "$OUT")"

{
    printf '%s\n' \
        ';;; -*- mode: scheme; -*-' \
        ';;' \
        ";;; Crate origins for mullvad-vpn $VERSION, generated from upstream Cargo.lock." \
        ';;; Regenerate with tools/update-mullvad-crates.sh -- do not edit by hand.' \
        ';;' \
        ';;; Each entry is a proper two-element list of (label origin), which is' \
        ';;; what expand-crate-sources in (guix build-system cargo) matches on' \
        ';;; before turning it into a bag input.  The (guix ...) imports below' \
        ';;; look redundant but are needed: the Guile compiler inlines' \
        ';;; crate-source, so origin/url-fetch/git-fetch calls end up resolved' \
        ';;; in this module and must be bound here.' \
        '(define-module (patches crates mullvad)' \
        '  #:use-module (guix base32)' \
        '  #:use-module (guix download)' \
        '  #:use-module (guix git-download)' \
        '  #:use-module (guix packages)' \
        '  #:use-module (guix build-system cargo)' \
        '  #:export (mullvad-crate-inputs))' \
        ''

    cat "$IMPORTED"

    printf '\n%s\n%s\n' \
        '(define mullvad-crate-inputs' \
        '  (list'

    awk '/^\(define /{ print "   (list \"" $2 "\" " $2 ")" }' "$IMPORTED"

    printf '%s\n' '   ))'
} > "$OUT"

COUNT=$(awk '/^\(define /{ n++ } END { print n+0 }' "$IMPORTED")
echo "Wrote $OUT ($COUNT crate origins)."
