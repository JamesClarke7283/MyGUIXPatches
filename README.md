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
      coding-agents.scm        (patches coding-agents)  oh-my-pi ("omp") and its addons
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

### Version choice: 2026.1, not the newest release

Upstream raises `rust-version` as it goes, and the daemon will not build with a
compiler older than that. Guix ships **rust 1.93.0** and has no `rust@1.95`:

| tag | `rust-version` | buildable with Guix's rust 1.93 |
| --- | --- | --- |
| 2026.5 / 2026.4 / 2026.3 | 1.95.0 | no |
| 2026.2 | 1.94.0 | no |
| **2026.1** | 1.91.0 | **yes** |

So this package is pinned to 2026.1. Bumping it means either picking a tag whose
`rust-version` is ≤ Guix's rust, or packaging a newer rust first.

### Status: the build is proven, the packaging is not finished

The source build itself works. Run outside Guix with the real toolchain
(`protobuf gcc-toolchain pkg-config dbus libnftnl libmnl`), all three binaries
compile and run:

    $ cargo build --offline --release \
        --package mullvad-daemon --package mullvad-cli --package mullvad-exclude
        Finished `release` profile [optimized] target(s) in 5m 09s
    $ ./target/release/mullvad-daemon --version
    mullvad-daemon 2026.1
    $ ./target/release/mullvad --version
    mullvad-cli 2026.1

(`mullvad-exclude` is a setuid helper and prints "Failed to launch the process"
unless run as root. That is expected.)

What is **not** finished is reproducing that inside Guix, because of how the
crate set is supplied. `cargo-build-system` deletes `Cargo.lock` in its
`configure` phase, so cargo re-resolves from scratch against the vendor
directory. A from-scratch resolution needs crates that upstream's lock prunes,
and `guix import crate -f` only emits what the lock contains. Two concrete
failures result:

    error: failed to select a version for the requirement `env_logger = "^0.10.0"`
    candidate versions found which didn't match: 0.11.7

    error: failed to select a version for the requirement `tipsy = "^0.6.5"`
    version 0.6.5 is yanked

The second one appears the moment the lock is removed, which proves the lock is
load-bearing: **the working recipe is `cargo vendor` output (real
`.cargo-checksum.json`) with upstream's `Cargo.lock` kept.**

Things tried that do **not** work, so they are not worth repeating:

- **Restoring the lock against a `guix import`-derived vendor tree.**
  `patch-cargo-checksums` stubs every vendored `.cargo-checksum.json`, so cargo
  stops with "unable to verify that `zerocopy-derive v0.8.31` is the same as
  when the lockfile was generated". This is why the build system deletes the
  lock. With `cargo vendor` checksums the same lock verifies fine.
- **A `[source."git+…"] replace-with` stanza** for the git dependency. It needs
  a lock naming the git source ("the source git+… requires a lock file to be
  present first before it can be used against vendored source code"), which
  collides with the stubbed-checksum problem above.
- **A line-oriented prune of `test-log`** to cut the dev-dependency subtree.
  Fine for inline tables, but where a crate declares its own
  `[dependencies.test-log]` table the header goes while the keys stay, and cargo
  fails with "duplicate key".

### Outstanding work

Ship the `cargo vendor` tree as a tarball (1.2 GB, so it cannot be committed)
and point `[source.vendored-sources]` at it with the lock kept. It needs
somewhere to host the tarball, or a `local-file` alongside the channel. Most of
that 1.2 GB is Windows-only crates (`windows`, `winapi`, ~500 MB) that Linux
never compiles, so pruning those before tarballing is worth doing.

The Electron GUI is a separate, larger gap — see above and below.

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

`(patches coding-agents)` provides `oh-my-pi`, the agent invoked as `omp`.
It works:

    $ omp --version
    omp/18.15.0
    $ omp --help
    omp v18.15.0
    ...

It is built from three published artefacts plus the Bun runtime:

| package | what it is |
| --- | --- |
| `oh-my-pi` | `@oh-my-pi/pi-coding-agent` — `dist/`, `src/`, `skills/`, `prompts/` |
| `oh-my-pi-natives` | `@oh-my-pi/pi-natives` — the JavaScript loaders |
| `oh-my-pi-natives-linux-x64` | `@oh-my-pi/pi-natives-linux-x64` — the compiled N-API addon |

There is no compile step. `dist/cli.js` is an ~18 MB bundle that Bun executes
directly; re-bundling it with `bun build` would reproduce the artefact we
already have. Everything the bundle imports is either inlined into it or a
Bun/Node builtin (`bun:ffi`, `bun:sqlite`, `bun:jsc`, `node:fs`, …), with one
exception: `@oh-my-pi/pi-natives`.

### The addon is a separate package, and that is not obvious

Installing only `@oh-my-pi/pi-natives` leaves `omp` failing at start-up:

    error: Failed to load pi_natives native addon for linux-x64 (modern).
    Tried:
    - .../pi-natives/native/pi_natives.linux-x64-modern.node: Cannot find module
    - .../pi-natives/native/pi_natives.linux-x64-baseline.node: Cannot find module
    - .../pi-natives/native/pi_natives.linux-x64.node: Cannot find module

The npm package of that name contains **loaders only** — no `.node` files. The
compiled addon is published separately as `@oh-my-pi/pi-natives-linux-x64`,
which carries `pi_natives.linux-x64-modern.node` and `...-baseline.node`. The
`oh-my-pi` package drops both into `pi-natives/native/`, where the loader
probes for them.

### Module resolution

Both JS packages are installed flat under `lib/node_modules`:

    <out>/lib/node_modules/@oh-my-pi/pi-coding-agent
    <out>/lib/node_modules/@oh-my-pi/pi-natives

Bun, like Node, resolves a bare specifier by walking up from the importing file
and trying `<ancestor>/node_modules/<specifier>` at each level. From
`.../pi-coding-agent/dist/cli.js` the ancestor `lib` yields
`lib/node_modules/@oh-my-pi/pi-natives`, so the bundle's bare import resolves
with no `NODE_PATH` juggling. The two packages must stay siblings.

### Runtime

`omp` needs Bun >= 1.4.4 and will not run under Node at all, because the bundle
imports `bun:ffi`, `bun:sqlite` and `bun:jsc`.

The wrapper currently points at `bun-bootstrap`, because `(patches bun)` does
not build yet. `bun-bootstrap` *is* Bun 1.4.4, so `omp` works today; what is not
from-source is only the provenance of its runtime. When `bun` becomes buildable,
change the single `bun-bootstrap` reference in the `install`-wrap step and the
corresponding input; nothing else moves.

### What is left, and why

The JavaScript half is final: it is upstream's own published bundle, and there
is nothing to compile. Two pieces of `omp` remain non-reproducible:

1. **The N-API addon.** Rebuilding it means building `packages/natives` in the
   oh-my-pi monorepo, which upstream drives with Bazel
   (`bun ../../scripts/bazel-natives.ts host --dest native`) over a ~750 MB
   checkout whose Bazel dependencies are fetched over the network. That is not
   compatible with Guix's offline build sandbox as it stands, so the published
   per-platform addon is used instead.
2. **The Bun runtime.** See the section above.

So: `omp` works, and the only prebuilt pieces in this channel are Bun (as a
bootstrap seed, and only until `bun` builds) and this addon.

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