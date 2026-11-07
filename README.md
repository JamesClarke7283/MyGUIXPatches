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
      blender.scm              (patches blender)        Blender 5.2 LTS, MCP server and extension
      godot.scm                (patches godot)          Godot 4.7 stable editor
      gimp.scm                 (patches gimp)           GIMP 3.2.8, MCP server and plug-in
      appimagelauncher.scm     (patches appimagelauncher) AppImageLauncher 3.0.0-beta-3
      tailwindcss.scm          (patches tailwindcss)    Tailwind CSS 4 CLI, standalone binary
      trunk.scm                (patches trunk)          Trunk Rust WASM bundler
      opencode.scm             (patches opencode)       opencode coding agent, built from source
      npm/mullvad-desktop.scm  (patches npm mullvad-desktop)  generated npm origins
      npm/opencode.scm         (patches npm opencode)   generated npm origins
      crates/mullvad.scm       (patches crates mullvad) generated crate origins
      services/vpn.scm         (patches services vpn)   Guix System service
    tools/
      update-mullvad-crates.sh regenerates the crate list from Cargo.lock
      update-opencode-npm.sh   regenerates opencode's npm origins (with the two .ts helpers)

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

## Godot

`(patches godot)` provides **Godot 4.7.2**, the latest stable release, built
from upstream source. It updates Guix's Godot 4.6 package and retains its
system-library integration, X11 and Wayland support, and Vulkan and OpenGL
renderers. HarfBuzz 14.2 supplies the text-rasterization libraries required by
this release. This is the standard editor with GDScript support.

Build and install it from this checkout:

    guix build -L modules godot@4.7.2
    guix install -L modules godot@4.7.2

The build enables and runs Godot's headless unit tests: 1,386 cases and
419,847 assertions passed. An isolated project also passes checks for
GDScript, SVG and glTF imports, multilingual text shaping, 3D physics, and
resource saving. Close a running older Godot and launch `godot` again after
updating.

## Blender

`(patches blender)` provides Blender **5.2.3 LTS**, built from upstream source.
It supersedes Guix's Blender 4.5.10 and supports the MCP extension below.
The package uses Python 3.13, a matching NumPy build, OpenColorIO 2.5,
OpenImageIO 3.1, and the Ceres revision used by Blender upstream. It supports
X11 and Wayland. Its Python runtime also includes the dependencies used by
the built-in extension manager, remote asset libraries, and compressed file
metadata.

Build and install it from this checkout:

    guix build -L modules blender@5.2.3
    guix install -L modules blender@5.2.3

Close a running older Blender and launch `blender` again after updating.

## Blender MCP

