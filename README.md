# MyGUIXPatches

A personal [Guix](https://guix.gnu.org) channel holding package definitions for
software that is not in Guix or nonguix, so it can be built locally from source.

## Layout

    .guix-channel              channel declaration: modules/ is the module root
    modules/patches/
      vpn.scm                  (patches vpn)            mullvad-vpn package
      rust-nightly.scm         (patches rust-nightly)   pinned Rust nightly
      rust-nightly-build.scm   (patches rust-nightly-build)  build-side helpers
      wireguard.scm            (patches wireguard)      wireguard-go package
      bun.scm                  (patches bun)            Bun, built from source
      bun-bootstrap.scm        (patches bun-bootstrap)  prebuilt Bun seed for the above
      coding-agents.scm        (patches coding-agents)  oh-my-pi ("omp") and its addons
      ai-clis.scm              (patches ai-clis)        t3-code, codex, claude-code
      t3-desktop.scm           (patches t3-desktop)     t3-code-desktop: native Electron app
      antigravity.scm          (patches antigravity)    Google Antigravity (Electron app)
      mullvad-gui.scm          (patches mullvad-gui)    Mullvad VPN Electron client
      npm/mullvad-desktop.scm  (patches npm mullvad-desktop)  generated npm origins
      crates/mullvad.scm       (patches crates mullvad) generated crate origins
      services/vpn.scm         (patches services vpn)   Guix System service
    tools/
      update-mullvad-crates.sh regenerates the crate list from Cargo.lock

A file `modules/patches/vpn.scm` provides the module `(patches vpn)`.

## Using the channel

The channel declares nonguix as a dependency (see `.guix-channel`), because
some package modules use `(nonguix build-system chromium-binary)` and
`(nonguix packages electron)`.  Guix only puts a channel's declared
dependencies on the module load path when compiling it, so listing nonguix
first in `channels.scm` would not be enough on its own.

`~/.config/guix/channels.scm` should list both, for example:

    (cons* (channel
            (name 'nonguix)
            (url "https://gitlab.com/nonguix/nonguix")
            (introduction ...))
           (channel
            (name 'my-guix-patches)
            (url "file:///home/james/Projects/MyGUIXPatches")
            (branch "main"))
           %default-channels)

Our package names do not collide with nonguix's, so the order only matters if
a future name clash appears.

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

### Version choice: 1.99.1, via `(patches rust-nightly)`

Built with `rust-1.99`, which packages the current stable Rust release. Guix
ships 1.93.0 and carries nothing newer, while this tag declares
`rust-version = "1.95.0"`, so the compiler has to come from this channel.
See the rust-nightly section below.

### Status: builds and runs

    $ mullvad --version
    mullvad-cli 2026.5-dev-772d04
    $ mullvad-daemon --version
    mullvad-daemon 2026.5-dev-772d04

Six fixes beyond ordinary packaging were needed, each found in a build log and
each worth knowing before touching this file:

- **rust-std is a separate component.** The `rustc` tarball has no compiled
  standard library, so every crate fails with `can't find crate for std`.
- **The `gcc-ld` directory has to be filled in.** rustc passes it to gcc as
  `-B`; it shipped only rust-lld drivers, which refuse to run when started
  through the store loader, and no assembler at all. That surfaced as
  `collect2: fatal error: posix_spawnp: No such file or directory`. It now
  holds wrappers onto binutils.
- **Those wrappers need an absolute `#!` line.** `/bin/sh` does not exist in
  the sandbox, and a script whose interpreter cannot be found reports the same
  misleading `posix_spawnp` error, so the shebang names bash in the store.
- **Build scripts are executed**, so they need `libgcc_s` at load time:
  `LD_LIBRARY_PATH`, not just `LIBRARY_PATH`.
- **jemalloc wants `/bin/sh` twice** — through `configure` (`CONFIG_SHELL`) and
  through make. `MAKESHELL` alone is not enough because a makefile's own
  `SHELL = /bin/sh` wins; `SHELL=` goes into `MAKEFLAGS`.
- **`mullvad-daemon/build.rs` shells out to `git log`** for the commit date and
  a tarball has no repository, so a single-commit repo is created in the build
  tree. cargo also never sets RUNPATH, so `RUSTFLAGS` passes `-Wl,-rpath` for
  libgcc_s, libdbus-1, libmnl and libnftnl.

The Electron GUI is a separate package, `mullvad-vpn-gui`, built from the same
source tarball and documented under "Desktop client" below.

### Desktop client: `mullvad-vpn-gui`

`mullvad-vpn-gui` builds upstream's Electron client from the same tarball and
packages it with nonguix's Electron 41.  GUI and daemon must agree on their RPC
protocol, so keep the two package versions in step.

The npm build is the interesting part.  This Guix has no `guix import npm`, so
`desktop/package-lock.json` cannot become node-build-system inputs.  Instead
`(patches npm mullvad-desktop)` pins one origin per locked tarball (772 of them)
and the build unpacks them into the `node_modules` layout the lock describes.
The TypeScript sources, the two workspace shims (`nseventforwarder`,
`windows-utils`) and the Vite renderer are then compiled by the project's own
`tsc` and `vite build`; nothing comes from a prebuilt Mullvad bundle.

The package installs a self-contained Electron tree and puts the application in
`resources/app`, which is electron-builder's layout.  That matters because the
client resolves its helper binaries through `process.resourcesPath`:
`resources/mullvad-daemon` is a symlink to the source-built daemon, and
`resources/relays.json`, `resources/ca.crt` and `resources/wireguard-go` are
what the daemon needs.  Point the service at that directory:

    (use-modules (patches services vpn) (patches mullvad-gui))

    (service mullvad-vpn-service-type
             (mullvad-vpn-configuration
              (resource-directory
               (file-append mullvad-vpn-gui
                            "/libexec/mullvad-vpn/resources"))))

`resource-directory` accepts a string or a file-like object, so the
`file-append` above keeps the GUI package in the system closure and therefore
protected from `guix gc`.

The client starts and shows "disconnected" even while the daemon is not
running, which is useful for checking the build:

    $ mullvad-vpn


### Outstanding work

Ship the `cargo vendor` tree as a tarball (1.2 GB, so it cannot be committed)
and point `[source.vendored-sources]` at it with the lock kept. It needs
somewhere to host the tarball, or a `local-file` alongside the channel. Most of
that 1.2 GB is Windows-only crates (`windows`, `winapi`, ~500 MB) that Linux
never compiles, so pruning those before tarballing is worth doing.


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

## rust-nightly

`(patches rust-nightly)` provides the exact toolchain Bun pins:
**nightly-2026-09-15**, with `rust-src`, on **LLVM 23.1.1**.

It is needed because Bun's Rust half cannot be built with a stable compiler.
`scripts/build/rust.ts` passes nightly-only flags (`-Zbuild-std`,
`-Ztune-cpu`) that stable rustc rejects outright. Bun also refuses to start
the build when the LLVM versions differ:

    error: clang is LLVM 23.1.1 and rustc's LLVM is 21.1.8;
           they have to be the same major version

Verified after building:

    $ rustc -vV
    rustc 1.100.0-nightly (574ff7d98 2026-09-14)
    LLVM version: 23.1.1
    $ cargo --version
    cargo 1.100.0-nightly (7941be6fb 2026-09-11)

`rust-src` lands in `lib/rustlib/src/rust`, which is where cargo looks when
`-Zbuild-std` asks for the standard library sources.

The toolchain binaries expect the FHS loader, like Bun's, so each gets a small
compiled C shim that execs it through the store's glibc loader with
`libgcc_s` and `zlib` on the library path. Unlike Bun's binary these *could* be
patched with `patchelf` (nothing is appended after their section headers), but
shims are used for consistency with `bun-bootstrap` and because build systems
treat a compiler's path as an opaque command prefix.

These are upstream's published binaries for the pinned channel, not a source
build: building rustc at a specific nightly commit takes hours and still needs
a stage-0 compiler. The matching `rustc-nightly-src.tar.xz` is fetched as a
build input and is what a from-source version would compile from.

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

Do **not** "fix" this with `patchelf`. It exits 0 and prints the new
interpreter, so it looks like it worked, but the result segfaults on exec
(exit 139). Bun stores its JS payload after the section headers and patchelf
moves it: the file grows by a page (`107308936` → `107317128` bytes) and the
last megabyte hashes differently. Bun addresses that payload by absolute
offset, so any shift breaks it.

Instead the binary is kept byte-for-byte pristine in `libexec/` and started
through the store's glibc loader by a small **compiled C** shim (not a shell
script, see below). Verified against the same artifact: `bun --version` prints
`1.4.4`, `bun script.ts` and `bun run` both work.

### Why the shim is C, and what it cannot fix

Starting Bun through the loader leaves `/proc/self/exe` pointing at `ld.so`, so
Bun reports the loader as its own executable:

    $ bun -e 'console.log(process.execPath)'
    /gnu/store/...-glibc-2.41/lib/ld-linux-x86-64.so.2

Harmless for everything Bun does on its own, but Bun's build records
`process.execPath` verbatim into `build.ninja` (`scripts/build/configure.ts`:
`jsRuntime: q(process.execPath)`) and then uses it to run its own `.ts` build
scripts, so ninja tries to execute a `.ts` file with the dynamic linker:

    error while loading shared libraries: .../stream.ts: invalid ELF header

`(patches bun)` patches that one expression to prefer `BUN_JS_RUNTIME`, which
the build phase sets to the shim. The helpers then run correctly
(`[rust-argon2] Bun v1.4.4 (Linux x64)`).

### Where the build stops now

With `jsRuntime` fixed and a writable `HOME` (the fetches cache under
`$HOME/.bun/build-cache`, and `$HOME` is `/homeless-shelter` in the sandbox —
that alone was an `EACCES`), the build runs for about three minutes and then
fails on **network access**:

    [lolhtml] error: Failed to download after 10 attempts:
      https://github.com/oven-sh/lol-html/archive/725ce499....tar.gz
    [ninja] could not fetch bun-ninja-5ecd8831 ... EAI_AGAIN github.com

That is Guix's offline sandbox working as intended. Bun's build fetches ~23
C/C++ dependencies (`lolhtml`, `rust-argon2`, `boringssl`, `libuv`, `mimalloc`,
`zstd`, …) plus its own `ninja` fork, applies the patches under `patches/` to
each, and builds them. Before this package can finish, those must become Guix
origins placed where `scripts/build/deps/*.ts` expects to find them.

### What is already proven

Configure succeeds inside Guix and reports the real profile:

    [configured] bun-profile → bun (stripped)
      target       linux-x64-gnu
      build type   Release
      features     lto, baseline
    23 deps, 228 codegen, 1218 objects

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

## Agent CLIs: `t3-code`, `codex`, `claude-code`

`(patches ai-clis)` provides three agent command-line tools that upstream ships
only as prebuilt artifacts, so each is a fixed-output origin rather than a source
build:

| Package | Upstream artifact | Why no source build |
| --- | --- | --- |
| `t3-code` | `t3-0.1.6-linux-x64.tar.gz` | Node single-executable application |
| `codex` | `@openai/codex@0.166.0-linux-x64` | Rust, but vendoring to 1308 crates / 1.8 GB |
| `claude-code` | `@anthropic-ai/claude-code-linux-x64` | closed source |

`codex` is statically linked and runs as-is. The other two carry a PT_INTERP of
`/lib64/ld-linux-x86-64.so.2`, so a small compiled C shim starts them through the
store's glibc loader.

### `t3-code` and `import.meta.dirname`

`t3` is a Node single-executable application: one ELF with the JavaScript
appended. At startup it derives `import.meta.dirname` from the path of the ELF
interpreter it was started through, and looks for its web client and its
resource-monitor helper relative to that path. Started through glibc's store
loader, `import.meta.dirname` was `<glibc>/lib`, so `t3` looked for
`<glibc>/lib/client`, found nothing, and answered every request with

    503 No static directory configured and no dev URL set.

`require('@cursor/sdk')` failed for the same reason. The fix is to keep a copy of
the loader *inside* the bundle, beside `client/`, `node_modules/` and
`resource-monitor/`, and to point the shim at that copy:

    <out>/libexec/t3/ld-linux-x86-64.so.2   copied from glibc
    <out>/libexec/t3/client/                upstream's web client
    <out>/libexec/t3/node_modules/          upstream's bundled modules
    <out>/libexec/t3/t3                     the single executable

Now `import.meta.dirname` is the bundle directory and every relative lookup lands
where upstream's layout puts it. The copy is a real file, not a symlink: the
kernel records the *resolved* path in `/proc/self/exe`, so a symlink to glibc's
loader would put `import.meta.dirname` back in glibc's store directory.

Verify:

    $ t3 --version
    t3 v0.1.6
    $ t3 --port 5000 --no-browser &
    $ curl -s -o /dev/null -w '%{http_code}\n' http://127.0.0.1:5000/
    200

`bin/t3` also appends `xdg-utils` to `PATH`, because `t3` shells out to
`xdg-open` to open the browser; without it the server starts but reports
"browser auto-open unavailable", which looks exactly like the UI failing to
start.

### The desktop application: `t3-code-desktop`

`t3-code` is the CLI: it serves the web client and opens a browser. For a native window, install `t3-code-desktop` as well. It is the Electron shell upstream ships as

    T3-Code-0.1.6-x86_64.AppImage

a standard electron-builder AppImage whose payload is a squashfs image starting at byte offset 944632 (printed by `--appimage-offset`). The recipe therefore extracts it with `unsquashfs -o`, which needs neither FUSE nor `/proc/self/exe` — both awkward in a Guix build sandbox.

The AppImage bundles Electron 44.10.0 together with the application's native modules (node-pty, `@napi-rs/keyring`, ffi-rs, xa11y), prebuilt for that exact Electron ABI. nonguix's `electron` is 41.x, so it is deliberately **not** substituted: loading those `.node` files under a different major version fails with a `NODE_MODULE_VERSION` mismatch. The bundled Electron is used as-is.

The recipe is built with nonguix's `chromium-binary-build-system`, which patches the FHS interpreter to the store's loader, sets a RUNPATH covering the whole Electron library set, and wraps the launcher. One phase is replaced: the build system's own wrapper does not put the application's own directory on `LD_LIBRARY_PATH`, and it resolves fontconfig under a `fontconfig-minimal` label that is easy to get wrong, so the recipe supplies its own wrapper.

Two details matter at run time:

* `chrome-sandbox` cannot keep its setuid bit in the store. Chromium then uses the unprivileged user-namespace sandbox, which works on Guix System as long as unprivileged user namespaces are enabled (the stock kernel configuration allows them).
* The wrapper sets `ELECTRON_OZONE_PLATFORM_HINT=auto`, so Electron picks Wayland or X11 by itself.

Verify by launching it from the menu, or check the app's log for

    INFO: backend ready ... url: http://127.0.0.1:3773/
    INFO: main window created

The desktop entry is `t3code.desktop` (`Name=T3 Code`). The CLI's browser entry is renamed `T3 Code (Web)` so the two do not collide in the menu.

## Google Antigravity (`antigravity`)

`(patches antigravity)` packages the **Antigravity** application. The download
page also offers a separate "Antigravity IDE (Standalone)" (a VS Code fork);
that is a different program and is not packaged here.

Upstream publishes Linux builds only as a plain Electron tarball:

    https://storage.googleapis.com/antigravity-public/antigravity-hub/
      2.28.2-5937220255875072/linux-x64/Antigravity.tar.gz

so the recipe is structurally the same as `t3-code-desktop`: nonguix's
`chromium-binary-build-system` supplies the Electron library set, patches the
FHS interpreter, sets the RUNPATH and wraps the launcher. Two extras are needed:

* `resources/bin/language_server` and `resources/bin/webm_encoder` are also
  spawned by the application and carry FHS interpreters of their own
  (`/lib64/...` and Google's `/usr/grte/v5/lib64/...`). They are added to the
  `wrapper-plan`, which patches them as well. Both need only glibc.
* The tarball has no `.desktop` file and no icon, so `antigravity.desktop` is
  written by the recipe and the official `apple-touch-icon.png` is fetched as a
  second origin and installed into the hicolor theme.

The bundled Electron is 44.5.1 and is used as-is, for the same ABI reason as
`t3-code-desktop`.

`chrome-sandbox` cannot keep its setuid bit in the store, so Chromium uses the
unprivileged user-namespace sandbox, which works on Guix System with the stock
kernel configuration.

### Sign-in

The Google sign-in flow is driven by the Go language server, not by the
Electron main process. It opens the browser by exec'ing `xdg-open`, and it looks
that up in a *hydrated login-shell* `PATH`: the app runs the user's shell with
`-ilc 'command env'` and uses that environment for child processes. That `PATH`
contains `~/.guix-profile/bin` but not the store paths this package's wrapper
adds, so ordinary Electron wrapping is not enough, and the first click failed
with

    Failed to open browser: exec: "xdg-open": executable file not found in $PATH

The package therefore installs its own `bin/xdg-open` (a small wrapper that puts
xdg-utils' own `bin` on `PATH` and delegates to the real `xdg-open`). It lands
in `~/.guix-profile/bin`, which the hydrated `PATH` does contain.

After signing in, Google redirects to `antigravity://...`. The desktop entry
declares `MimeType=x-scheme-handler/antigravity;`, so the desktop database maps
the scheme to `antigravity.desktop`, and the redirect reopens the running app
(`second-instance`) to complete the flow.

Verify:

    $ antigravity
    # log: "Starting app (v2.28.2) ...", "Host bridge server listening on ..."

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
