// A stand-in npm registry for recording what `bun install' downloads.
//
// Usage: bun tools/opencode-registry-recorder.ts LOG PORT
//
// Every request is appended to LOG as "GET /path" and answered with a redirect
// to the real host (registry.npmjs.org, or api.github.com for the
// /repos/<owner>/<repo>/tarball/<ref> requests made for github: dependencies),
// so Bun's own HTTP client does the downloading.  Point Bun at it with
// BUN_CONFIG_REGISTRY=http://127.0.0.1:PORT/ and GITHUB_API_URL=http://127.0.0.1:PORT.

const [logPath, port] = process.argv.slice(2)
const log = Bun.file(logPath).writer()
const server = Bun.serve({
  hostname: "127.0.0.1",
  port: Number(port ?? 0),
  fetch(request) {
    const url = new URL(request.url)
    log.write(`${request.method} ${url.pathname}\n`)
    log.flush()
    const host = url.pathname.startsWith("/repos/") ? "https://api.github.com" : "https://registry.npmjs.org"
    return Response.redirect(host + url.pathname + url.search, 302)
  },
})
console.log(server.port)