Two packages in `(patches blender)` provide [Blender Lab's MCP
server](https://www.blender.org/lab/mcp-server/), built from the same upstream
`v1.0.3` source:

- `blender-mcp` provides the command that an MCP client launches, including
  the bundled Blender Python API reference and manual.
- `blender-mcp-extension` provides the add-on that runs inside Blender and
  handles the server's requests.

Build or install both from this checkout:

    guix build -L modules blender-mcp blender-mcp-extension
    guix install -L modules blender-mcp blender-mcp-extension

**The extension requires Blender 5.1 or newer.** Use this channel's Blender
5.2.3; upstream Guix's 4.5.10 rejects the extension as incompatible. The
documentation tools in `blender-mcp` work without Blender.

The extension installs under `share/blender/extensions/system/mcp` and
declares the `BLENDER_SYSTEM_EXTENSIONS` search path. After installation,
source the profile's environment before launching Blender:

    . "$HOME/.guix-profile/etc/profile"

In Blender 5.1+, enable **Allow Online Access** in **Preferences > System >
Network**, then enable **MCP** in **Preferences > Add-ons**. The add-on
starts its local server automatically; its preferences provide start/stop
controls and the host and port settings. The default address is
`localhost:9876`.

Configure your MCP client's stdio server with command `blender-mcp` and no
arguments. For clients using an `mcpServers` JSON configuration:

```json
{
  "mcpServers": {
    "blender": {
      "command": "blender-mcp",
      "args": []
    }
  }
}
```

If the client does not inherit your profile's `PATH`, use the full path to
`~/.guix-profile/bin/blender-mcp`. Set `BLENDER_MCP_HOST` and
`BLENDER_MCP_PORT` in the client's server environment if you change the
add-on's address. The tools that launch a separate background Blender use
`BLENDER_PATH` to select its executable, falling back to `blender` on `PATH`.

With the extension enabled and preferences saved, a background server can
also be started with:

    blender --background --online-mode --command blender_mcp

The MCP tools execute Python with Blender's user permissions. Only connect
clients you trust.

All three packages build with Guix. Blender's build checks that its built-in
extension manager loads; the server's build runs all 102 upstream tests that
do not require Blender. All 41 upstream background integration tests pass
against this source-built Blender 5.2.3 with a longer test-client timeout for
CPU rendering. A separate round trip loads the packaged add-on from the
System repository, confirms discovery of 26 tools, checks Python 3.13 and
NumPy, and renders a PNG with Cycles on the CPU.

## GIMP

`(patches gimp)` provides **GIMP 3.2.8**, the latest stable release, built from
upstream source. It updates Guix's 3.2.6 with Guix's own recipe, whose
dependency versions already satisfy 3.2.8; the build's 19 meson tests pass.
It also declares a `GIMP3_PLUGINDIR` search path, so plug-in packages
installed into the same profile are found automatically (see GIMP MCP below).

    guix build -L modules gimp@3.2.8
    guix install -L modules gimp@3.2.8

Close a running older GIMP and launch `gimp` again after updating.

## GIMP MCP

Two packages in `(patches gimp)` provide [GIMP
MCP](https://github.com/gimp-mcp/gimp-mcp), built from the same pinned upstream
commit (upstream tags no releases):

- `gimp-mcp` provides `gimp-mcp-server`, the command an MCP client launches.
  It exposes 79 tools: adjustments, transforms, selections, layers, drawing,
  text, filters, PNG snapshots of the image for checking each step, and
  arbitrary GIMP Python execution.
- `gimp-mcp-plugin` provides the GIMP plug-in that executes the server's
  requests over `localhost:9877`.

Upstream requires `mcp` 1.28.1 or newer for three CVE fixes; Guix has 1.25.0,
so the server is built against `mcp` 1.30.0, the last 1.x release.

    guix install -L modules gimp@3.2.8 gimp-mcp gimp-mcp-plugin

The plug-in sits in `lib/gimp/3.0/plug-ins/gimp-mcp-plugin`. This channel's
GIMP sets `GIMP3_PLUGINDIR` to the profile's `lib/gimp/3.0`, which holds
GIMP's own plug-ins plus every plug-in package in the profile. Source the
profile's environment (or log in again) before launching GIMP:

    . "$HOME/.guix-profile/etc/profile"

In GIMP, choose **Tools > MCP > Start MCP Server**. The server also starts
from the command line:

    gimp -b '(plug-in-mcp-server #:run-mode RUN-NONINTERACTIVE)'

Configure your MCP client's stdio server with command `gimp-mcp-server` and
no arguments:

```json
{
  "mcpServers": {
    "gimp": {
      "command": "/home/james/.guix-profile/bin/gimp-mcp-server",
      "args": []
    }
  }
}
```

The tools execute Python inside GIMP with your user permissions, and the
plug-in accepts any local connection on port 9877. Only connect clients you
trust.

The server's build checks that it imports under `mcp` 1.30.0 and registers
all 79 tools. The plug-in's build starts the installed plug-in in GIMP 3.2.8
on a virtual X server and runs upstream's `run_tests.py`; all 59 checks pass.
A stdio round trip through the installed `gimp-mcp-server` also connects to
GIMP 3.2.8 and returns an image snapshot.

## AppImageLauncher

`(patches appimagelauncher)` provides **AppImageLauncher 3.0.0-beta-3**, built
from upstream source. It integrates AppImages into the desktop: it moves them
to a central directory, installs a desktop entry, icons, and update and removal
actions, and provides a settings GUI and the `ail-cli` command.

The package includes:

- `AppImageLauncher` — the integration dialog
- `AppImageLauncherSettings` — the configuration GUI
- `appimagelauncherd` — the background integration daemon
- `ail-cli` — the command-line integration tool
- `lib/appimagelauncher/remove` and `lib/appimagelauncher/update` — the
  helpers used by the generated desktop entries

Build or install it from this checkout:

    guix build -L modules appimagelauncher
    guix install -L modules appimagelauncher

AppImageLauncher 3.0 normally downloads AppImageUpdate, zsync2, libappimage,
cpr, args and xdg-utils-cxx at configure time. This definition supplies all of
them from pinned sources, and builds libappimage against Guix's `squashfuse`
and `xdg-utils-cxx` instead of its own `ExternalProject` downloads.

### Enabling AppImage interception

Installing the package does not modify system-wide Binfmt configuration. To
make double-clicking an AppImage go through AppImageLauncher, register its
interpreter with the kernel's `binfmt_misc`:

    conf=$(guix build -L modules appimagelauncher)/lib/binfmt.d/appimagelauncher.conf
    sudo sh -c "grep -v '^#' '$conf' | while IFS= read -r line; do printf '%s\n' \"\$line\" > /proc/sys/fs/binfmt_misc/register; done"

The file contains comments, and the kernel's `register` file accepts one entry
per write, so feed it line by line rather than `cat`-ing the whole file.

If `/proc/sys/fs/binfmt_misc` is not mounted, load and mount it first:

    sudo modprobe binfmt_misc
    sudo mount -t binfmt_misc binfmt_misc /proc/sys/fs/binfmt_misc

The registrations are not persistent: repeat the command after each reboot, or
arrange for it to run from your boot configuration. Without the registration,
individual AppImages can still be integrated explicitly:

    ail-cli integrate /path/to/Application.AppImage

The package's binfmt configuration uses the `F` (fix binary) flag, so the
interpreter is copied into the kernel and remains available in containers and
namespaces. The interpreter itself is
`lib/appimagelauncher/binfmt-interpreter` in the package output.

## Tailwind CSS CLI

`(patches tailwindcss)` provides `tailwindcss` 4.3.4, the standalone Tailwind
CSS command-line tool. It scans source files and writes the generated
stylesheet, and bundles the v4 Oxide engine and default theme, so it needs no
Node.js or JavaScript toolchain at run time.

Build or install it from this checkout:

    guix build -L modules tailwindcss
    guix install -L modules tailwindcss

A minimal project:

    printf '@import "tailwindcss";\n' > input.css
    tailwindcss -i input.css -o output.css --watch

The package installs upstream's released executable. It is dynamically linked
against glibc, so the definition patches its ELF interpreter to the store's
loader. Do not strip the binary: its payload is a Bun single executable, and
stripping it makes it report Bun's version and fail to compile CSS.

## Trunk

`(patches trunk)` provides `trunk` 0.22.1, the Rust WebAssembly web application
bundler. It builds and bundles WASM, JavaScript snippets and static assets from
a source HTML file and `Trunk.toml`, and provides a development server with
change detection and proxy support.

Build or install it from this checkout:

    guix build -L modules trunk
    guix install -L modules trunk

Then, from a Trunk project:

    trunk serve

The package installs upstream's static x86_64 musl release. Trunk downloads
`wasm-bindgen` and `wasm-opt` into `~/.cache/trunk` when a project does not
provide them. To use Guix-managed versions instead, install `wasm-bindgen-cli`
and `binaryen` and point Trunk's `tools` configuration at those executables;
the versions must match the `wasm-bindgen` crate used by the project.

## mullvad-vpn

Built from upstream source — `github.com/mullvad/mullvadvpn-app`, tag `2026.5` —
with `cargo-build-system`. It ships the Rust half of the client:

- `mullvad-daemon` — the privileged daemon that owns the tunnel
- `mullvad` — the command-line client
- `mullvad-exclude` — the split-tunnelling helper
- `mullvad-problem-report` — collects logs for the GUI's "Report a problem"

The Electron desktop GUI is a separate package, `mullvad-vpn-gui`; see
"Desktop client" below.

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
    mullvad-cli 2026.5
    $ mullvad-daemon --version
    mullvad-daemon 2026.5

The package also ships `mullvad-problem-report`, which the GUI runs for
"Report a problem".

Seven fixes beyond ordinary packaging were needed, each found in a build log
or at run time, and each worth knowing before touching this file:

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
- **That repository must carry the release tag.** `mullvad-version/build.rs`
  appends `-dev-<hash>` to the version unless HEAD is the commit tagged
  `2026.5`. An untagged commit made the daemon report `2026.5-dev-0efef7`; the
  GUI compares that with its own `2026.5` and showed "APP IS OUT OF SYNC.
  Please quit and restart the app." on every start, and the daemon treated
  itself as an unsupported dev build. The commit is tagged, and its dates are
  pinned to the release date so the hash is reproducible.

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
`resources/mullvad-daemon` and `resources/mullvad-problem-report` are symlinks
into the source-built `mullvad-vpn`, and `resources/relays.json` is the relay
list the daemon starts from.  Point the service at that directory:

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

Two run-time details are handled in the package:

- **The launcher clears `ELECTRON_RUN_AS_NODE`.** Electron-based tools
  (editors, agent shells) export it to their children. Inherited, it makes
  Electron run the app as plain Node, which dies at once with
  `The requested module 'electron' does not provide an export named 'screen'`.
- **`gsettings` is named by its store path.** The client asks it for the icon
  theme, to pick application icons on the split-tunnelling page, but runs it
  with an environment of only `XDG_CURRENT_DESKTOP`. Without `PATH` the shell
  finds no `gsettings` on Guix and the client logged "Error while retrieving
  theme" (exit 127) on every start. The build points it at glib's `gsettings`
  and passes `XDG_DATA_DIRS` and `GIO_EXTRA_MODULES` through, so it reads the
  session's real setting.

To check that client and daemon agree, look for these lines in
`~/.config/Mullvad VPN/logs/main.log` after starting the client:

    [info] Verified socket ownership
    [info] Connected to the daemon

and for the absence of `Inconsistent version`.


### Outstanding work

Ship the `cargo vendor` tree as a tarball (1.2 GB, so it cannot be committed)
and point `[source.vendored-sources]` at it with the lock kept. It needs
somewhere to host the tarball, or a `local-file` alongside the channel. Most of
that 1.2 GB is Windows-only crates (`windows`, `winapi`, ~500 MB) that Linux
never compiles, so pruning those before tarballing is worth doing.


### Tunnel implementation: no wireguard-go

Older clients spawned a `wireguard-go` binary from the resource directory;
**2026.5 does not**. On Linux the daemon creates a kernel WireGuard interface
over netlink (the `wireguard` module autoloads), and falls back to `gotatun`,
a userspace implementation compiled into the daemon, when the kernel module is
unavailable or a feature needs it (DAITA, some obfuscation modes).
`(patches wireguard)` still builds `wireguard-go`, but nothing in this channel
needs it any more, and a copy in the resource directory is ignored.

## Using the daemon on Guix System

Guix System uses the Shepherd, not systemd, so upstream's
`dist-assets/linux/mullvad-daemon.service` does not apply. This channel provides
a native service type instead.

1. Import the modules at the top of `/etc/config.scm`:

       (use-modules (guix gexp)
                    (patches services vpn)
                    (patches mullvad-gui))

2. Add the service to your `operating-system` definition:

       (operating-system
         ...
         (services
          (append (list (service mullvad-vpn-service-type
                                 (mullvad-vpn-configuration
                                  (resource-directory
                                   (file-append
                                    mullvad-vpn-gui
                                    "/libexec/mullvad-vpn/resources")))))
                  %desktop-services)))

3. Reconfigure:

       sudo guix system reconfigure /etc/config.scm

4. Inspect it:

       sudo herd status mullvad-daemon
       sudo herd log mullvad-daemon
       mullvad status

### Configuration fields

- `package` — default `mullvad-vpn`.
- `resource-directory` — default `#f`. Directory holding `relays.json`, the
  relay list the daemon starts from until it has fetched a current one;
  exported to the daemon as `MULLVAD_RESOURCE_DIR`. With `#f` the daemon
  resolves it relative to its own executable, which holds no `relays.json`.
- `settings-directory` — default `/var/lib/mullvad-vpn`. Holds `settings.json`
  (account number, relay preferences). Created with mode `0700` by an
  activation snippet before the daemon starts.
- `verbosity` — default `2`, i.e. `-vv`. Number of `-v` flags; `0` means
  error-only.
- `log-to-file?` — default `#t`. Also log to
  `/var/log/mullvad-vpn/daemon.log`, as upstream's unit does; the GUI's
  "Report a problem" page collects that file. With `#f` the daemon logs only
  to stdout.

The service runs `mullvad-daemon` with `--disable-stdout-timestamps`; stdout
goes to the Shepherd's log either way. It only requires `user-processes`; the
daemon manages its own routing and firewall configuration.

Two details beyond starting the daemon:

- **The daemon gets an explicit `PATH`.** `#:environment-variables` replaces
  the whole environment, and the daemon runs programs: `ip` (iproute2) to add
  the IPv6 address to a userspace tunnel, `resolvconf` (openresolv) to manage
  DNS, and `uname` for its platform report. On Guix System NetworkManager hands
  `resolv.conf` to openresolv, and NetworkManager 1.54 is newer than the daemon
  will drive for DNS, so `resolvconf` is the path that matters. Without `PATH`
  the daemon fell back to rewriting `/etc/resolv.conf` behind
  NetworkManager's back, and a userspace tunnel could not get its IPv6 address
  at all.
- **`mullvad-exclude` is installed setuid root** in `/run/privileged/bin`
  (linked from `/run/setuid-programs`, which comes first in `PATH`), as
  upstream's packages do. It joins the split-tunnelling cgroup, drops back to
  the caller's user and group, and execs the program; the GUI's
  split-tunnelling page runs it by name.

Check the running daemon with:

    sudo herd status mullvad-daemon
    mullvad version        # "Current version : 2026.5", "Is supported : true"
    ls -l /var/run/mullvad-vpn   # srwxrw-rw- root root

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

## opencode

`(patches opencode)` builds [opencode](https://github.com/anomalyco/opencode)
**2.2.5** from the release tarball, the same way upstream's release builds do:
`packages/cli/script/build.ts --single` builds the web UI (`packages/app`,
with Vite), then bundles the CLI with Bun into one executable that embeds the
web UI, the native libraries it loads, and the models.dev catalogue snapshot
committed in the source.

    guix build -L modules opencode
    guix install -L modules opencode

It installs `opencode` (and the `opencode2` alias upstream's npm package also
has) plus bash, zsh and fish completions.

The build checks `opencode --version`, and checks that the native files
embedded in the executable are the patched ones (see below). Also verified, in
a fresh `HOME` on 2026-11-05:

- `opencode models --standalone` lists the bundled catalogue.
- The TUI starts in a pseudo-terminal and draws its prompt, with
  `@parcel/watcher` subscribed.
- `opencode serve` returns the embedded web UI and its assets.
- A terminal created through the server API runs a shell. A persistent
  terminal also runs: its `opencode-pty` daemon was unpacked to
  `~/.cache/opencode/bin` and runs on the store's loader.

Attention sounds (PulseAudio/ALSA) and clipboard images (Wayland) were not
exercised.

The closure is 672 MiB; the executable alone is 241 MiB.

### Dependencies come through a loopback registry

`bun.lock` pins about 2,500 packages for the whole monorepo. With
`--frozen-lockfile`, `bun install` fetches no package metadata, only tarballs
whose URLs it derives from the lockfile, and it checks each against the
lockfile's sha512. `(patches npm opencode)` pins the 1,134 tarballs that this
install requests for `packages/cli` and `packages/app` (1,133 from npm, plus
`ghostty-web` from GitHub), one origin each, using the lockfile's sha512 values
as the Guix hashes.

During the build, a small Bun HTTP server on `127.0.0.1` serves those origins,
and `BUN_CONFIG_REGISTRY` and `GITHUB_API_URL` point Bun at it. Bun therefore
performs the real install: its isolated `node_modules` layout, the workspace
links, and the patches in `patches/` that `bun.lock` applies. Lifecycle
scripts are skipped, as in upstream's Nix packaging. This avoids hand-building
`node_modules`, which `mullvad-vpn-gui` does for its npm lockfile.

The tarball list was recorded rather than derived:
`tools/update-opencode-npm.sh` runs the same `bun install` against
`tools/opencode-registry-recorder.ts`, a stand-in registry that logs each
request and redirects it to the real one. `tools/opencode-npm.ts` then writes
the logged paths and their lockfile hashes to `modules/patches/npm/opencode.scm`.
After changing the version and source hash in `modules/patches/opencode.scm`, run:

    tools/update-opencode-npm.sh

The `bun install` flags in the script and in the package's
`install-node-modules` phase must match.

### Bun, patched with patchelf 0.18

`package.json` pins `bun@1.4.4`, which is `bun-bootstrap`. That package starts
Bun through `ld.so`, which makes `process.execPath` the loader. opencode cannot
build that way: `Bun.build({ compile })` creates the executable by copying the
running Bun, so it would copy `ld.so`.

The build therefore uses a private copy of Bun's release binary with its
`PT_INTERP` set to the store's loader by patchelf **0.18.0**. The warning under
"Why the bootstrap binary is wrapped" did not reproduce on 2026-11-05. Bun 1.4.4
patched with 0.18.0, or with 0.16.1, grows to the 107,317,128 bytes recorded
there. It runs, reports the correct `process.execPath`, and compiles
executables that run. Compiled programs keep their payload in a `.bun` ELF
section. The opencode executable copies the patched Bun, so it inherits the
store loader and runs directly. It is not stripped, as upstream also leaves it.

### Native code in the executable

The executable embeds prebuilt native files from npm and extracts them to a
temporary directory at run time. Before bundling, the build patches them in
`node_modules` for Guix:

- `libopentui.so` (OpenTUI's renderer) loads Wayland for clipboard images, and
  PulseAudio or ALSA for opencode's attention sounds, by soname with
  `dlopen()`. It gets a RUNPATH to those three libraries.
- `watcher.node` (`@parcel/watcher`) needs `libstdc++`/`libgcc_s`,
  which the Bun runtime does not load. It gets a RUNPATH to GCC's libraries.
- `opencode-pty` (`@opencode/pty`), the persistent-terminal helper, is an
  executable with the FHS interpreter. It gets the store's loader.

The wrapper in `bin/opencode` sets `OPENCODE_DISABLE_AUTOUPDATE=true`, so
opencode never tries to replace itself in the store, and appends ripgrep to
`PATH`. Otherwise opencode downloads its own `rg` into
`~/.cache/opencode/bin`.

### What is built, and what is prebuilt

Compiled from source here: opencode itself (every workspace package the CLI
and web UI use), the web UI, and the bundle. Prebuilt: the Bun runtime
(`bun-bootstrap`, the channel's only Bun) and the npm dependencies. Some of
those contain native code: OpenTUI, `@opencode/pty`, `@parcel/watcher`, fff,
and the Vite, Rolldown, Tailwind and LightningCSS build tools. `ghostty-web`
includes a prebuilt `ghostty-vt.wasm`. This matches how `mullvad-vpn-gui`
treats its npm dependencies.

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
