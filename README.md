# MyGUIXPatches

A personal [Guix](https://guix.gnu.org) channel holding package definitions for
software that is not in Guix or nonguix, so it can be built locally from source.

## Layout

    .guix-channel              channel declaration: modules/ is the module root
    modules/patches/
      vpn.scm                  (patches vpn)            mullvad-vpn package
      wireguard.scm            (patches wireguard)      wireguard-go package
      bun.scm                  (patches bun)            Bun, built from source
      bun-bootstrap.scm        (patches bun-bootstrap)  prebuilt Bun seed for the above
      crates/mullvad.scm       (patches crates mullvad) generated crate origins
      services/vpn.scm         (patches services vpn)   Guix System service
    tools/
      update-mullvad-crates.sh regenerates the crate list from Cargo.lock

A file `modules/patches/vpn.scm` provides the module `(patches vpn)`.

## Using the channel

`~/.config/guix/channels.scm` already lists it, before nonguix and the default
channels so that these packages win over upstream ones:

    (cons* (channel
            (name 'my-guix-patches)
            (url "file:///home/james/Projects/MyGUIXPatches")
            (branch "main"))
           (channel (name 'nonguix) ...)
           %default-channels)

The channel is a git repository, so it needs at least one commit before
`guix pull` will accept it. Then:

    guix pull
    guix build mullvad-vpn

While hacking on a definition you do not need to pull; point Guix at the module
directory instead:

    guix build -L modules mullvad-vpn

To check that a definition merely evaluates (fast, no downloads):

    guix build -L modules --dry-run mullvad-vpn

## mullvad-vpn

Built from upstream source — `github.com/mullvad/mullvadvpn-app`, tag `2026.5` —
with `cargo-build-system`. It ships the Rust half of the client:

- `mullvad-daemon` — the privileged daemon that owns the tunnel
- `mullvad` — the command-line client
- `mullvad-exclude` — the split-tunnelling helper

**Not included: the Electron desktop GUI.** Upstream ships it as an npm
workspace under `desktop/`, and this Guix has no npm importer
(`guix import npm` is not a valid importer here), so its `package-lock.json`
cannot be turned into package inputs. The GUI is therefore out of scope until
those dependencies are packaged some other way.

Dependencies come from `modules/patches/crates/mullvad.scm`, generated from
upstream's `Cargo.lock`: 703 crate origins, including one git-sourced crate
(`udp-over-tcp`, from Mullvad's own fork). Guix builds are offline, so every
crate has to reach the build as a fixed-output origin.

The first build compiles several hundred crates and takes a long while.

### Runtime dependency: wireguard-go

The daemon spawns `wireguard-go` to create the tunnel, so the binary has to be
reachable from the daemon's resource directory. This channel provides it in
`(patches wireguard)`, built from source:

    guix build wireguard-go

Copy it into the resource directory named in `resource-directory`, or point
that field at a directory containing it. Without it the daemon still starts,
logs in and manages relays, but bringing a tunnel up fails.

Note that `wireguard-go` needs to be *executable by root* and, because it
creates a TUN device, the daemon must be able to reach `/dev/net/tun`.

## Using the daemon on Guix System

Guix System uses the Shepherd, not systemd, so upstream's
`dist-assets/linux/mullvad-daemon.service` does not apply. This channel provides
a native service type instead.

1. Import the module at the top of `/etc/config.scm`:

       (use-modules (patches services vpn))

2. Add the service to your `operating-system` definition:

       (operating-system
         ...
         (services
          (append (list (service mullvad-vpn-service-type
                                 (mullvad-vpn-configuration
                                  (resource-directory
                                   "/var/lib/mullvad-vpn/resources"))))
                  %desktop-services)))

3. Reconfigure:

       sudo guix system reconfigure /etc/config.scm

4. Inspect it:

       sudo herd status mullvad-daemon
       sudo herd log mullvad-daemon
       mullvad status

### Configuration fields

- `package` — default `mullvad-vpn`.
- `resource-directory` — default `#f`. Directory holding `wireguard-go`;
  exported to the daemon as `MULLVAD_RESOURCE_DIR`. With `#f` the daemon
  resolves it relative to its own executable, which will not contain the binary.
- `settings-directory` — default `/var/lib/mullvad-vpn`. Holds `settings.json`
  (account number, relay preferences). Created with mode `0700` by an
  activation snippet before the daemon starts.
- `verbosity` — default `2`, i.e. `-vv`. Number of `-v` flags; `0` means
  error-only.

The service runs `mullvad-daemon` with `--disable-stdout-timestamps
--disable-log-to-file`, so the Shepherd owns the log instead of the daemon
writing to `MULLVAD_LOG_DIR`. It only requires `user-processes`; the daemon
manages its own routing and firewall configuration.

### Lockdown caveat

Upstream's systemd unit restarts the daemon with `SIGUSR1` so that it enters
lockdown (kill-switch) mode before stopping, preventing leaks on restart.
`herd stop` sends `SIGTERM`, so stopping this service does not enter lockdown
first. If that matters to you, stop the service explicitly before
reconfiguring.

## bun

Split in two, because Bun cannot bootstrap itself.

`(patches bun)` builds Bun 1.4.4 from the `bun-v1.4.4` source tarball using
upstream's own build script. `(patches bun-bootstrap)` supplies the one
prebuilt binary that makes that possible.

Bun 1.4.x is **Rust + C++ built against LLVM 23.1.1** — it is no longer a Zig
project. Upstream's `CONTRIBUTING.md` states the constraints:

> Bun is written in Rust and requires a specific nightly toolchain (pinned in
> `rust-toolchain.toml`). Install Rust via rustup rather than your distro's
> `rust`/`cargo` packages — the build scripts use rustup to automatically
> install and update the pinned nightly.

> Bun requires LLVM 23.1.1 (`clang` is part of LLVM). This version is enforced
> by the build system — mismatching versions will cause memory allocation
> failures at runtime.

> Before starting, you will need to already have a release build of Bun
> installed, as we use our bundler to transpile and minify our code, as well as
> for code generation scripts.

That last point is why the bootstrap package exists: the build script is
executed *by Bun*, so a release Bun has to exist first. It is a `native-input`
of `bun` and is the **only prebuilt artifact in this channel**.

Guix satisfies the LLVM pin (`clang`/`lld` are 23.1.1) and provides the
auxiliary toolchain: cmake, ninja, go, ruby, perl, python, pkg-config, icu4c,
libiconv, libtool, automake, which. **Two gaps remain, so `guix build bun`
does not yet succeed:**

1. The pinned Rust *nightly* (`nightly-2026-09-15`, with `rust-src` for
   `-Zbuild-std`) is not packaged. Guix ships stable Rust, and
   `rust-toolchain.toml` cannot be honoured because there is no rustup and no
   network in the build sandbox. A `rust-nightly` package is the missing piece.
2. `bun run build` fetches and builds its C/C++ dependencies, and submodule
   content is absent from the GitHub archive tarball. Guix builds are offline,
   so those must arrive as origins and be placed where the build script looks.

The definition follows upstream's documented procedure and marks both gaps with
`TODO` comments at the exact spots they bite, rather than pretending to be
finished.

### Why the bootstrap binary is wrapped, not patched

The release executable is `ET_EXEC` with `PT_INTERP` pointing at the FHS loader
`/lib64/ld-linux-x86-64.so.2`, which does not exist on Guix System.

Do **not** "fix" this with `patchelf`. It appears to work — `patchelf
--set-interpreter` rewrites the file and then reports the new interpreter — but
the result segfaults on exec (exit 139, no output), because Bun's binary carries
a large payload after its section headers and patchelf's rewrite of those
headers corrupts it.

Instead the binary is kept byte-for-byte pristine in `libexec/` and a small
wrapper runs it through the store's glibc loader:

    exec <glibc>/lib/ld-linux-x86-64.so.2 --library-path <glibc>/lib \
         <out>/libexec/bun/bun "$@"

Verified by hand against the same artifact: `bun --version` prints `1.4.4`.

## oh-my-pi

Not implemented yet, and blocked on `bun` above.

`omp` is a Bun application: its `dist/cli.js` imports `bun:ffi`, `bun:sqlite`
and `bun:jsc`, so Node cannot run it. Its native bindings
(`@oh-my-pi/pi-natives`) ship only JS loaders — the `.node` addon is embedded in
upstream's compiled binary. Upstream's own Nix flake builds it with `bun2nix` on
top of Bun 1.4.4, which is exactly the dependency this channel cannot yet
satisfy from source: it needs a working `bun`, which needs the Rust nightly and
the offline C/C++ dependencies noted above.

The npm tarball of `@oh-my-pi/pi-coding-agent` does ship `src/` alongside
`dist/`, so once `bun` builds there is a real source path: install the tarball,
place `@oh-my-pi/pi-natives` beside it, and wrap `dist/cli.js` with `bun`.

## Regenerating the mullvad crate list

    tools/update-mullvad-crates.sh [VERSION]

The script fetches `Cargo.lock` for the given tag, runs

    guix import crate mullvad-daemon -f Cargo.lock

and rewrites `modules/patches/crates/mullvad.scm`. It needs network access,
since the importer asks crates.io about every crate; expect a few minutes.

When bumping the version, also update the `version` and the source `sha256` in
`modules/patches/vpn.scm`. `guix download <uri>` prints the correct base32 hash.

One non-obvious detail if you edit the generated file by hand: `crate-source`
gets inlined by the Guile compiler, so the `origin`, `url-fetch`, `git-fetch`
and `base32` calls are resolved in *this* module's namespace. That is why the
generated module imports `(guix packages)`, `(guix download)`, `(guix
git-download)` and `(guix base32)` even though it never names them.

## Licence

Channel content (package and service definitions) is GPL-3.0-or-later, like
Guix itself. The packaged software keeps its own licence: `mullvadvpn-app` is
GPL-3.0, Bun is MIT.