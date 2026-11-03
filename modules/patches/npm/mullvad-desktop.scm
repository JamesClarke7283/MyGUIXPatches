;;; -*- mode: scheme; -*-
;;;
;;; npm dependency origins for the Mullvad desktop GUI.
;;;
;;; Generated from desktop/package-lock.json of mullvadvpn-app 2026.5.
;;; Each element is (PATH . ORIGIN), where PATH is the node_modules
;;; path npm would install the package at, and ORIGIN is its tarball.

(define-module (patches npm mullvad-desktop)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:export (%mullvad-desktop-npm-sources))

(define %mullvad-desktop-npm-sources
  (list
   (cons "node_modules/@babel/code-frame"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/code-frame/-/code-frame-7.29.7.tgz")
                 (sha256 (base32 "0rwwq509ywaizggi0l54awqr6xag3wzl8cxd84mxgldml1pig2zs"))))
   (cons "node_modules/@babel/compat-data"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/compat-data/-/compat-data-7.29.7.tgz")
                 (sha256 (base32 "1fal7mxcp45nvfwad5f7fa43zsxjhdc07gklfpf4nr84sxg3pxhc"))))
   (cons "node_modules/@babel/core"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/core/-/core-7.29.7.tgz")
                 (sha256 (base32 "1lqfi8f86sxma5naq9rz06l49dcs74xz20cy1sm9vhib7n5lbpa6"))))
   (cons "node_modules/@babel/core/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.3.7.tgz")
                 (sha256 (base32 "1b0l57hhmk4glxfqzgmgbd8pa1k4gwpya3hmyxsplnw3kg5ah0y8"))))
   (cons "node_modules/@babel/core/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/@babel/core/node_modules/semver"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/semver/-/semver-6.3.1.tgz")
                 (sha256 (base32 "0c0jxgjhgpxx7hdbmwghndq2mdpg58295mwv1b8cp6g070m096rw"))))
   (cons "node_modules/@babel/generator"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/generator/-/generator-7.29.7.tgz")
                 (sha256 (base32 "1ghsiwvl1nxn145vsdwv942bmhqkiyb6ksknisyfm19mxsn7vzfm"))))
   (cons "node_modules/@babel/helper-annotate-as-pure"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/helper-annotate-as-pure/-/helper-annotate-as-pure-7.24.7.tgz")
                 (sha256 (base32 "1bh5x0xim4m8nd13ln86w0xrv2s7kyrv5fi5k5lr4jm2n36zd1wj"))))
   (cons "node_modules/@babel/helper-compilation-targets"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/helper-compilation-targets/-/helper-compilation-targets-7.29.7.tgz")
                 (sha256 (base32 "1q1lp5mdx9jm23kigf6pmkdcvbvnbvvgb2ihrcwbl41bsgrlcm2v"))))
   (cons "node_modules/@babel/helper-compilation-targets/node_modules/lru-cache"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/lru-cache/-/lru-cache-5.1.1.tgz")
                 (sha256 (base32 "0nj8d71w5yb3rmiaxby5scwfl0n1jdaplr0p6dp619j4jn0ph7mi"))))
   (cons "node_modules/@babel/helper-compilation-targets/node_modules/semver"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/semver/-/semver-6.3.1.tgz")
                 (sha256 (base32 "0c0jxgjhgpxx7hdbmwghndq2mdpg58295mwv1b8cp6g070m096rw"))))
   (cons "node_modules/@babel/helper-compilation-targets/node_modules/yallist"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/yallist/-/yallist-3.1.1.tgz")
                 (sha256 (base32 "016afm3iv7pfrg9nj7952dph6sg00lryk8wv4nr0qdp8rzk4mwah"))))
   (cons "node_modules/@babel/helper-create-class-features-plugin"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/helper-create-class-features-plugin/-/helper-create-class-features-plugin-7.25.4.tgz")
                 (sha256 (base32 "0mps5ai0v5g19qwcrz11nr2aq5rdzchk917c873yl4diav77yj7y"))))
   (cons "node_modules/@babel/helper-create-class-features-plugin/node_modules/semver"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/semver/-/semver-6.3.1.tgz")
                 (sha256 (base32 "0c0jxgjhgpxx7hdbmwghndq2mdpg58295mwv1b8cp6g070m096rw"))))
   (cons "node_modules/@babel/helper-globals"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/helper-globals/-/helper-globals-7.29.7.tgz")
                 (sha256 (base32 "0grabnbgzmyl9lqh7iypvmnwfg88453lkwc1am72rbls90n9dywl"))))
   (cons "node_modules/@babel/helper-member-expression-to-functions"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/helper-member-expression-to-functions/-/helper-member-expression-to-functions-7.24.8.tgz")
                 (sha256 (base32 "12iwfmziqxpn0jlqhkqi9jva0hfc3ik63ryyy2f42pjxcq9jldg1"))))
   (cons "node_modules/@babel/helper-module-imports"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/helper-module-imports/-/helper-module-imports-7.29.7.tgz")
                 (sha256 (base32 "033prrn6sv3zipf15hd31g19ckx3kham3wbhczhmr1vvb77ldpsb"))))
   (cons "node_modules/@babel/helper-module-transforms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/helper-module-transforms/-/helper-module-transforms-7.29.7.tgz")
                 (sha256 (base32 "1r768nx6lllw0salkmbb9i3518dihmv339jqmzsjha0a1fqvkcyv"))))
   (cons "node_modules/@babel/helper-optimise-call-expression"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/helper-optimise-call-expression/-/helper-optimise-call-expression-7.24.7.tgz")
                 (sha256 (base32 "1slz964rfy2s3p61qm9s1q7wwz2khx4cl55hqv17bnp27qcl02za"))))
   (cons "node_modules/@babel/helper-plugin-utils"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/helper-plugin-utils/-/helper-plugin-utils-7.27.1.tgz")
                 (sha256 (base32 "0wg5rsi8z7smhcgmsmzfaxp3v1sdjlhx330lsz1m1pchb1369439"))))
   (cons "node_modules/@babel/helper-replace-supers"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/helper-replace-supers/-/helper-replace-supers-7.25.0.tgz")
                 (sha256 (base32 "0fxpsg3yhyw1chv29ld1rnwxwh5mmv5r0hni63r4hn73zr6rkhgv"))))
   (cons "node_modules/@babel/helper-skip-transparent-expression-wrappers"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/helper-skip-transparent-expression-wrappers/-/helper-skip-transparent-expression-wrappers-7.24.7.tgz")
                 (sha256 (base32 "1nfkdjmalcd59in9q4dmql1afya978438sr7pl8c3paprz0k56xw"))))
   (cons "node_modules/@babel/helper-string-parser"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/helper-string-parser/-/helper-string-parser-7.29.7.tgz")
                 (sha256 (base32 "09yizqbgb57pdbyxv284bzjrdwn4s6qsc2q6fdwiimq0sgn6ai8j"))))
   (cons "node_modules/@babel/helper-validator-identifier"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/helper-validator-identifier/-/helper-validator-identifier-7.29.7.tgz")
                 (sha256 (base32 "07ywjzwh0xw22zazdw2bzckllvr929ypkpg5slrb46szqi5r0cbs"))))
   (cons "node_modules/@babel/helper-validator-option"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/helper-validator-option/-/helper-validator-option-7.29.7.tgz")
                 (sha256 (base32 "1kg44680yhgy52rxf5zfhcdxdqdn5i6q9w4j1whwam84rkr8ybg3"))))
   (cons "node_modules/@babel/helpers"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/helpers/-/helpers-7.29.7.tgz")
                 (sha256 (base32 "1ij2grdm74j2ixpmb096rhb2cw931j0ryb45vqjh4bcg5qvxip47"))))
   (cons "node_modules/@babel/parser"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/parser/-/parser-7.29.7.tgz")
                 (sha256 (base32 "1nwiqpa5l6nrynqrk6gk28cgi3vfdmj009ynq77km0643khypb09"))))
   (cons "node_modules/@babel/plugin-proposal-private-methods"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/plugin-proposal-private-methods/-/plugin-proposal-private-methods-7.18.6.tgz")
                 (sha256 (base32 "0r29ljkncgs298h8mh36vn1lzk56jvz96a0yfjzd0c2qiafm54hj"))))
   (cons "node_modules/@babel/plugin-transform-react-jsx-self"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/plugin-transform-react-jsx-self/-/plugin-transform-react-jsx-self-7.27.1.tgz")
                 (sha256 (base32 "1kkbnqa0bqa9k6ybqpiwjm2md9klmwmq8pvl0xijdflx6wkrds73"))))
   (cons "node_modules/@babel/plugin-transform-react-jsx-source"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/plugin-transform-react-jsx-source/-/plugin-transform-react-jsx-source-7.27.1.tgz")
                 (sha256 (base32 "0lgzvps1sq13lyf8c3g7vgwcl3pg5gn4xykxg2qyml9ilq46vbpv"))))
   (cons "node_modules/@babel/runtime"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/runtime/-/runtime-7.26.10.tgz")
                 (sha256 (base32 "1j8a75jfjrrax0h2w5pxvf60lnrxl5mxvbyn4fwrh2hnp28x6wm3"))))
   (cons "node_modules/@babel/template"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/template/-/template-7.29.7.tgz")
                 (sha256 (base32 "0r3p1rd4jswaqz368akc2gci0j5qdw4hznpjbz7qds9nan6y43jy"))))
   (cons "node_modules/@babel/traverse"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/traverse/-/traverse-7.29.7.tgz")
                 (sha256 (base32 "1bb6wb9ariqf64nh1za72syrv6bk3jl2h3rmyf5bd2bd273p1h8p"))))
   (cons "node_modules/@babel/traverse/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.3.7.tgz")
                 (sha256 (base32 "1b0l57hhmk4glxfqzgmgbd8pa1k4gwpya3hmyxsplnw3kg5ah0y8"))))
   (cons "node_modules/@babel/traverse/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/@babel/types"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@babel/types/-/types-7.29.7.tgz")
                 (sha256 (base32 "0b259gr6xy5d4gd8pykqcy0ncm5cda3sl05jb4jc15adjfbii828"))))
   (cons "node_modules/@electron-internal/extract-zip"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@electron-internal/extract-zip/-/extract-zip-1.0.5.tgz")
                 (sha256 (base32 "02rpynbg0q863wgwdj9wj03dyzbqc8644kyx76rs33sgjxi496wk"))))
   (cons "node_modules/@electron/asar"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@electron/asar/-/asar-3.4.1.tgz")
                 (sha256 (base32 "00k1g51cz2wxccr5zpiz5gfq8h4z5r8h8brq2dwwa5z6mm9cxrn4"))))
   (cons "node_modules/@electron/fuses"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@electron/fuses/-/fuses-1.8.0.tgz")
                 (sha256 (base32 "0jz7mcw0phfrg1avi8s22w4lkai9mdcqr11qmcdx3351x52phy3y"))))
   (cons "node_modules/@electron/fuses/node_modules/fs-extra"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fs-extra/-/fs-extra-9.1.0.tgz")
                 (sha256 (base32 "0fniby4ck1ihrbwkjfgpdxcci03hrn1p938c333298gcs6hzhw1x"))))
   (cons "node_modules/@electron/get"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@electron/get/-/get-5.0.0.tgz")
                 (sha256 (base32 "0c70biqxcff48z2ghb1mjkzw90zyfh16fz8yq7ywg5h6sczx8hrf"))))
   (cons "node_modules/@electron/get/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.4.3.tgz")
                 (sha256 (base32 "19z48fpic8jbb2833gh3bviylzp9512i2dsqhxd91s3fjjfarhc9"))))
   (cons "node_modules/@electron/get/node_modules/env-paths"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/env-paths/-/env-paths-3.0.0.tgz")
                 (sha256 (base32 "1j5700g802l6130h801xdwg32jnq3mwd0cxdh59whayayvbsmqm8"))))
   (cons "node_modules/@electron/get/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/@electron/notarize"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@electron/notarize/-/notarize-2.5.0.tgz")
                 (sha256 (base32 "1mxpp646bbvrygjh3jj7s2hm39zrzxyxv4lx3pgwsw3gchb9fxwf"))))
   (cons "node_modules/@electron/notarize/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.4.3.tgz")
                 (sha256 (base32 "19z48fpic8jbb2833gh3bviylzp9512i2dsqhxd91s3fjjfarhc9"))))
   (cons "node_modules/@electron/notarize/node_modules/fs-extra"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fs-extra/-/fs-extra-9.1.0.tgz")
                 (sha256 (base32 "0fniby4ck1ihrbwkjfgpdxcci03hrn1p938c333298gcs6hzhw1x"))))
   (cons "node_modules/@electron/notarize/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/@electron/osx-sign"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@electron/osx-sign/-/osx-sign-1.3.3.tgz")
                 (sha256 (base32 "0s5zi550c22ql2jmy8cyb1zwvh9yrbfmx4cbpmhdk0g624h4jd4v"))))
   (cons "node_modules/@electron/osx-sign/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.4.3.tgz")
                 (sha256 (base32 "19z48fpic8jbb2833gh3bviylzp9512i2dsqhxd91s3fjjfarhc9"))))
   (cons "node_modules/@electron/osx-sign/node_modules/isbinaryfile"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/isbinaryfile/-/isbinaryfile-4.0.10.tgz")
                 (sha256 (base32 "0jwgr66c9qv2jnibvhahqpqqj99h39ch16gzyn8dwqprbbq887wg"))))
   (cons "node_modules/@electron/osx-sign/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/@electron/rebuild"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@electron/rebuild/-/rebuild-4.2.0.tgz")
                 (sha256 (base32 "0grzb6mv0rjhy2j1aj0znw0xv3jx5i8jggxxp6vngzgwdrzxxjiw"))))
   (cons "node_modules/@electron/rebuild/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.4.3.tgz")
                 (sha256 (base32 "19z48fpic8jbb2833gh3bviylzp9512i2dsqhxd91s3fjjfarhc9"))))
   (cons "node_modules/@electron/rebuild/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/@electron/universal"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@electron/universal/-/universal-2.0.3.tgz")
                 (sha256 (base32 "12zgxqqd0x73r2vx7j8lhm9hh3nzyf5g3q8yfl5m6xysk2fnrjr0"))))
   (cons "node_modules/@electron/universal/node_modules/brace-expansion"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/brace-expansion/-/brace-expansion-2.1.2.tgz")
                 (sha256 (base32 "19f83xr12lbhj7sx4cqsvdmdwzgajgsfw2v257y2gccq5qfzld43"))))
   (cons "node_modules/@electron/universal/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.4.3.tgz")
                 (sha256 (base32 "19z48fpic8jbb2833gh3bviylzp9512i2dsqhxd91s3fjjfarhc9"))))
   (cons "node_modules/@electron/universal/node_modules/fs-extra"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fs-extra/-/fs-extra-11.4.0.tgz")
                 (sha256 (base32 "0lzc4y11nj144qf77xs1afi5kvmyn24k4xnv4rhnwl5ii7grpiij"))))
   (cons "node_modules/@electron/universal/node_modules/minimatch"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/minimatch/-/minimatch-9.0.9.tgz")
                 (sha256 (base32 "0y04nhx30qi0ab8ipnr93mqy40qm928w33n7jch59khpxyiwja3x"))))
   (cons "node_modules/@electron/universal/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/@electron/windows-sign"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@electron/windows-sign/-/windows-sign-1.2.2.tgz")
                 (sha256 (base32 "1jb9hgdnr8ig0sq3g9x1gqaispsfx1bpjqsflzyvnx0jxlq9nydc"))))
   (cons "node_modules/@electron/windows-sign/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.4.3.tgz")
                 (sha256 (base32 "19z48fpic8jbb2833gh3bviylzp9512i2dsqhxd91s3fjjfarhc9"))))
   (cons "node_modules/@electron/windows-sign/node_modules/fs-extra"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fs-extra/-/fs-extra-11.4.0.tgz")
                 (sha256 (base32 "0lzc4y11nj144qf77xs1afi5kvmyn24k4xnv4rhnwl5ii7grpiij"))))
   (cons "node_modules/@electron/windows-sign/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/@emotion/is-prop-valid"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@emotion/is-prop-valid/-/is-prop-valid-1.2.2.tgz")
                 (sha256 (base32 "05cv2l171bi7hvyf2ssy8zaqqy604nfpvngjd3xabbpgysx243y5"))))
   (cons "node_modules/@emotion/memoize"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@emotion/memoize/-/memoize-0.8.1.tgz")
                 (sha256 (base32 "1fpl01xzxcd9ygydxxd19f1nww284jcdzicqcz5rz8q01d4x7vp1"))))
   (cons "node_modules/@emotion/unitless"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@emotion/unitless/-/unitless-0.8.1.tgz")
                 (sha256 (base32 "0cbv53lkv474h8pxqwi3izpgm9vbqgcrk3vvk7algi39rz38gvaw"))))
   (cons "node_modules/@esbuild/aix-ppc64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/aix-ppc64/-/aix-ppc64-0.27.3.tgz")
                 (sha256 (base32 "1pf135f21gs5va56f9gn0532sdrr6jyy0jgmhphsyf2lwds20q99"))))
   (cons "node_modules/@esbuild/android-arm"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/android-arm/-/android-arm-0.27.3.tgz")
                 (sha256 (base32 "0p16a3dfgj8lcdvyxq8byyhy203k1lkbqjb4ac8p4a1bfcd0360f"))))
   (cons "node_modules/@esbuild/android-arm64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/android-arm64/-/android-arm64-0.27.3.tgz")
                 (sha256 (base32 "0q53f9h80r4aramwsk016xrjm9b7qg8vy0j5855l4xghhn0snlzp"))))
   (cons "node_modules/@esbuild/android-x64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/android-x64/-/android-x64-0.27.3.tgz")
                 (sha256 (base32 "0cgj5h5bfmvl4m59kl7hnagnzzs8wc8crad68b3cmvwxw4kyr1cl"))))
   (cons "node_modules/@esbuild/darwin-arm64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/darwin-arm64/-/darwin-arm64-0.27.3.tgz")
                 (sha256 (base32 "0cyjds8y4k76s8kq614kvjd4j7h668cm1srs8kk218q89jmfqzx7"))))
   (cons "node_modules/@esbuild/darwin-x64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/darwin-x64/-/darwin-x64-0.27.3.tgz")
                 (sha256 (base32 "1v79kbs9x53pz4vdsxxfc6njx7sh4043acg6f8i0ijg19gab04rb"))))
   (cons "node_modules/@esbuild/freebsd-arm64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/freebsd-arm64/-/freebsd-arm64-0.27.3.tgz")
                 (sha256 (base32 "1ys2g070bi7f3mwqdhkn257mlxr2c4xwc3ga87jazb61skf7fadp"))))
   (cons "node_modules/@esbuild/freebsd-x64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/freebsd-x64/-/freebsd-x64-0.27.3.tgz")
                 (sha256 (base32 "1hspsyghlv01f69fd4df995122fqz05p76hs1djd8cnrdgyihshx"))))
   (cons "node_modules/@esbuild/linux-arm"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/linux-arm/-/linux-arm-0.27.3.tgz")
                 (sha256 (base32 "1n7kaj19ack9al3fkg1n7zzmmj4qr4zj2dm55ph21bqk2d84967x"))))
   (cons "node_modules/@esbuild/linux-arm64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/linux-arm64/-/linux-arm64-0.27.3.tgz")
                 (sha256 (base32 "0bvi0jcqncbihpy2gh1l4hgg9bd7sydalb5j4c681c5q6aqvzw04"))))
   (cons "node_modules/@esbuild/linux-ia32"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/linux-ia32/-/linux-ia32-0.27.3.tgz")
                 (sha256 (base32 "1w89x4rhgviq5z3ybw60vnr0s5yi6yvk4s04s86wc9yhhq4mwg58"))))
   (cons "node_modules/@esbuild/linux-loong64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/linux-loong64/-/linux-loong64-0.27.3.tgz")
                 (sha256 (base32 "1awffcqyxhy44q60wch6fj6ybn5amm65h11mzlwqrhnzlqqzfamj"))))
   (cons "node_modules/@esbuild/linux-mips64el"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/linux-mips64el/-/linux-mips64el-0.27.3.tgz")
                 (sha256 (base32 "02j50z58m7dr4xam19lx0kc6d93138rqz3m88p545xx522j59wiy"))))
   (cons "node_modules/@esbuild/linux-ppc64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/linux-ppc64/-/linux-ppc64-0.27.3.tgz")
                 (sha256 (base32 "01rxhb50d6cqj9s9lcx7wghfvd86z41wq6cws76z7zwq3sqsqg1q"))))
   (cons "node_modules/@esbuild/linux-riscv64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/linux-riscv64/-/linux-riscv64-0.27.3.tgz")
                 (sha256 (base32 "12dlghbqrzv8xy6y6l6vxqmxvaa4fv1v55svj8n7wphzabc22ryp"))))
   (cons "node_modules/@esbuild/linux-s390x"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/linux-s390x/-/linux-s390x-0.27.3.tgz")
                 (sha256 (base32 "1j11f8jh921g44zimvb5j2z6xy61f9rw5ybr5czhfj9p0d7yp8vx"))))
   (cons "node_modules/@esbuild/linux-x64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/linux-x64/-/linux-x64-0.27.3.tgz")
                 (sha256 (base32 "1cjswqxlk9l0avgpq35ap67680vyp59aa945w5h436c2p36j0vh6"))))
   (cons "node_modules/@esbuild/netbsd-arm64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/netbsd-arm64/-/netbsd-arm64-0.27.3.tgz")
                 (sha256 (base32 "0xa5kjzfnvbhy6j33np543aaryk3s40q3jcdh583jdzjzq4l143x"))))
   (cons "node_modules/@esbuild/netbsd-x64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/netbsd-x64/-/netbsd-x64-0.27.3.tgz")
                 (sha256 (base32 "0sjac2527whx8wxa582and6n42n9yh4krckpgazfb4ildjdgv194"))))
   (cons "node_modules/@esbuild/openbsd-arm64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/openbsd-arm64/-/openbsd-arm64-0.27.3.tgz")
                 (sha256 (base32 "0bc7vhs3fy2g8n4b6mhqka6vnp30gfxrhzzphdca4yd3a9m0hv3c"))))
   (cons "node_modules/@esbuild/openbsd-x64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/openbsd-x64/-/openbsd-x64-0.27.3.tgz")
                 (sha256 (base32 "1pfr5rmd4d3azq2pp7yi1bvx5c4pd2q4d52r50qmy86s12kllkmg"))))
   (cons "node_modules/@esbuild/openharmony-arm64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/openharmony-arm64/-/openharmony-arm64-0.27.3.tgz")
                 (sha256 (base32 "02q82vbrijghcrf6ciyia3vfszhhf8gbyz2mr9xqhnz2a6wcx1pq"))))
   (cons "node_modules/@esbuild/sunos-x64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/sunos-x64/-/sunos-x64-0.27.3.tgz")
                 (sha256 (base32 "1zh1pa0500i5pz7rhzpq594ydlbfcn8vsw4h1m5p8wcc0y5j3615"))))
   (cons "node_modules/@esbuild/win32-arm64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/win32-arm64/-/win32-arm64-0.27.3.tgz")
                 (sha256 (base32 "1d2hzz637nprsynxjag6cj2y0vmycajhhicj4qj6x0phac79yl8b"))))
   (cons "node_modules/@esbuild/win32-ia32"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/win32-ia32/-/win32-ia32-0.27.3.tgz")
                 (sha256 (base32 "0ysc8clba3x8xvpjw0b35h7l3h3byjhcckwk45gccm12fxdf9cjc"))))
   (cons "node_modules/@esbuild/win32-x64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@esbuild/win32-x64/-/win32-x64-0.27.3.tgz")
                 (sha256 (base32 "1wampcddjxdi1i0wyglgblcqf38v5f71s6qfb011jhlw0nr0ryfk"))))
   (cons "node_modules/@eslint-community/eslint-utils"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@eslint-community/eslint-utils/-/eslint-utils-4.4.0.tgz")
                 (sha256 (base32 "0g3sxd90sf6rvmmvhlnsiahmd6xi1z1ijvmvf9pgwv0cldyskdsm"))))
   (cons "node_modules/@eslint-community/regexpp"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@eslint-community/regexpp/-/regexpp-4.12.1.tgz")
                 (sha256 (base32 "0xy6978dlwkbkvzvqa7pcr4h62yz4krvh309k69qf1x4f7wvr0sn"))))
   (cons "node_modules/@eslint/config-array"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@eslint/config-array/-/config-array-0.21.0.tgz")
                 (sha256 (base32 "0b519ydms6rv1iji9ink38kh5hdh0nqpcj67ibfwz4870qvn0l8w"))))
   (cons "node_modules/@eslint/config-array/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.4.1.tgz")
                 (sha256 (base32 "1knsscg6xbni9rj66a0p27x1zxsaixvwljgq930vk2ahy33afp16"))))
   (cons "node_modules/@eslint/config-array/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/@eslint/config-helpers"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@eslint/config-helpers/-/config-helpers-0.3.0.tgz")
                 (sha256 (base32 "0x04830w8xpkxsp8qlifjq5qjnanmm0dqxh5ldxc1hscxng7h6i3"))))
   (cons "node_modules/@eslint/core"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@eslint/core/-/core-0.15.1.tgz")
                 (sha256 (base32 "1xq0w8jnxhy58c9pp9icxmsj9i0cx86b7bz3j3ww2h3h0pq1w9c6"))))
   (cons "node_modules/@eslint/eslintrc"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@eslint/eslintrc/-/eslintrc-3.3.1.tgz")
                 (sha256 (base32 "0zm9306arbqgvivnsmx663rxfgl4ip9iy2d90kg22hr5spiaczy9"))))
   (cons "node_modules/@eslint/eslintrc/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.4.1.tgz")
                 (sha256 (base32 "1knsscg6xbni9rj66a0p27x1zxsaixvwljgq930vk2ahy33afp16"))))
   (cons "node_modules/@eslint/eslintrc/node_modules/globals"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/globals/-/globals-14.0.0.tgz")
                 (sha256 (base32 "0slfz1j71kb619caq286ipfix1qgnkrpbih85x1irjjxk41arfzs"))))
   (cons "node_modules/@eslint/eslintrc/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/@eslint/js"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@eslint/js/-/js-9.31.0.tgz")
                 (sha256 (base32 "0pvmgk60rdlb25c2mkdi7n6m4yvkpx1xcfhj6dw4b81svlviyhd9"))))
   (cons "node_modules/@eslint/object-schema"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@eslint/object-schema/-/object-schema-2.1.6.tgz")
                 (sha256 (base32 "060y3shy2zrd2mk8ls8hkxwsvfpxl11jnl2pf5ywnlgbfpg6hzxs"))))
   (cons "node_modules/@eslint/plugin-kit"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@eslint/plugin-kit/-/plugin-kit-0.3.4.tgz")
                 (sha256 (base32 "0iil7np8f665d62kkyz86h6yiry5c3h3hdhmmkdqmah641dkhmwp"))))
   (cons "node_modules/@grpc/grpc-js"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@grpc/grpc-js/-/grpc-js-1.14.4.tgz")
                 (sha256 (base32 "11p0dsflpr8h7kdgjw8dhjnbkmbh6k9y42kcnw4h63amdxxqja7n"))))
   (cons "node_modules/@grpc/proto-loader"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@grpc/proto-loader/-/proto-loader-0.8.0.tgz")
                 (sha256 (base32 "07gbjv23y40yxka5c15bx653zmzkfcyrqglr9b5mclnh8k31p9wl"))))
   (cons "node_modules/@humanfs/core"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@humanfs/core/-/core-0.19.1.tgz")
                 (sha256 (base32 "0vr6mdaafks4if0m5n23zqbb5ivmw33da0xhbji1d98mqm55ya25"))))
   (cons "node_modules/@humanfs/node"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@humanfs/node/-/node-0.16.6.tgz")
                 (sha256 (base32 "17fmlpi7k3y8rscy26iqfv8iprnkws0g4bim858ca74ci1zzzq8h"))))
   (cons "node_modules/@humanfs/node/node_modules/@humanwhocodes/retry"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@humanwhocodes/retry/-/retry-0.3.1.tgz")
                 (sha256 (base32 "1hkdadz0ix0ph0f9aiwgzrwd88fq0d1wfm3kh97wxdbhrxd252rq"))))
   (cons "node_modules/@humanwhocodes/module-importer"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@humanwhocodes/module-importer/-/module-importer-1.0.1.tgz")
                 (sha256 (base32 "06hg3l6kmjml65ks9d4g3x83xndi50vnkngrgav0zibnr4qdy5k9"))))
   (cons "node_modules/@humanwhocodes/retry"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@humanwhocodes/retry/-/retry-0.4.3.tgz")
                 (sha256 (base32 "1012l1avlfw5zcrljg6cwmy0gcb1mdqz0l6m09aixa8kh3gasx3p"))))
   (cons "node_modules/@isaacs/fs-minipass"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@isaacs/fs-minipass/-/fs-minipass-4.0.1.tgz")
                 (sha256 (base32 "0dl2v4741w4lj36m2yg1h8qpvfbbxyfh7qkr1scah7ncrkiqdhks"))))
   (cons "node_modules/@jridgewell/gen-mapping"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@jridgewell/gen-mapping/-/gen-mapping-0.3.13.tgz")
                 (sha256 (base32 "10h05zv5qcbxiz5wslzqv1aik7zl0cfqiarqhw63xmpnq5cgc5mw"))))
   (cons "node_modules/@jridgewell/remapping"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@jridgewell/remapping/-/remapping-2.3.5.tgz")
                 (sha256 (base32 "00hssw2k05fxp4fgjk9182bgynx2b4slfcvwwir6dlcslf16gcbh"))))
   (cons "node_modules/@jridgewell/resolve-uri"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@jridgewell/resolve-uri/-/resolve-uri-3.1.0.tgz")
                 (sha256 (base32 "1c0nxqsc2pjm4d5glk03s0a8q7fq5a2hi7kdj8kkp0dl72mv4k7y"))))
   (cons "node_modules/@jridgewell/sourcemap-codec"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.5.5.tgz")
                 (sha256 (base32 "11b5h4hihb2n8203znalqm53s7pv82a84jahsqgf7rd2406kpba7"))))
   (cons "node_modules/@jridgewell/trace-mapping"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@jridgewell/trace-mapping/-/trace-mapping-0.3.31.tgz")
                 (sha256 (base32 "1krw8nqmca9k4gb20kh9mpfsjb2b6ggrx226haz5l3b336hp2k66"))))
   (cons "node_modules/@js-sdsl/ordered-map"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@js-sdsl/ordered-map/-/ordered-map-4.4.2.tgz")
                 (sha256 (base32 "0xklyiac8aad07ahma7xsjy8ai28bnq7g8c5naz8vh327ra7fna4"))))
   (cons "node_modules/@malept/cross-spawn-promise"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@malept/cross-spawn-promise/-/cross-spawn-promise-2.0.0.tgz")
                 (sha256 (base32 "1fnjkqd3wawnnghhwsa01wy9n920g7hwxw5qb2239fh8lfzinzbr"))))
   (cons "node_modules/@malept/flatpak-bundler"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@malept/flatpak-bundler/-/flatpak-bundler-0.4.0.tgz")
                 (sha256 (base32 "1iipi2r4bhpikb8s37jxarpc7g3iypc6a6gvv6hkwq0pr44kpv8v"))))
   (cons "node_modules/@malept/flatpak-bundler/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.4.3.tgz")
                 (sha256 (base32 "19z48fpic8jbb2833gh3bviylzp9512i2dsqhxd91s3fjjfarhc9"))))
   (cons "node_modules/@malept/flatpak-bundler/node_modules/fs-extra"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fs-extra/-/fs-extra-9.1.0.tgz")
                 (sha256 (base32 "0fniby4ck1ihrbwkjfgpdxcci03hrn1p938c333298gcs6hzhw1x"))))
   (cons "node_modules/@malept/flatpak-bundler/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/@neon-rs/load"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@neon-rs/load/-/load-0.1.81.tgz")
                 (sha256 (base32 "1ry1vwr2vl2cr6mshnwidqvbrwfgqfhwcgblyrix7r1f7f2ymyv5"))))
   (cons "node_modules/@noble/hashes"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@noble/hashes/-/hashes-2.3.0.tgz")
                 (sha256 (base32 "1b5yr1k671q6bb1g50fa9ym7iz6dp92hjx2w467fmp95vpsq28l9"))))
   (cons "node_modules/@nodelib/fs.scandir"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@nodelib/fs.scandir/-/fs.scandir-2.1.5.tgz")
                 (sha256 (base32 "0k7r1kjscdfbm2ckdgvq13zgycd4mci1admxn3dqp3n72yivy959"))))
   (cons "node_modules/@nodelib/fs.stat"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@nodelib/fs.stat/-/fs.stat-2.0.5.tgz")
                 (sha256 (base32 "0sqkaapvl86zldyw00j920hv4yncwb14nbgwnf3wl6pja4sm7y6q"))))
   (cons "node_modules/@nodelib/fs.walk"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@nodelib/fs.walk/-/fs.walk-1.2.8.tgz")
                 (sha256 (base32 "0gbxfa920a6ykrl8a4phhvlwgybvivm2z10yyybww8mqd4gn5yfb"))))
   (cons "node_modules/@peculiar/asn1-schema"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@peculiar/asn1-schema/-/asn1-schema-2.8.0.tgz")
                 (sha256 (base32 "010425z02kl40xrllks94c74qj3gfwccl82sv33a274hml87n8rn"))))
   (cons "node_modules/@peculiar/json-schema"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@peculiar/json-schema/-/json-schema-1.1.12.tgz")
                 (sha256 (base32 "0m45jqgd5156rgfpfkd2zdjia6cszzpc4m7ipc7w3p38n7rqkhsk"))))
   (cons "node_modules/@peculiar/utils"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@peculiar/utils/-/utils-2.0.3.tgz")
                 (sha256 (base32 "1hmwryzp6ml28r3bbxqsg7crskywmdf82h6z51rz6mlrps6w4fpi"))))
   (cons "node_modules/@peculiar/webcrypto"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@peculiar/webcrypto/-/webcrypto-1.7.1.tgz")
                 (sha256 (base32 "0x3bk42r5f1wlsr2f1wsx590jslmj0zxb81x3y9n17v8gl64037z"))))
   (cons "node_modules/@pkgr/core"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@pkgr/core/-/core-0.1.1.tgz")
                 (sha256 (base32 "1nlv78j33vdpbvzsw4ygyz80jh4nl3dyl8c80a7x0ragph6p4s3q"))))
   (cons "node_modules/@playwright/test"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@playwright/test/-/test-1.55.1.tgz")
                 (sha256 (base32 "1g7l2bcka8963nspqjzdly9m6a3k3n0gh5g62c4gzfn33y0h9gic"))))
   (cons "node_modules/@protobufjs/aspromise"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@protobufjs/aspromise/-/aspromise-1.1.2.tgz")
                 (sha256 (base32 "06f1w67bgnw3zr7hbhv0yfbzz5mwbqsnc1jyri5zmwh9ha5qfh80"))))
   (cons "node_modules/@protobufjs/base64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@protobufjs/base64/-/base64-1.1.2.tgz")
                 (sha256 (base32 "0shs0f28zn7q7vprwlh6kzfrnmsg2h94rhyzii3i4ma4w7k6wznn"))))
   (cons "node_modules/@protobufjs/codegen"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@protobufjs/codegen/-/codegen-2.0.5.tgz")
                 (sha256 (base32 "009sl5cds5r1ikixc091pib9mvysiscl3a2h4hxa5jqv4b8zxfi0"))))
   (cons "node_modules/@protobufjs/eventemitter"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@protobufjs/eventemitter/-/eventemitter-1.1.1.tgz")
                 (sha256 (base32 "0z3r58vyqxn745pq700l9w1l1gif6n785ldd3lf7fbh6ny6bjdjm"))))
   (cons "node_modules/@protobufjs/fetch"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@protobufjs/fetch/-/fetch-1.1.1.tgz")
                 (sha256 (base32 "0s3jicdxhgqjsrdi18qvpgvp6fzbiqsz4f82ig1y3g6ycaf1sj2l"))))
   (cons "node_modules/@protobufjs/float"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@protobufjs/float/-/float-1.0.2.tgz")
                 (sha256 (base32 "0bbivv9vgs7myqayb6akklb35470lvkahlidc1abg09jsl9ddcr0"))))
   (cons "node_modules/@protobufjs/path"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@protobufjs/path/-/path-1.1.2.tgz")
                 (sha256 (base32 "131jr8ykzasqh4hjg7r15mnyirxqafxs4da5fgakcg0p23llwdnc"))))
   (cons "node_modules/@protobufjs/pool"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@protobufjs/pool/-/pool-1.1.0.tgz")
                 (sha256 (base32 "00r7ffp1skf16ad4dzl2z2ffzhrwl3vyj6mzqb8wgll2fb9dn8gp"))))
   (cons "node_modules/@protobufjs/utf8"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@protobufjs/utf8/-/utf8-1.1.1.tgz")
                 (sha256 (base32 "1vvk8s39nfi6sjhaf2fwsqkrh5q33qvv965fl7hak5ar09nlxsj6"))))
   (cons "node_modules/@rollup/rollup-android-arm-eabi"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-android-arm-eabi/-/rollup-android-arm-eabi-4.59.0.tgz")
                 (sha256 (base32 "08w7gggcks9c1h2r45wihx7rv3hip9fs5vha45pi7rga9i7aqhn7"))))
   (cons "node_modules/@rollup/rollup-android-arm64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-android-arm64/-/rollup-android-arm64-4.59.0.tgz")
                 (sha256 (base32 "0q71cyvy8dw013xjq9rd0bb7q468x57ng1r5f9ri7mwm1a49zsca"))))
   (cons "node_modules/@rollup/rollup-darwin-arm64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-darwin-arm64/-/rollup-darwin-arm64-4.59.0.tgz")
                 (sha256 (base32 "0slb3j0xx5cqkm8kwg364806xypdqv4sbq9wm1s9vfv2a899xg2s"))))
   (cons "node_modules/@rollup/rollup-darwin-x64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-darwin-x64/-/rollup-darwin-x64-4.59.0.tgz")
                 (sha256 (base32 "01pdiykzkznr4qfpjxfyicb5f91vfyfsh1vkicc5cwd0a70h5i3h"))))
   (cons "node_modules/@rollup/rollup-freebsd-arm64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-freebsd-arm64/-/rollup-freebsd-arm64-4.59.0.tgz")
                 (sha256 (base32 "0najj199nqbadhfl3a1vjzxmlly7mh1f4mkqknfzbd3j8mxwiy6q"))))
   (cons "node_modules/@rollup/rollup-freebsd-x64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-freebsd-x64/-/rollup-freebsd-x64-4.59.0.tgz")
                 (sha256 (base32 "0h1qxmvk519n1faig0yz3xnqhd2rk78zb9859ppr5n907hg4sdz9"))))
   (cons "node_modules/@rollup/rollup-linux-arm-gnueabihf"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-linux-arm-gnueabihf/-/rollup-linux-arm-gnueabihf-4.59.0.tgz")
                 (sha256 (base32 "0ng70272br05yll179fj3qx6vw9nx8xdky6pmchi7slwgnrnqbqh"))))
   (cons "node_modules/@rollup/rollup-linux-arm-musleabihf"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-linux-arm-musleabihf/-/rollup-linux-arm-musleabihf-4.59.0.tgz")
                 (sha256 (base32 "1dcv9q7j7gavgmpndvvz5bdnjirkrc3v079767qjcr9xd81aq3pa"))))
   (cons "node_modules/@rollup/rollup-linux-arm64-gnu"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-linux-arm64-gnu/-/rollup-linux-arm64-gnu-4.59.0.tgz")
                 (sha256 (base32 "1i9427shck108nmdy6w27lr7g38hciqnypc90nb5rrsm78gihybf"))))
   (cons "node_modules/@rollup/rollup-linux-arm64-musl"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-linux-arm64-musl/-/rollup-linux-arm64-musl-4.59.0.tgz")
                 (sha256 (base32 "0jmjy57272515axg79frc5vx8dbqjsbnqvhyns4bxy65zjgsy0d1"))))
   (cons "node_modules/@rollup/rollup-linux-loong64-gnu"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-linux-loong64-gnu/-/rollup-linux-loong64-gnu-4.59.0.tgz")
                 (sha256 (base32 "0vry62fxhmbi7wfnxnzapil5znf3jb7g17hhiliyqfcnc83f5w1s"))))
   (cons "node_modules/@rollup/rollup-linux-loong64-musl"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-linux-loong64-musl/-/rollup-linux-loong64-musl-4.59.0.tgz")
                 (sha256 (base32 "0npmz6zvxhp7vx2lnnkq5mhg83mxvxgvx4140yw1g5c08xkia5ak"))))
   (cons "node_modules/@rollup/rollup-linux-ppc64-gnu"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-linux-ppc64-gnu/-/rollup-linux-ppc64-gnu-4.59.0.tgz")
                 (sha256 (base32 "1p85v4wk1kzp4pi1iffwy60q6cd1fnxhwf3h8qdc4s75fh16i50n"))))
   (cons "node_modules/@rollup/rollup-linux-ppc64-musl"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-linux-ppc64-musl/-/rollup-linux-ppc64-musl-4.59.0.tgz")
                 (sha256 (base32 "18vi0p7akvdclj1dh0qw2y1x59inm0g94kk4l5bkmi9d29j6y615"))))
   (cons "node_modules/@rollup/rollup-linux-riscv64-gnu"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-linux-riscv64-gnu/-/rollup-linux-riscv64-gnu-4.59.0.tgz")
                 (sha256 (base32 "0gpnf5q5vz10cfd0s17wi63rwvqrv14d1nwl9bsc27l7l09s5rkd"))))
   (cons "node_modules/@rollup/rollup-linux-riscv64-musl"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-linux-riscv64-musl/-/rollup-linux-riscv64-musl-4.59.0.tgz")
                 (sha256 (base32 "0ckzw85v9si04h26gyhmypwnf09jlrd3rg8nk5kvf1lrvylha60c"))))
   (cons "node_modules/@rollup/rollup-linux-s390x-gnu"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-linux-s390x-gnu/-/rollup-linux-s390x-gnu-4.59.0.tgz")
                 (sha256 (base32 "0ds5fm6dsf8r7si53j9lk08kffwm1zwh2s0xw9f0gxs94iak7qsf"))))
   (cons "node_modules/@rollup/rollup-linux-x64-gnu"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-linux-x64-gnu/-/rollup-linux-x64-gnu-4.59.0.tgz")
                 (sha256 (base32 "0z4n6rmijws5wv9pj1bq7h8vrasv8pp7ys3dmzv5kgiwm42dssia"))))
   (cons "node_modules/@rollup/rollup-linux-x64-musl"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-linux-x64-musl/-/rollup-linux-x64-musl-4.59.0.tgz")
                 (sha256 (base32 "11s67j0h37pjcws532dc1v2nd7wklid8594i79cjk9v2z00gscn3"))))
   (cons "node_modules/@rollup/rollup-openbsd-x64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-openbsd-x64/-/rollup-openbsd-x64-4.59.0.tgz")
                 (sha256 (base32 "1g94g9506qvpdprcah52sm2zwlw4pznkx4d6f89r37zk88v32jhc"))))
   (cons "node_modules/@rollup/rollup-openharmony-arm64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-openharmony-arm64/-/rollup-openharmony-arm64-4.59.0.tgz")
                 (sha256 (base32 "0zv9rw6hc02aih3g7iydyi47p19y3d4mbg58pyj8dmh8qnihb3zg"))))
   (cons "node_modules/@rollup/rollup-win32-arm64-msvc"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-win32-arm64-msvc/-/rollup-win32-arm64-msvc-4.59.0.tgz")
                 (sha256 (base32 "1vn13d82aipybrmysn8wx6gywghk48x0yam13m4kw4hdhvsaa5gx"))))
   (cons "node_modules/@rollup/rollup-win32-ia32-msvc"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-win32-ia32-msvc/-/rollup-win32-ia32-msvc-4.59.0.tgz")
                 (sha256 (base32 "1aq6z5qzj5nlxd7qgr90jgb57slk1265q3iyry5k3ckvx83pfgkx"))))
   (cons "node_modules/@rollup/rollup-win32-x64-gnu"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-win32-x64-gnu/-/rollup-win32-x64-gnu-4.59.0.tgz")
                 (sha256 (base32 "0b4n2pqaxq9q5xbjvdn2bqx5l5y310zchfklz217v8cywyxbz1vk"))))
   (cons "node_modules/@rollup/rollup-win32-x64-msvc"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rollup/rollup-win32-x64-msvc/-/rollup-win32-x64-msvc-4.59.0.tgz")
                 (sha256 (base32 "1wj0wn3hcmsafnkqvh0y3h0razx9s4sf7slrl3cwrx110b09rcks"))))
   (cons "node_modules/@sindresorhus/is"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@sindresorhus/is/-/is-4.6.0.tgz")
                 (sha256 (base32 "1xr4dqjza7wlh436rkm44ywd00skdjsld343rbrqc6vlh36fqw1r"))))
   (cons "node_modules/@standard-schema/spec"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@standard-schema/spec/-/spec-1.1.0.tgz")
                 (sha256 (base32 "1byfgh3b6ngdj4vba2jw48bk9wl6gjqc7y2hshcba2i8prl75jx7"))))
   (cons "node_modules/@szmarczak/http-timer"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@szmarczak/http-timer/-/http-timer-4.0.6.tgz")
                 (sha256 (base32 "0mibapm04v1qka4n0645r5cyrg127cs3j5gdapmpn3c74plgi9zx"))))
   (cons "node_modules/@types/babel__core"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/babel__core/-/babel__core-7.20.5.tgz")
                 (sha256 (base32 "0m8i5r6fziw0k532305y854rn0872zxxmgjypx5c8d5qwqxj4r8q"))))
   (cons "node_modules/@types/babel__generator"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/babel__generator/-/babel__generator-7.6.8.tgz")
                 (sha256 (base32 "0ghk80iy7vpc8awhb55bwx56wxavqp2x8hx8ivc7lw3kq4z47r1h"))))
   (cons "node_modules/@types/babel__template"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/babel__template/-/babel__template-7.4.4.tgz")
                 (sha256 (base32 "1hd7cyxjv66np9p2f1ybs5p7kzxbc7sl3k6xyz99c698w0cjqz56"))))
   (cons "node_modules/@types/babel__traverse"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/babel__traverse/-/babel__traverse-7.20.6.tgz")
                 (sha256 (base32 "0lsaks9m4zfm1ngbsnn0jx1dmjjn7hfk3mqbk8gmh43fdrkr1y88"))))
   (cons "node_modules/@types/cacheable-request"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/cacheable-request/-/cacheable-request-6.0.3.tgz")
                 (sha256 (base32 "174gfmvmy7plhy08ph9xwiiwknz5giawdaa5fp65snz7qm9a4d25"))))
   (cons "node_modules/@types/chai"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/chai/-/chai-5.2.3.tgz")
                 (sha256 (base32 "153zvpnbwgi62h75w9jzcjpayr87af2rnvidk8npvq9q8bim432z"))))
   (cons "node_modules/@types/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/debug/-/debug-4.1.13.tgz")
                 (sha256 (base32 "1233wm8x719v67fxy36mr4gydpa27jx6lh8xzc3x8ksyw5r8vfqr"))))
   (cons "node_modules/@types/deep-eql"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/deep-eql/-/deep-eql-4.0.2.tgz")
                 (sha256 (base32 "01rnbz1kbwyrs8bh1ljzqajcbx1d6h82pcb2d6yj68ndy9gihgdn"))))
   (cons "node_modules/@types/eslint"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/eslint/-/eslint-9.6.1.tgz")
                 (sha256 (base32 "1l75ivl4swjvvh7n4aaxkblw830vmly6wjwcyjnn842lj44g5nzg"))))
   (cons "node_modules/@types/eslint__js"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/eslint__js/-/eslint__js-8.42.3.tgz")
                 (sha256 (base32 "1n91v9ny7nwph1kzk54whl71f7w2kzqabfw9rn7pj8xw9pniaq7z"))))
   (cons "node_modules/@types/estree"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/estree/-/estree-1.0.8.tgz")
                 (sha256 (base32 "0jnm82j29n0mm527qsz7rv05sksxkgsa92c54f96mnijf7mm611r"))))
   (cons "node_modules/@types/events"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/events/-/events-3.0.0.tgz")
                 (sha256 (base32 "18wizz3bmczfvbcqgzy1p0z06gvlpbkmp8n1wwhzzi4s7ip2s5i7"))))
   (cons "node_modules/@types/fs-extra"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/fs-extra/-/fs-extra-9.0.13.tgz")
                 (sha256 (base32 "06m9ma71dpg48kqqwsx1mq4y2r80kfcx3y7cgqkqqzi9183awkik"))))
   (cons "node_modules/@types/geojson"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/geojson/-/geojson-7946.0.7.tgz")
                 (sha256 (base32 "1hd70xf6z568yr1ri4vj8iiv2d6wbjg0jarwmjhg9why7q64k1nc"))))
   (cons "node_modules/@types/gettext-parser"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/gettext-parser/-/gettext-parser-4.0.1.tgz")
                 (sha256 (base32 "1bk717w965zp63biv9hsazidvyl9sk2461d3959dv4wr3zpd3cj1"))))
   (cons "node_modules/@types/glob"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/glob/-/glob-7.1.1.tgz")
                 (sha256 (base32 "1bkk20gz7lzdrdpb0ksycm96gggp3bicxxh90xjcln785vma1r03"))))
   (cons "node_modules/@types/google-protobuf"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/google-protobuf/-/google-protobuf-3.15.6.tgz")
                 (sha256 (base32 "1qj9mxnlhs3668asmw4sngvgy0c7vl8qcxqbvr1hx9ac3vcblv0n"))))
   (cons "node_modules/@types/history"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/history/-/history-4.7.11.tgz")
                 (sha256 (base32 "1p0s497p3jzxmxyi8k72j9354ka3j7d51yhr57zjd6r93ipv1jgr"))))
   (cons "node_modules/@types/http-cache-semantics"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/http-cache-semantics/-/http-cache-semantics-4.2.0.tgz")
                 (sha256 (base32 "0si8d9ad5sxflhq7cj292pf3kmmvb79p3awkn0qa158zmpcaswv5"))))
   (cons "node_modules/@types/json-schema"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/json-schema/-/json-schema-7.0.15.tgz")
                 (sha256 (base32 "092pv4k6dfr3wdsj78inq4iwygx53daj1hizcvqbz6bhzzfb3p0j"))))
   (cons "node_modules/@types/keyv"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/keyv/-/keyv-3.1.4.tgz")
                 (sha256 (base32 "0lindx0xh0p57z20y7iylidl3w00dksr02q393h186iva957j732"))))
   (cons "node_modules/@types/minimatch"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/minimatch/-/minimatch-3.0.3.tgz")
                 (sha256 (base32 "0xqnqvkc0h5hwizr7n28x6mxh070iyx3zqhb1xjxl7f4fcl53mvi"))))
   (cons "node_modules/@types/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/ms/-/ms-2.1.0.tgz")
                 (sha256 (base32 "02bcrf5p3vdc94byy4pjnaxv7m996m7hivj4bv2xhjz4hi6pnzx0"))))
   (cons "node_modules/@types/node"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/node/-/node-24.13.3.tgz")
                 (sha256 (base32 "1g5yqmk7xadi6jfqvjfxws5kldazarh6zhbsv9ib4ai25dk0w80l"))))
   (cons "node_modules/@types/node-gettext"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/node-gettext/-/node-gettext-3.0.3.tgz")
                 (sha256 (base32 "1j1l7fpprq920sdahbihw295w32a2k2cgrrvjl2vdh9rwfmgk2nr"))))
   (cons "node_modules/@types/parse5"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/parse5/-/parse5-5.0.2.tgz")
                 (sha256 (base32 "1kzrdk9053nmldpsq0930i24mr7riqflyas1xw782q3yy06bbrwa"))))
   (cons "node_modules/@types/react"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/react/-/react-19.1.9.tgz")
                 (sha256 (base32 "0qdf8nbkgh6fpnflsminfv58jd40pz0sad6909x649k2n5dvgjhz"))))
   (cons "node_modules/@types/react-dom"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/react-dom/-/react-dom-19.1.7.tgz")
                 (sha256 (base32 "0jwdzb3dak2l1ms2fz24kh7kvj1996qr74a9m91mqa1f0373ckhm"))))
   (cons "node_modules/@types/react-router"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/react-router/-/react-router-5.1.19.tgz")
                 (sha256 (base32 "0wjd8ik9v63h8q54xy3257xgmwdykkab1a55053z8pqaci5zmvl1"))))
   (cons "node_modules/@types/responselike"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/responselike/-/responselike-1.0.3.tgz")
                 (sha256 (base32 "0lfhnawymczrpbn8p215hwl3lba2rmxbqfs4fmilnf5m5ifnz3nn"))))
   (cons "node_modules/@types/sprintf-js"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/sprintf-js/-/sprintf-js-1.1.2.tgz")
                 (sha256 (base32 "188s752cki41fs56aj0i2szghs861ngymim0ldff4w4a8h2v827g"))))
   (cons "node_modules/@types/stylis"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/stylis/-/stylis-4.2.5.tgz")
                 (sha256 (base32 "1n82richrjj3nz0qdi722m07x6rhkl8z5wikzz5ajwcpkr3igx5c"))))
   (cons "node_modules/@types/topojson-specification"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/topojson-specification/-/topojson-specification-1.0.2.tgz")
                 (sha256 (base32 "1awxmarjjq11acqp033qd0ps8ckdxb1drz4qscxa55pf3n418084"))))
   (cons "node_modules/@types/use-sync-external-store"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@types/use-sync-external-store/-/use-sync-external-store-0.0.6.tgz")
                 (sha256 (base32 "0mskms71k2pzk98mp6j484732xj3y7j3spq3daxpw0xkv87rspfb"))))
   (cons "node_modules/@typescript-eslint/eslint-plugin"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@typescript-eslint/eslint-plugin/-/eslint-plugin-8.15.0.tgz")
                 (sha256 (base32 "1v6mis58gq5zapnq1iprs3rwxpiy8h8wgsy30bj01i6rr14fi32k"))))
   (cons "node_modules/@typescript-eslint/parser"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@typescript-eslint/parser/-/parser-8.15.0.tgz")
                 (sha256 (base32 "1q5gyvxhxp61qvaiywbfczqp25p9alwwpx75mwvdvlwpkx05355k"))))
   (cons "node_modules/@typescript-eslint/parser/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.3.7.tgz")
                 (sha256 (base32 "1b0l57hhmk4glxfqzgmgbd8pa1k4gwpya3hmyxsplnw3kg5ah0y8"))))
   (cons "node_modules/@typescript-eslint/parser/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/@typescript-eslint/scope-manager"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@typescript-eslint/scope-manager/-/scope-manager-8.15.0.tgz")
                 (sha256 (base32 "1rvqpcyigf4z71zy3hj5vdmydzra3qacqb01j10hz8b4zx2186id"))))
   (cons "node_modules/@typescript-eslint/type-utils"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@typescript-eslint/type-utils/-/type-utils-8.15.0.tgz")
                 (sha256 (base32 "0lp5waaj7w92134lmr25nbhsppbf0nrzj3i2zml85nhy98d91a3q"))))
   (cons "node_modules/@typescript-eslint/type-utils/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.3.7.tgz")
                 (sha256 (base32 "1b0l57hhmk4glxfqzgmgbd8pa1k4gwpya3hmyxsplnw3kg5ah0y8"))))
   (cons "node_modules/@typescript-eslint/type-utils/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/@typescript-eslint/types"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@typescript-eslint/types/-/types-8.15.0.tgz")
                 (sha256 (base32 "0vrvdpdcqhrv7phzrknvl3h3iiavscansgbci6pg1jv1qyzxrvnj"))))
   (cons "node_modules/@typescript-eslint/typescript-estree"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@typescript-eslint/typescript-estree/-/typescript-estree-8.15.0.tgz")
                 (sha256 (base32 "0lla4i3xq2dn8mapq6ps4davzb2v5mdhivasf4in0yhznqng6qjp"))))
   (cons "node_modules/@typescript-eslint/typescript-estree/node_modules/brace-expansion"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/brace-expansion/-/brace-expansion-2.1.2.tgz")
                 (sha256 (base32 "19f83xr12lbhj7sx4cqsvdmdwzgajgsfw2v257y2gccq5qfzld43"))))
   (cons "node_modules/@typescript-eslint/typescript-estree/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.3.7.tgz")
                 (sha256 (base32 "1b0l57hhmk4glxfqzgmgbd8pa1k4gwpya3hmyxsplnw3kg5ah0y8"))))
   (cons "node_modules/@typescript-eslint/typescript-estree/node_modules/minimatch"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/minimatch/-/minimatch-9.0.9.tgz")
                 (sha256 (base32 "0y04nhx30qi0ab8ipnr93mqy40qm928w33n7jch59khpxyiwja3x"))))
   (cons "node_modules/@typescript-eslint/typescript-estree/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/@typescript-eslint/utils"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@typescript-eslint/utils/-/utils-8.15.0.tgz")
                 (sha256 (base32 "0c3vggk0jz14wx065w9004c4bnkkcj052lw638gsks2zk387vp2d"))))
   (cons "node_modules/@typescript-eslint/visitor-keys"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@typescript-eslint/visitor-keys/-/visitor-keys-8.15.0.tgz")
                 (sha256 (base32 "0falxmiyax3k67q6akxrggy93zf10x0a9i6fqgr2yfpcrfgrbn9v"))))
   (cons "node_modules/@typescript-eslint/visitor-keys/node_modules/eslint-visitor-keys"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/eslint-visitor-keys/-/eslint-visitor-keys-4.2.0.tgz")
                 (sha256 (base32 "06c12ljsili1jzrndvw1lz7j4mn0yrcrdrjxdiv0vlnlkg19zh3s"))))
   (cons "node_modules/@xmldom/xmldom"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@xmldom/xmldom/-/xmldom-0.8.13.tgz")
                 (sha256 (base32 "13f0kdjb0zdh1k1g47d2ihiqwb18cy2wwfxdd10kwksnm0wclydk"))))
   (cons "node_modules/abbrev"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/abbrev/-/abbrev-4.0.0.tgz")
                 (sha256 (base32 "1bihvvixv81j3qjalrn8qcka2wlj97bvsrwzadq2xn21rxq3cmaw"))))
   (cons "node_modules/abort-controller"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/abort-controller/-/abort-controller-3.0.0.tgz")
                 (sha256 (base32 "0bxba0gy4rglq44q0dx5s2fzm8rw7vb11ihjgkjiisqhs3alkqnj"))))
   (cons "node_modules/acorn"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/acorn/-/acorn-8.15.0.tgz")
                 (sha256 (base32 "1cr3ym22djw9jw5yw1nf7s7vgd2mgf1knmi53mnz2qcppn4swvp4"))))
   (cons "node_modules/acorn-jsx"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/acorn-jsx/-/acorn-jsx-5.3.2.tgz")
                 (sha256 (base32 "1k2qj4av0nmrqa5xcn0hrjv9r5kv8x83238fsxb6lff581gb0ryr"))))
   (cons "node_modules/agent-base"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/agent-base/-/agent-base-7.1.4.tgz")
                 (sha256 (base32 "0zmmkk3xhnkwb6djnvri7zyxllsdz5aa5w83x7afi959d0badm3x"))))
   (cons "node_modules/ajv"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ajv/-/ajv-6.15.0.tgz")
                 (sha256 (base32 "02pd70mbvrv334m669pikx2y453i5ybzhnqx3n7ldvjxi6nr48gm"))))
   (cons "node_modules/ansi-styles"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.3.0.tgz")
                 (sha256 (base32 "0zwqsx67hr7m4a8dpd0jzkp2rjm5v7938x4rhcqh7djsv139llrc"))))
   (cons "node_modules/app-builder-lib"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/app-builder-lib/-/app-builder-lib-26.15.7.tgz")
                 (sha256 (base32 "0lx05y53yi8fwwsrihkshgx5a0r4d8adc560hsqy1yslnq0dx5gg"))))
   (cons "node_modules/app-builder-lib/node_modules/@electron/get"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@electron/get/-/get-3.1.0.tgz")
                 (sha256 (base32 "0f7v1nbzy849g5i17554qyvsmplxfwk0ylf8y59bc8q9hc6wqq6c"))))
   (cons "node_modules/app-builder-lib/node_modules/@electron/get/node_modules/fs-extra"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fs-extra/-/fs-extra-8.1.0.tgz")
                 (sha256 (base32 "0n5ibswj8njpw8w8igfqxklyips6m1y8cyk1zrd9llv9rirlgv00"))))
   (cons "node_modules/app-builder-lib/node_modules/@electron/get/node_modules/semver"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/semver/-/semver-6.3.1.tgz")
                 (sha256 (base32 "0c0jxgjhgpxx7hdbmwghndq2mdpg58295mwv1b8cp6g070m096rw"))))
   (cons "node_modules/app-builder-lib/node_modules/ajv"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ajv/-/ajv-8.20.0.tgz")
                 (sha256 (base32 "1cz7yr42yf4kb0znhwyxslqrxqcr2j5z0538zdgcrf5vjflb7w5j"))))
   (cons "node_modules/app-builder-lib/node_modules/balanced-match"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/balanced-match/-/balanced-match-4.0.4.tgz")
                 (sha256 (base32 "05pva90symmxg31miw4msmd9g0q1aspf7764pcqybvi5j66m09ch"))))
   (cons "node_modules/app-builder-lib/node_modules/brace-expansion"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/brace-expansion/-/brace-expansion-5.0.8.tgz")
                 (sha256 (base32 "1zj748yw3h4hsydxq02qcsfgjigj4xjbcigzn5w04bc6dpk0cfx0"))))
   (cons "node_modules/app-builder-lib/node_modules/ci-info"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ci-info/-/ci-info-4.3.1.tgz")
                 (sha256 (base32 "1zvrnjficpf4ra6509cf8l65v6xbv34805i2mk12czlh2hpmbyap"))))
   (cons "node_modules/app-builder-lib/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.4.3.tgz")
                 (sha256 (base32 "19z48fpic8jbb2833gh3bviylzp9512i2dsqhxd91s3fjjfarhc9"))))
   (cons "node_modules/app-builder-lib/node_modules/isexe"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/isexe/-/isexe-3.1.5.tgz")
                 (sha256 (base32 "04988s0j8lglw09g9izzl8xwr20y6v5ifpc012yzp6dj62hiw1pf"))))
   (cons "node_modules/app-builder-lib/node_modules/json-schema-traverse"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-1.0.0.tgz")
                 (sha256 (base32 "08cvg5wysj4r0ax2lvhx7j74l7da8w75klz5pmsc57zj5mi24ch2"))))
   (cons "node_modules/app-builder-lib/node_modules/jsonfile"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/jsonfile/-/jsonfile-4.0.0.tgz")
                 (sha256 (base32 "1s701cy3mlbvgyhhyy2ypqcy064w5990sk8x81gv0200yybrbfaz"))))
   (cons "node_modules/app-builder-lib/node_modules/minimatch"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/minimatch/-/minimatch-10.2.6.tgz")
                 (sha256 (base32 "1y2m0dvd682xw3phaacnlxb1i54h2257pr17axk2k0m2fj02qgas"))))
   (cons "node_modules/app-builder-lib/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/app-builder-lib/node_modules/universalify"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/universalify/-/universalify-0.1.2.tgz")
                 (sha256 (base32 "0lykbpkmvjkjg0sqngrn086rxlyddgjkfnsi22r8hgixxzxb2alc"))))
   (cons "node_modules/app-builder-lib/node_modules/which"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/which/-/which-5.0.0.tgz")
                 (sha256 (base32 "0jsfpp5fcq7f6yhg1mk5s06nhhdjyqqm3fj849i4g9041f3l2xzj"))))
   (cons "node_modules/argparse"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/argparse/-/argparse-2.0.1.tgz")
                 (sha256 (base32 "133jjyhcr25rf4vy7bca7x06dfmsyy819s1kbbyfc5c2zi3ki417"))))
   (cons "node_modules/argv-split"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/argv-split/-/argv-split-2.0.1.tgz")
                 (sha256 (base32 "16ghgls94habfavv07648fqn4vdz2hkh1q2sxfa3ai02mlnzdlin"))))
   (cons "node_modules/array-buffer-byte-length"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/array-buffer-byte-length/-/array-buffer-byte-length-1.0.1.tgz")
                 (sha256 (base32 "1h1f1394xd6qs94fvmyalgdw4gyllbsm738ymzk6mm6v9vfi2k7h"))))
   (cons "node_modules/array-includes"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/array-includes/-/array-includes-3.1.8.tgz")
                 (sha256 (base32 "0b1vfym68jpp5alypkf6xmjqhck8ircjaxcx05yb4bx1109r80kc"))))
   (cons "node_modules/array.prototype.findlast"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/array.prototype.findlast/-/array.prototype.findlast-1.2.5.tgz")
                 (sha256 (base32 "046fv02rsgxfnckjygwb3wf6d7l5216lflr4s3driw3wfn29gwli"))))
   (cons "node_modules/array.prototype.flatmap"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/array.prototype.flatmap/-/array.prototype.flatmap-1.3.2.tgz")
                 (sha256 (base32 "03xw216nd7x2vvdmaiq2y3w7215pg6q50mlk1iii63wmywsy6p5l"))))
   (cons "node_modules/array.prototype.tosorted"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/array.prototype.tosorted/-/array.prototype.tosorted-1.1.4.tgz")
                 (sha256 (base32 "1xk3rkida07zqa288sk1y424bgmdl6zj4a0fixrldcnzlc44lp59"))))
   (cons "node_modules/arraybuffer.prototype.slice"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/arraybuffer.prototype.slice/-/arraybuffer.prototype.slice-1.0.3.tgz")
                 (sha256 (base32 "1x0yz6hyqpl9fmkrgds6dxf4gnsn57q0wzs6sa3cndb3l4xmslqx"))))
   (cons "node_modules/asn1js"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/asn1js/-/asn1js-3.0.10.tgz")
                 (sha256 (base32 "1qwpga15gmgn0pq56nxxgbfxn9lm054xyp0m4srjmbc0klqyxphh"))))
   (cons "node_modules/assertion-error"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/assertion-error/-/assertion-error-2.0.1.tgz")
                 (sha256 (base32 "0mhgq8w0jyw6x02gzy3p5zzfaglkly2lv38q4cqlz3mkr6rsbx3k"))))
   (cons "node_modules/async"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/async/-/async-3.2.6.tgz")
                 (sha256 (base32 "0vqf4nhfjaqjkx5bvh3y2gz70c0ijjm6xkmkksiyxllcl3xmrd3b"))))
   (cons "node_modules/async-exit-hook"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/async-exit-hook/-/async-exit-hook-2.0.1.tgz")
                 (sha256 (base32 "11d0c1kpakkyy25pn5g12g53qw7m7ywrwmq3hzyifi2pdfxnywni"))))
   (cons "node_modules/asynckit"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/asynckit/-/asynckit-0.4.0.tgz")
                 (sha256 (base32 "1kvxnmjbjwqc8gvp4ms7d8w8x7y41rcizmz4898694h7ywq4y9cc"))))
   (cons "node_modules/at-least-node"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/at-least-node/-/at-least-node-1.0.0.tgz")
                 (sha256 (base32 "1yl3b109jav8v9hbbhqpdfaj31igi5mfjfgflx48rdnj7ml2gvbj"))))
   (cons "node_modules/available-typed-arrays"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/available-typed-arrays/-/available-typed-arrays-1.0.7.tgz")
                 (sha256 (base32 "0qvqrz4j0pkz90ld5bd4x2476pbmr40c9z6zs60kvppylc7hw54b"))))
   (cons "node_modules/aws4"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/aws4/-/aws4-1.13.2.tgz")
                 (sha256 (base32 "0qmd9r83904l4hgrrh4fm19swr99776m4c15ggpf116ihr0c3w4v"))))
   (cons "node_modules/balanced-match"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.0.tgz")
                 (sha256 (base32 "1bgzp9jp8ws0kdfgq8h6w3qz8cljyzgcrmxypxkgbknk28n615i8"))))
   (cons "node_modules/base64-js"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/base64-js/-/base64-js-1.5.1.tgz")
                 (sha256 (base32 "118a46skxnrgx5bdd68ny9xxjcvyb7b1clj2hf82d196nm2skdxi"))))
   (cons "node_modules/baseline-browser-mapping"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/baseline-browser-mapping/-/baseline-browser-mapping-2.10.37.tgz")
                 (sha256 (base32 "02bw6df7afwddclqrw00b1hvbsk8kpxjql9jp0189dqqdrkjp9v9"))))
   (cons "node_modules/big-integer"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/big-integer/-/big-integer-1.6.52.tgz")
                 (sha256 (base32 "11qzzsx416yxni5bqn0828118n9rnsdd8wxqhfh77s5ihmqcch2l"))))
   (cons "node_modules/bluebird"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/bluebird/-/bluebird-3.7.2.tgz")
                 (sha256 (base32 "1p3dh022lvsrmsfyz37nr2x96g85y3356l4pgqkn32gm8hm0p2y6"))))
   (cons "node_modules/boolean"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/boolean/-/boolean-3.2.0.tgz")
                 (sha256 (base32 "0sm78kkkfavw87jhh0y3ahwzghxkjmf01jlj1syikljpkr93yvpm"))))
   (cons "node_modules/bplist-creator"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/bplist-creator/-/bplist-creator-0.1.0.tgz")
                 (sha256 (base32 "1wkgzpsk35c7br8lxvpkkfgl4njm8203g4sw6654wg8jl0vmmk3c"))))
   (cons "node_modules/bplist-parser"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/bplist-parser/-/bplist-parser-0.3.1.tgz")
                 (sha256 (base32 "1m18r6amn6wsil15pkrfxh64h94wlqnl0b1ajhrchg0d3y6a394j"))))
   (cons "node_modules/brace-expansion"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.16.tgz")
                 (sha256 (base32 "1ynix8k4c2mgiipy95j1b7b3v2hp0cgxg3rvdc30rfg1k7ybdgdq"))))
   (cons "node_modules/browserslist"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/browserslist/-/browserslist-4.28.2.tgz")
                 (sha256 (base32 "1a5vyfxsjl9hz14g9y6x6k071hxkn5lb3frwqs8chpmjb46f9b42"))))
   (cons "node_modules/buffer-from"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/buffer-from/-/buffer-from-1.1.2.tgz")
                 (sha256 (base32 "0hz3cbll0m805g22c5pnwdgpi1xavmrp5q1734x4d3yakvah6aww"))))
   (cons "node_modules/builder-util"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/builder-util/-/builder-util-26.15.3.tgz")
                 (sha256 (base32 "1rnhhfj1s90jlh1nksywb2kbq3d1f6s7djd8jaij3rdcvz2nxk09"))))
   (cons "node_modules/builder-util-runtime"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/builder-util-runtime/-/builder-util-runtime-9.7.0.tgz")
                 (sha256 (base32 "161lq9lxh659zq2h2ag2m1ivxy8yfr2ymkhh5jcv5pf7cfa0f7vb"))))
   (cons "node_modules/builder-util-runtime/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.4.3.tgz")
                 (sha256 (base32 "19z48fpic8jbb2833gh3bviylzp9512i2dsqhxd91s3fjjfarhc9"))))
   (cons "node_modules/builder-util-runtime/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/builder-util/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.4.3.tgz")
                 (sha256 (base32 "19z48fpic8jbb2833gh3bviylzp9512i2dsqhxd91s3fjjfarhc9"))))
   (cons "node_modules/builder-util/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/bytestreamjs"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/bytestreamjs/-/bytestreamjs-2.0.1.tgz")
                 (sha256 (base32 "1ypp9dvyz3cdylynsgm21px1w5qs78a3z7qa8lhjh8g4icyaz9p1"))))
   (cons "node_modules/cacheable-lookup"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/cacheable-lookup/-/cacheable-lookup-5.0.4.tgz")
                 (sha256 (base32 "1346y7d3p5b4jmfc39k8csxks229nkmdmanmmzabqnya0vzan694"))))
   (cons "node_modules/cacheable-request"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/cacheable-request/-/cacheable-request-7.0.4.tgz")
                 (sha256 (base32 "13l93qyb31yma8dg719xfk6rl8wjwpchkz2wvng95y4gap5nfwmv"))))
   (cons "node_modules/call-bind"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/call-bind/-/call-bind-1.0.7.tgz")
                 (sha256 (base32 "07jr4b6q1hlajpk4792s3zq5xwmx70rjw3ywsqr7r6887dlp885b"))))
   (cons "node_modules/call-bind-apply-helpers"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/call-bind-apply-helpers/-/call-bind-apply-helpers-1.0.2.tgz")
                 (sha256 (base32 "0b3xqfkmcxhancq8h4cd3282ryg9h5rnf2h2530zbvdbvgwrygh7"))))
   (cons "node_modules/callsites"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/callsites/-/callsites-3.1.0.tgz")
                 (sha256 (base32 "17f8wf2bxv2s4k36ld1x4y2rbkh9a8vsmbhwab470vmz6ayl40hp"))))
   (cons "node_modules/camelize"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/camelize/-/camelize-1.0.1.tgz")
                 (sha256 (base32 "0zk27z765rp21mg70hwdq8yfrbmhgvkgc03cf7vswj3c7k90b7sd"))))
   (cons "node_modules/caniuse-lite"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/caniuse-lite/-/caniuse-lite-1.0.30001799.tgz")
                 (sha256 (base32 "04cj34a9vy3vj0hi06gr61x54snxvl5i0h3dgw28510yragqv38k"))))
   (cons "node_modules/chai"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/chai/-/chai-6.2.2.tgz")
                 (sha256 (base32 "0n2v0njbnmqdxvwzfb55fg6lbd5ybbsm4sz9k1hwaiak6xsdab3h"))))
   (cons "node_modules/chalk"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/chalk/-/chalk-4.1.2.tgz")
                 (sha256 (base32 "02prgl8d52k2vgxnssx06ha2sjm2vp6v6s6kqgkar1ryllx68k78"))))
   (cons "node_modules/chalk/node_modules/supports-color"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/supports-color/-/supports-color-7.2.0.tgz")
                 (sha256 (base32 "0jjyglzdzscmhgidn43zc218q5jf9h03hmaaq9h4wqil2vywlspi"))))
   (cons "node_modules/chownr"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/chownr/-/chownr-3.0.0.tgz")
                 (sha256 (base32 "0q0k3cr7h7bmjxc85a2hji3ym47hgmgnbpl9v992451hlvdga92c"))))
   (cons "node_modules/chromium-pickle-js"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/chromium-pickle-js/-/chromium-pickle-js-0.2.0.tgz")
                 (sha256 (base32 "0vp1cc1zzwvs8pjyf0mpyiiriggngd87sc7n49gkxl158brcs9xj"))))
   (cons "node_modules/ci-info"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ci-info/-/ci-info-4.4.0.tgz")
                 (sha256 (base32 "07srv966n8h2lryysjmr2sig8gfwxnan27mgr17kbw7j99093p4h"))))
   (cons "node_modules/clone-response"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/clone-response/-/clone-response-1.0.3.tgz")
                 (sha256 (base32 "0rp9mi1n1dfya1ibq3r17z6g9iqx3q7nz9gphslkwj6vpf14kf1i"))))
   (cons "node_modules/color-convert"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz")
                 (sha256 (base32 "1qbw9rwfzcp7y0cpa8gmwlj7ccycf9pwn15zvf2s06f070ss83wj"))))
   (cons "node_modules/color-name"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz")
                 (sha256 (base32 "020p7x7k8rlph38lhsqpqvkx0b70lzlmk6mgal9r9sz8c527qysh"))))
   (cons "node_modules/combined-stream"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.8.tgz")
                 (sha256 (base32 "04hm5rrkwda2qgy1afwhrz42asmflw5hxkbpxddn741ywnmmmgmn"))))
   (cons "node_modules/commander"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/commander/-/commander-5.1.0.tgz")
                 (sha256 (base32 "0r25hfs7j28xxyvb8abmizlpw72xb57k2nz6yadibr2likfcdry2"))))
   (cons "node_modules/compare-version"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/compare-version/-/compare-version-0.1.2.tgz")
                 (sha256 (base32 "0g0d9fhy6p31ddqinrrrmn2axvsvpfab0i004g46yfv7w8pyd4b1"))))
   (cons "node_modules/concat-map"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz")
                 (sha256 (base32 "0qa2zqn9rrr2fqdki44s4s2dk2d8307i4556kv25h06g43b2v41m"))))
   (cons "node_modules/content-type"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/content-type/-/content-type-1.0.4.tgz")
                 (sha256 (base32 "0j0rkv7yvpdyk4hfgklx95g75aksljaxraz9lhkb5chhvxqkygnv"))))
   (cons "node_modules/convert-source-map"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/convert-source-map/-/convert-source-map-2.0.0.tgz")
                 (sha256 (base32 "160qzrwfhj8xkc2ya476hp7sahaj5gnzv4hi6xl9zq74qwz2bxqp"))))
   (cons "node_modules/core-util-is"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/core-util-is/-/core-util-is-1.0.2.tgz")
                 (sha256 (base32 "164k94d9bdzw1335kzakj7hflhnnixpx4n6ydbhf7vbrcnmlv954"))))
   (cons "node_modules/cross-dirname"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/cross-dirname/-/cross-dirname-0.1.0.tgz")
                 (sha256 (base32 "06apqdc164i47qy6mmni9jr2za676hx9x2bzxfymwdvsl6c0y3ya"))))
   (cons "node_modules/cross-env"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/cross-env/-/cross-env-7.0.3.tgz")
                 (sha256 (base32 "1pn5scd63gk6931mis3dsqfjkf58gn5civn49zv29w2zjavd6jnl"))))
   (cons "node_modules/cross-spawn"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/cross-spawn/-/cross-spawn-7.0.6.tgz")
                 (sha256 (base32 "1siqxlydjwpihy7klgd15cah56vsmxrdm3q90gndyfj1vh63530q"))))
   (cons "node_modules/cross-spawn/node_modules/which"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/which/-/which-2.0.2.tgz")
                 (sha256 (base32 "1p2fkm4lr36s85gdjxmyr6wh86dizf0iwmffxmarcxpbvmgxyfm1"))))
   (cons "node_modules/css-color-keywords"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/css-color-keywords/-/css-color-keywords-1.0.0.tgz")
                 (sha256 (base32 "09c825dnngvjaqsd33lh8j71x5ww3dh7jj3nf0fx9cd0q49fm8zw"))))
   (cons "node_modules/css-selector-parser"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/css-selector-parser/-/css-selector-parser-1.3.0.tgz")
                 (sha256 (base32 "0cn3xkdx8av45qk9kim84j2cn9j2c7b23by3k5bc75zblb8nas3w"))))
   (cons "node_modules/css-to-react-native"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/css-to-react-native/-/css-to-react-native-3.2.0.tgz")
                 (sha256 (base32 "0v5pcpghqhjmbsb9i594vvh6llba9kbskdgqsx98lijyn7nhb84p"))))
   (cons "node_modules/csstype"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/csstype/-/csstype-3.1.3.tgz")
                 (sha256 (base32 "0xv731kpasg28w32mcfjgkklav292hmzlkjbc9dg1653y9y3y21g"))))
   (cons "node_modules/data-view-buffer"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/data-view-buffer/-/data-view-buffer-1.0.1.tgz")
                 (sha256 (base32 "08w5kgqpg0aaqcf6wswc61vj416p4s0kll2hin8p1h39hnzh4i40"))))
   (cons "node_modules/data-view-byte-length"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/data-view-byte-length/-/data-view-byte-length-1.0.1.tgz")
                 (sha256 (base32 "199aac0lz7axxb3hb70ghl8mmn5ys9gnp8km9f12xsbg1l4il0z2"))))
   (cons "node_modules/data-view-byte-offset"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/data-view-byte-offset/-/data-view-byte-offset-1.0.0.tgz")
                 (sha256 (base32 "1gqrl3hv4izcigxls9fvxqdsbrx22kpvcjf7rp58j0z923whdvbr"))))
   (cons "node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-2.6.9.tgz")
                 (sha256 (base32 "160wvc74r8aypds7pym3hq4qpa786hpk4vif58ggiwcqcv34ibil"))))
   (cons "node_modules/decompress-response"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/decompress-response/-/decompress-response-6.0.0.tgz")
                 (sha256 (base32 "0krv58fihkajrskzakm1i69kklv0ycabrjmlgk2a9kkv0idlqznm"))))
   (cons "node_modules/decompress-response/node_modules/mimic-response"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/mimic-response/-/mimic-response-3.1.0.tgz")
                 (sha256 (base32 "0m6xcg030cw88cja84avw63q3jkvqgbdp74xvs1p3m2w2my9n7ij"))))
   (cons "node_modules/deep-is"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/deep-is/-/deep-is-0.1.4.tgz")
                 (sha256 (base32 "0g5z206z33f41cdh220vf7kpj61cfcnmlnrcrk1ffs5zqs1sl0qc"))))
   (cons "node_modules/defer-to-connect"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/defer-to-connect/-/defer-to-connect-2.0.1.tgz")
                 (sha256 (base32 "0cnlka4hxw7mrl8rphpslcbxb5pc8d7w6jwv1fhpmj89nx6hfny3"))))
   (cons "node_modules/define-data-property"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/define-data-property/-/define-data-property-1.1.4.tgz")
                 (sha256 (base32 "1lp423qridddixk0b6sgkccdf770knbaha1wcal4qdpi7pbllc0n"))))
   (cons "node_modules/define-properties"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/define-properties/-/define-properties-1.2.1.tgz")
                 (sha256 (base32 "1x20dff3wz5pp7ciyxbyhglgxvggwsavd56l7ivrvvmd9y0f7rsx"))))
   (cons "node_modules/delayed-stream"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/delayed-stream/-/delayed-stream-1.0.0.tgz")
                 (sha256 (base32 "1lr98585rayrc5xfj599hg6mxqvks38diir74ivivyvx47jgqf5c"))))
   (cons "node_modules/detect-node"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/detect-node/-/detect-node-2.1.0.tgz")
                 (sha256 (base32 "1qw23a1wlk4fpk4j0nc74hgwwgafd25vbrq1l7ppmpsnd3p0aq03"))))
   (cons "node_modules/dir-compare"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/dir-compare/-/dir-compare-4.2.0.tgz")
                 (sha256 (base32 "1jyvlbmsdzxgd4zfbcalfx3l0isvi9119zkhs7ki4n4k5xnkamxq"))))
   (cons "node_modules/dmg-builder"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/dmg-builder/-/dmg-builder-26.15.7.tgz")
                 (sha256 (base32 "1hakgx52j796fmc2mm3x14aafj7b8md7q505ksv3nj8amjx63y4h"))))
   (cons "node_modules/doctrine"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/doctrine/-/doctrine-2.1.0.tgz")
                 (sha256 (base32 "1k8xzm071pdbgv66dc3n5jz6kb2c7wzzj6m3v8ssjwq884kqn392"))))
   (cons "node_modules/dotenv"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/dotenv/-/dotenv-16.6.1.tgz")
                 (sha256 (base32 "10ksnkzns9j73a84zab3hhkkrsbf91r0la0dqkikc9qqybbwb5bl"))))
   (cons "node_modules/dotenv-expand"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/dotenv-expand/-/dotenv-expand-11.0.7.tgz")
                 (sha256 (base32 "0rfjasb6v7cg5wm0yk1my1rb2n3kxn2bki2njsiys6qqwrnqj758"))))
   (cons "node_modules/dunder-proto"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/dunder-proto/-/dunder-proto-1.0.1.tgz")
                 (sha256 (base32 "1nyg4r9qjc33kmgixdi5xpb0qsjivy2dcn8wjbwhvhc2ihi444zd"))))
   (cons "node_modules/duplexer2"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/duplexer2/-/duplexer2-0.1.4.tgz")
                 (sha256 (base32 "0scvc51gwkvw22kfacgvnz4ppbwcdgql2x2idg5009icx2z613jz"))))
   (cons "node_modules/ejs"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ejs/-/ejs-3.1.10.tgz")
                 (sha256 (base32 "15dvwk4zv8x9wq34wzzm0g01wirry1c9xbcwpaggffdlf04xc2lr"))))
   (cons "node_modules/electron"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/electron/-/electron-42.5.1.tgz")
                 (sha256 (base32 "03sff1lq8qdqp2qc6axbi8zjr9g7m3qzspm1dl4c8wza0v2kdnsi"))))
   (cons "node_modules/electron-builder"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/electron-builder/-/electron-builder-26.15.7.tgz")
                 (sha256 (base32 "1zb91fhndkxbsxkz8si21537c8jki9apsfsddg0ncnihixjrf7gx"))))
   (cons "node_modules/electron-builder-squirrel-windows"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/electron-builder-squirrel-windows/-/electron-builder-squirrel-windows-26.15.7.tgz")
                 (sha256 (base32 "0mdyy9nx1s027pcgk08nab00rhp5w91npsl58y6isn67b2q14dcc"))))
   (cons "node_modules/electron-devtools-installer"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/electron-devtools-installer/-/electron-devtools-installer-3.2.0.tgz")
                 (sha256 (base32 "0y0b7dz5bik12f0x7k84x28jgrgxwyph5czj3hhdfdhj3n7rk9c0"))))
   (cons "node_modules/electron-publish"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/electron-publish/-/electron-publish-26.15.3.tgz")
                 (sha256 (base32 "02h0cyswc7dq9qcyb994052bza5riql5b82j3mw6kh2sjficqvkx"))))
   (cons "node_modules/electron-to-chromium"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/electron-to-chromium/-/electron-to-chromium-1.5.372.tgz")
                 (sha256 (base32 "1xjwf7fb0ddbb02gcdfjlq1fdr5cvlmaq21ni3469r9hda9ykyjm"))))
   (cons "node_modules/electron-winstaller"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/electron-winstaller/-/electron-winstaller-5.4.0.tgz")
                 (sha256 (base32 "1cddh2ab2gpy1zi8zw7afrg2ggg4addypg5lhgkwqji24srrgbs7"))))
   (cons "node_modules/electron-winstaller/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.4.3.tgz")
                 (sha256 (base32 "19z48fpic8jbb2833gh3bviylzp9512i2dsqhxd91s3fjjfarhc9"))))
   (cons "node_modules/electron-winstaller/node_modules/fs-extra"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fs-extra/-/fs-extra-7.0.1.tgz")
                 (sha256 (base32 "1f08bng4dgkdrwhd977f4xfch9419b7fbwvwwn1qpz3gy4zgja4b"))))
   (cons "node_modules/electron-winstaller/node_modules/jsonfile"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/jsonfile/-/jsonfile-4.0.0.tgz")
                 (sha256 (base32 "1s701cy3mlbvgyhhyy2ypqcy064w5990sk8x81gv0200yybrbfaz"))))
   (cons "node_modules/electron-winstaller/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/electron-winstaller/node_modules/universalify"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/universalify/-/universalify-0.1.2.tgz")
                 (sha256 (base32 "0lykbpkmvjkjg0sqngrn086rxlyddgjkfnsi22r8hgixxzxb2alc"))))
   (cons "node_modules/emoji-regex"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/emoji-regex/-/emoji-regex-8.0.0.tgz")
                 (sha256 (base32 "01xi3ikahnlj77h2gqs3jb7kmnxn1nsb9dmnpvpqw288zgxxkk5m"))))
   (cons "node_modules/encoding"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/encoding/-/encoding-0.1.13.tgz")
                 (sha256 (base32 "116gipr1y0hc9zvflsvd39psbbf2j62zvpnw099pqf7fl0nb5xbc"))))
   (cons "node_modules/end-of-stream"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/end-of-stream/-/end-of-stream-1.4.1.tgz")
                 (sha256 (base32 "0piqpaq15k6rnr92slrmgfyidqnbqbawkna3bqspmjxygj3gkk1z"))))
   (cons "node_modules/env-paths"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/env-paths/-/env-paths-2.2.1.tgz")
                 (sha256 (base32 "17knwv8glmap1vcgca11h1r48hyards94slc83y9z02q857qj2ss"))))
   (cons "node_modules/err-code"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/err-code/-/err-code-2.0.3.tgz")
                 (sha256 (base32 "1qj8n8paszjn4w39wgd19885wp49hj98fd8hlp7isbqm0i54yrm5"))))
   (cons "node_modules/es-abstract"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/es-abstract/-/es-abstract-1.23.3.tgz")
                 (sha256 (base32 "1ivrh0h0i8kasy8nkfimhhzkia6vdsqjj4mik59zd9zgvl35haaz"))))
   (cons "node_modules/es-define-property"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/es-define-property/-/es-define-property-1.0.1.tgz")
                 (sha256 (base32 "1xw50gnqd3d7nyfcl5a5lzrhxa0sjq7qyzaw1n5hld1166qvi1jr"))))
   (cons "node_modules/es-errors"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/es-errors/-/es-errors-1.3.0.tgz")
                 (sha256 (base32 "14q935xgv4cblmy8lk3brx4ypwxpgrid77r1lfnbilsbbg1x2kfi"))))
   (cons "node_modules/es-iterator-helpers"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/es-iterator-helpers/-/es-iterator-helpers-1.0.19.tgz")
                 (sha256 (base32 "063bkcrngs2y702jjhjfdd4i2mcccmir2aavrz57hay53dr08yr4"))))
   (cons "node_modules/es-object-atoms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/es-object-atoms/-/es-object-atoms-1.1.1.tgz")
                 (sha256 (base32 "1kkrwpp6nz2nc32zxin52xnngyg7qg38c5ljy5xyx2l1azby861y"))))
   (cons "node_modules/es-set-tostringtag"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/es-set-tostringtag/-/es-set-tostringtag-2.1.0.tgz")
                 (sha256 (base32 "0gdrn28p1xnj8j98b6f1sf15xy4h0cd38alazwml1vikbhdgaxan"))))
   (cons "node_modules/es-shim-unscopables"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/es-shim-unscopables/-/es-shim-unscopables-1.0.2.tgz")
                 (sha256 (base32 "0jbzvah43icc0sbyk6as7za1gj677bsqvrvs8xlcyp9ymibrhhwm"))))
   (cons "node_modules/es-to-primitive"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/es-to-primitive/-/es-to-primitive-1.2.1.tgz")
                 (sha256 (base32 "1slbd6g1g0l9wb86h49ysflwzxzzj3cv9a7flpzrzrkp3lkmh1gk"))))
   (cons "node_modules/es6-error"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/es6-error/-/es6-error-4.1.1.tgz")
                 (sha256 (base32 "0ylrhncxyzvw5nrpasrn5cxsgx5x2522vf8fwprv5bs80nvsw2p1"))))
   (cons "node_modules/esbuild"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/esbuild/-/esbuild-0.27.3.tgz")
                 (sha256 (base32 "0srr7zlvkxbd5x6lk867rbad6w5fpbiy7wsw6r808a7wkqnbggfx"))))
   (cons "node_modules/escalade"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/escalade/-/escalade-3.2.0.tgz")
                 (sha256 (base32 "1rxy0388xsgxam8limnbxhksa1z1xccd47vi4r9p1ip6q2pma9xs"))))
   (cons "node_modules/escape-string-regexp"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-4.0.0.tgz")
                 (sha256 (base32 "06xi6f77ybg7cl673bawycpp6984h2ridzy2hl2kqylqlr6s2i2b"))))
   (cons "node_modules/eslint"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/eslint/-/eslint-9.31.0.tgz")
                 (sha256 (base32 "0mkmwh7fnjgrksan5f868sasjqy2sda16bfqdvnvcfc9cyq9w4qv"))))
   (cons "node_modules/eslint-config-prettier"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/eslint-config-prettier/-/eslint-config-prettier-9.1.0.tgz")
                 (sha256 (base32 "0kcn1ysyaqcpw6a4cx6rwxzsipl2l1ri57bi3l1lywfddqv0gjbk"))))
   (cons "node_modules/eslint-plugin-prettier"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/eslint-plugin-prettier/-/eslint-plugin-prettier-5.2.1.tgz")
                 (sha256 (base32 "088wg7w4wn2dh66w4jflcx7fm1sdwc1xdsnw81qkcjfkdhk8hlfj"))))
   (cons "node_modules/eslint-plugin-react"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/eslint-plugin-react/-/eslint-plugin-react-7.36.1.tgz")
                 (sha256 (base32 "1i55xycbfgl5ailx9j12yv5b2zhdxvm4i821nqj1j240rxs1x2qn"))))
   (cons "node_modules/eslint-plugin-react-compiler"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/eslint-plugin-react-compiler/-/eslint-plugin-react-compiler-19.1.0-rc.2.tgz")
                 (sha256 (base32 "1ls6fjs6v2pjawhdw3a5l2wr11iv8pxs32g2zzcwhg0af06j02wk"))))
   (cons "node_modules/eslint-plugin-react-hooks"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/eslint-plugin-react-hooks/-/eslint-plugin-react-hooks-5.2.0.tgz")
                 (sha256 (base32 "1aj0y9fm839r3i9rhl8jhcpmj6ywf3xcs38a6r4y9ipvdmblrlsb"))))
   (cons "node_modules/eslint-plugin-react/node_modules/resolve"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/resolve/-/resolve-2.0.0-next.5.tgz")
                 (sha256 (base32 "093qshncs1q96vaqnfvp3i2ym3hm1pz7qb64qbqs2chcgxaja8nk"))))
   (cons "node_modules/eslint-plugin-react/node_modules/semver"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/semver/-/semver-6.3.1.tgz")
                 (sha256 (base32 "0c0jxgjhgpxx7hdbmwghndq2mdpg58295mwv1b8cp6g070m096rw"))))
   (cons "node_modules/eslint-plugin-simple-import-sort"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/eslint-plugin-simple-import-sort/-/eslint-plugin-simple-import-sort-12.1.1.tgz")
                 (sha256 (base32 "19v8xr107z1al160l0n25p10kpfbklgb7dcljgg51dlgwx535idi"))))
   (cons "node_modules/eslint-scope"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/eslint-scope/-/eslint-scope-8.4.0.tgz")
                 (sha256 (base32 "0jyvvnhj2mmw385lrn0c8pqphk8rl0c2rf5yp61rv3m95m08m8n3"))))
   (cons "node_modules/eslint-visitor-keys"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/eslint-visitor-keys/-/eslint-visitor-keys-3.4.3.tgz")
                 (sha256 (base32 "1sma85l113d6wmbi0v1iayg0h91zsd2karf5zx0y2ihfc4n5kkih"))))
   (cons "node_modules/eslint/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.3.4.tgz")
                 (sha256 (base32 "1kwbyb5m63bz8a2bvhy4gsnsma6ks5wa4w5qya6qb9ip5sdjr4h4"))))
   (cons "node_modules/eslint/node_modules/eslint-visitor-keys"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/eslint-visitor-keys/-/eslint-visitor-keys-4.2.1.tgz")
                 (sha256 (base32 "0kypd7al88kv9vffc09zhyh1bk60cqnhm81yzyk0ycs6jlb38y5p"))))
   (cons "node_modules/eslint/node_modules/find-up"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/find-up/-/find-up-5.0.0.tgz")
                 (sha256 (base32 "1d3mr9ifkyz3dljjm6gr6av87a3s7zyn66fq72bc0s9pb3xlx9pl"))))
   (cons "node_modules/eslint/node_modules/glob-parent"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/glob-parent/-/glob-parent-6.0.2.tgz")
                 (sha256 (base32 "0rjhim72pkv230y79xdahhpcnhy4y8fxr7dhr8sf47xyyd1bjnrl"))))
   (cons "node_modules/eslint/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.2.tgz")
                 (sha256 (base32 "0j7vrqxzg2fxip3q0cws360wk3cz2nprr8zkragipziz1piscmqi"))))
   (cons "node_modules/eslint/node_modules/path-exists"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/path-exists/-/path-exists-4.0.0.tgz")
                 (sha256 (base32 "0p3pzdvfy2il8p0dvpp1l688in68bh2zzqzcfzvv7s9c634kbdfv"))))
   (cons "node_modules/espree"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/espree/-/espree-10.4.0.tgz")
                 (sha256 (base32 "1mvi14hayz29fqi1s18lraxh2i43h4h6xl7x31cvll5kh7pvlnsa"))))
   (cons "node_modules/espree/node_modules/eslint-visitor-keys"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/eslint-visitor-keys/-/eslint-visitor-keys-4.2.1.tgz")
                 (sha256 (base32 "0kypd7al88kv9vffc09zhyh1bk60cqnhm81yzyk0ycs6jlb38y5p"))))
   (cons "node_modules/esquery"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/esquery/-/esquery-1.5.0.tgz")
                 (sha256 (base32 "1j4qma21y1xvmcnwr5jzf0wp03abgzpfkgclrfriwcifxvriqnzf"))))
   (cons "node_modules/esrecurse"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/esrecurse/-/esrecurse-4.3.0.tgz")
                 (sha256 (base32 "0q9vg6dmzdcy4mmm6dnmz1d9dfrm1gvi32n8f2slfsr9sxq97kry"))))
   (cons "node_modules/estraverse"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/estraverse/-/estraverse-5.3.0.tgz")
                 (sha256 (base32 "19pxf86qwp2xl1i8k5w6q81aaldmspmgys0ksnla91c0bgd4b39y"))))
   (cons "node_modules/estree-walker"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/estree-walker/-/estree-walker-3.0.3.tgz")
                 (sha256 (base32 "1cvj3jfzlrg1dskkcwbjaccc00s16jma8mag8yg0kvyrdk0zvgdv"))))
   (cons "node_modules/esutils"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/esutils/-/esutils-2.0.3.tgz")
                 (sha256 (base32 "03v4y32k50mbxwv70prr7ghwg59vd5gyxsdsbdikqnj919rvvbf5"))))
   (cons "node_modules/event-target-shim"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/event-target-shim/-/event-target-shim-5.0.1.tgz")
                 (sha256 (base32 "1g16bd7qlk5q6v23k52fq4xc4na9f8ind4365swh7iz5rni7swgh"))))
   (cons "node_modules/events"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/events/-/events-3.3.0.tgz")
                 (sha256 (base32 "0jsk7gxx98816wg0nl4wfwljscbg7iv8ys68mbgrnaaq1dixsc1c"))))
   (cons "node_modules/expect-type"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/expect-type/-/expect-type-1.3.0.tgz")
                 (sha256 (base32 "0fgj240ahldn8wmrkb7f32hxm4nmqvgd51y45ah3d0a2c30mnxrg"))))
   (cons "node_modules/exponential-backoff"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/exponential-backoff/-/exponential-backoff-3.1.3.tgz")
                 (sha256 (base32 "09imj5s3cg4n0ikisg11bnn8dmhjv3za3n2d60frkyjqwkrh1pif"))))
   (cons "node_modules/fast-deep-equal"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz")
                 (sha256 (base32 "13vvwib6za4zh7054n3fg86y127ig3jb0djqz31qsqr71yca06dh"))))
   (cons "node_modules/fast-diff"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fast-diff/-/fast-diff-1.2.0.tgz")
                 (sha256 (base32 "0vzc0lrzspbxg6mi6njp7bgizyvc90qym6gj1d3hzvg7vvc30ihv"))))
   (cons "node_modules/fast-glob"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fast-glob/-/fast-glob-3.3.2.tgz")
                 (sha256 (base32 "1f3972d3r6daw7q9pp4fdvx4ixdvmzl19aqnpk4s2ll59rzf2lcm"))))
   (cons "node_modules/fast-glob/node_modules/braces"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/braces/-/braces-3.0.3.tgz")
                 (sha256 (base32 "1z2g963jjb92ky7xmcj53lhgyc709vgsf98lidbb8h465j38xl8w"))))
   (cons "node_modules/fast-glob/node_modules/fill-range"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fill-range/-/fill-range-7.1.1.tgz")
                 (sha256 (base32 "0g2r4zadicii5gfp9x5g0mimkyfqyvi8a9xnyqy6j7fb8qs3lv0s"))))
   (cons "node_modules/fast-glob/node_modules/glob-parent"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/glob-parent/-/glob-parent-5.1.2.tgz")
                 (sha256 (base32 "1mfna9lpp82lapng0qq5x4x5j10nhimcx36lg4m5k4wbs7msy5ln"))))
   (cons "node_modules/fast-glob/node_modules/is-number"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-number/-/is-number-7.0.0.tgz")
                 (sha256 (base32 "07nmmpplsj1gxzng6fxhnnyfkif9fvhvxa89d5lrgkwqf42w2xbv"))))
   (cons "node_modules/fast-glob/node_modules/micromatch"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/micromatch/-/micromatch-4.0.8.tgz")
                 (sha256 (base32 "0imwf6rb3y6z95n14ay4d5gzr34rf8zya6ab09gwjfzz1br0b3f7"))))
   (cons "node_modules/fast-glob/node_modules/to-regex-range"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/to-regex-range/-/to-regex-range-5.0.1.tgz")
                 (sha256 (base32 "1ms2bgz2paqfpjv1xpwx67i3dns5j9gn99il6cx5r4qaq9g2afm6"))))
   (cons "node_modules/fast-json-stable-stringify"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fast-json-stable-stringify/-/fast-json-stable-stringify-2.0.0.tgz")
                 (sha256 (base32 "1jppa6scaw1n2b172c7rjm7b9lpygm4w21x0vjp2c424dwbckzf0"))))
   (cons "node_modules/fast-levenshtein"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz")
                 (sha256 (base32 "0g5zgdlp38dli94qbbm8vhvmj90fh48sxpggfn2083wbdcq50jxv"))))
   (cons "node_modules/fast-uri"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fast-uri/-/fast-uri-3.1.4.tgz")
                 (sha256 (base32 "146kcidw5awcl23pc5rvl5hdgs5mkrp86i23649w3x9ra8zdnl4r"))))
   (cons "node_modules/fastq"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fastq/-/fastq-1.17.1.tgz")
                 (sha256 (base32 "0kss0rmdy3ydc94f28my98vv2y8x0hb45ymqn5kbr3b70c55pn1l"))))
   (cons "node_modules/file-entry-cache"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/file-entry-cache/-/file-entry-cache-8.0.0.tgz")
                 (sha256 (base32 "1f2p5nmcw95z754r3msds3z39rhgsqxcldc93x512s12x9n5mb37"))))
   (cons "node_modules/filelist"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/filelist/-/filelist-1.0.6.tgz")
                 (sha256 (base32 "00zhfi49a40lahnldrlky9a08m3vxnysliamh5ksmrhdbqkp0qqj"))))
   (cons "node_modules/filelist/node_modules/brace-expansion"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/brace-expansion/-/brace-expansion-2.1.2.tgz")
                 (sha256 (base32 "19f83xr12lbhj7sx4cqsvdmdwzgajgsfw2v257y2gccq5qfzld43"))))
   (cons "node_modules/filelist/node_modules/minimatch"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/minimatch/-/minimatch-5.1.9.tgz")
                 (sha256 (base32 "1zjcppmxxpyb652a3zsnmas009n2wrkhnqk1qrmbpjlzpb7xmrv7"))))
   (cons "node_modules/flat-cache"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/flat-cache/-/flat-cache-4.0.1.tgz")
                 (sha256 (base32 "1w6smvr0qqdyvsvn2ws5m3ykrsb795mjy47llh92hyc4n3i5l272"))))
   (cons "node_modules/flatted"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/flatted/-/flatted-3.4.2.tgz")
                 (sha256 (base32 "09c0zj1qgs8zpxwy59ixxs5qq8knp3pckjzwak9ybff5dvrs7npl"))))
   (cons "node_modules/for-each"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/for-each/-/for-each-0.3.3.tgz")
                 (sha256 (base32 "0hdz7fjckmnjzqd1njappy4wf0i31zmh91glldkk4knbn5cj1kph"))))
   (cons "node_modules/form-data"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/form-data/-/form-data-4.0.6.tgz")
                 (sha256 (base32 "0mxmic4kv6icgkarrj953v09cmhijryxlimscy1kgx99nvlr8kgw"))))
   (cons "node_modules/framer-motion"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/framer-motion/-/framer-motion-12.23.22.tgz")
                 (sha256 (base32 "057nikg28bzg3qx267cj8m9mc33x9jnbiqfagfqmr54df5sydhwq"))))
   (cons "node_modules/fs-extra"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fs-extra/-/fs-extra-10.1.0.tgz")
                 (sha256 (base32 "1shzjwi0jj6haqwji5mc45nb08gw0zyq6gy26mmv0sw65s2ngajh"))))
   (cons "node_modules/fs.realpath"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz")
                 (sha256 (base32 "174g5vay9jnd7h5q8hfdw6dnmwl1gdpn4a8sz0ysanhj2f3wp04y"))))
   (cons "node_modules/fsevents"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fsevents/-/fsevents-2.3.3.tgz")
                 (sha256 (base32 "0zjqkcinvdl2dk5sh95xmk6jh1ay8nhd8i3wxandf7gkbxfplzn7"))))
   (cons "node_modules/function-bind"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/function-bind/-/function-bind-1.1.2.tgz")
                 (sha256 (base32 "1ah7x13hmwwfslk72h2rs21c5vqnsxyzqifl2x7lb8823djh4i3h"))))
   (cons "node_modules/function.prototype.name"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/function.prototype.name/-/function.prototype.name-1.1.6.tgz")
                 (sha256 (base32 "1y0xfrlsaxikvlhlvv1gmn2slzjlkm0zi0knn2zizl9j4b6wn4nh"))))
   (cons "node_modules/functions-have-names"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/functions-have-names/-/functions-have-names-1.2.3.tgz")
                 (sha256 (base32 "1p5iz84vhxa1b9cfqhdhqgz746lg2ahmcsiz7q4m6z3g02fckq1v"))))
   (cons "node_modules/gensync"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/gensync/-/gensync-1.0.0-beta.2.tgz")
                 (sha256 (base32 "1j8piprq5pvns7j60gm0jkrdmnm8zrfl2wwarf94ypd34vpr57yz"))))
   (cons "node_modules/get-intrinsic"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/get-intrinsic/-/get-intrinsic-1.3.0.tgz")
                 (sha256 (base32 "0i05g3xvqgv16ss19k3jprfnkqsln2n4m7wgn3xldzh09vjjfbk6"))))
   (cons "node_modules/get-proto"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/get-proto/-/get-proto-1.0.1.tgz")
                 (sha256 (base32 "1086swsp92367j7m6canvgf6zwghh0iqr9f2bwndh7qzzcmcab7b"))))
   (cons "node_modules/get-stream"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/get-stream/-/get-stream-5.2.0.tgz")
                 (sha256 (base32 "077iv0jqfgqyxw6jb0iradw9idjcmphmrc58zj050vf58yx0bzkr"))))
   (cons "node_modules/get-symbol-description"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/get-symbol-description/-/get-symbol-description-1.0.2.tgz")
                 (sha256 (base32 "06dd2qnng670s7gc2rzbmw5jv4i4qqags42mkq0zgi0kvabah6lx"))))
   (cons "node_modules/gettext-extractor"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/gettext-extractor/-/gettext-extractor-3.5.4.tgz")
                 (sha256 (base32 "1npygnmlrbqkfsk2jk4x552v2ckh8770llxwpr1nkd6f4y4xhk5z"))))
   (cons "node_modules/gettext-extractor/node_modules/parse5"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/parse5/-/parse5-5.1.1.tgz")
                 (sha256 (base32 "0x9yhqny7n39bsa1xy52xsc6yx1zs5v8mn79bv67x2mpf3zpwwlj"))))
   (cons "node_modules/gettext-extractor/node_modules/typescript"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/typescript/-/typescript-4.9.5.tgz")
                 (sha256 (base32 "01gmbf7ngk4as4qvn81yhp24vnn0rvq0g8z846lpl169g7halbvf"))))
   (cons "node_modules/gettext-parser"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/gettext-parser/-/gettext-parser-6.0.0.tgz")
                 (sha256 (base32 "1rr7i22n9v78d0bhfk613s7x5p3f7r16gcfsmkp4vc10y14lfa9c"))))
   (cons "node_modules/gettext-parser/node_modules/buffer"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/buffer/-/buffer-6.0.3.tgz")
                 (sha256 (base32 "1xaim9bjs0l0any341dijprl7x576k6sgbm9qnrgdz2a494nynsm"))))
   (cons "node_modules/gettext-parser/node_modules/readable-stream"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/readable-stream/-/readable-stream-4.2.0.tgz")
                 (sha256 (base32 "0v5kf2h5dzp7a59l594s4wslkrpapzxi6d0v7z4drfyhlkki48dn"))))
   (cons "node_modules/gettext-parser/node_modules/safe-buffer"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.2.1.tgz")
                 (sha256 (base32 "1s5kvjpwqsc682zcy71h9c6pxla21sysfwj270x6jjkca421h62x"))))
   (cons "node_modules/gl-matrix"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/gl-matrix/-/gl-matrix-3.4.3.tgz")
                 (sha256 (base32 "0xgaqiyy5vdpb7f4qlwi656lp22m6nf7yyq1bx7qiycpvjblvv5i"))))
   (cons "node_modules/glob"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/glob/-/glob-7.2.0.tgz")
                 (sha256 (base32 "06q5g9ja57jfca5qqbnad6lfhd7xv2kziy9xpqf97ipd5zg77vpn"))))
   (cons "node_modules/global-agent"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/global-agent/-/global-agent-3.0.0.tgz")
                 (sha256 (base32 "1acy97l5xlaiakqkacb35qwf0cfb5zqgxld05d30y5nd5k7pb2f3"))))
   (cons "node_modules/globals"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/globals/-/globals-15.9.0.tgz")
                 (sha256 (base32 "1wx6gv924nbfj51hkcdgqb7n6n90z3ivbim4clz599x598v00jjh"))))
   (cons "node_modules/globalthis"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/globalthis/-/globalthis-1.0.3.tgz")
                 (sha256 (base32 "1za8hw9nm9mvyfadf5z3a4q9gyzjspwpzhna3i1ap4wjafmq0rni"))))
   (cons "node_modules/google-protobuf"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/google-protobuf/-/google-protobuf-3.21.0.tgz")
                 (sha256 (base32 "0siwzy7y8wrrd8yvqh4p548119i9r09wnf5cpva2c2lklawhgrrp"))))
   (cons "node_modules/gopd"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/gopd/-/gopd-1.2.0.tgz")
                 (sha256 (base32 "10nskxn4cwbfd9i9nzy2r7pf0zm46j9z7dzvd0adr1fj9pgd0dnm"))))
   (cons "node_modules/got"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/got/-/got-11.8.6.tgz")
                 (sha256 (base32 "00x52m4xidmkhn2gz3v2hn39vp5hyg0n70r15a3rx98z3gbvxkq2"))))
   (cons "node_modules/graceful-fs"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.11.tgz")
                 (sha256 (base32 "1709vla02prpbf34xqsvkqngvsmp5ypnljvg1pcgxrk1l553fq9r"))))
   (cons "node_modules/graphemer"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/graphemer/-/graphemer-1.4.0.tgz")
                 (sha256 (base32 "04flmsayjj7w3y9sihqclzpavhfqgpbk5ax2svb0azkkk217b6b7"))))
   (cons "node_modules/grpc_tools_node_protoc_ts"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/grpc_tools_node_protoc_ts/-/grpc_tools_node_protoc_ts-5.3.3.tgz")
                 (sha256 (base32 "1xqssv6925n7dxnla7nz39667ic816zny919f14srfz90v0vzb04"))))
   (cons "node_modules/grpc_tools_node_protoc_ts/node_modules/google-protobuf"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/google-protobuf/-/google-protobuf-3.15.8.tgz")
                 (sha256 (base32 "0xmb8w17658j8pxxlbjkf9m39rrgc82gr60d2q9scczchyx7qan5"))))
   (cons "node_modules/handlebars"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/handlebars/-/handlebars-4.7.9.tgz")
                 (sha256 (base32 "18cs153fg353yx9ym0x8hrwrr412dspkpq0r7qb8dpfpvspwq33f"))))
   (cons "node_modules/has-bigints"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/has-bigints/-/has-bigints-1.0.2.tgz")
                 (sha256 (base32 "1qqcaxl85mlm4a7xfagb7h6f4r1gb0lll1w8sif4qw1hzbqq4yr0"))))
   (cons "node_modules/has-flag"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/has-flag/-/has-flag-4.0.0.tgz")
                 (sha256 (base32 "1cdmvliwz8h02nwg0ipli0ydd1l82sz9s1m7bj5bn9yr24afp9vp"))))
   (cons "node_modules/has-property-descriptors"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/has-property-descriptors/-/has-property-descriptors-1.0.2.tgz")
                 (sha256 (base32 "11zsidd9sb9v0bzq7ia9iw4h5mgjdwn5mxgzdvmqw9ifygcbn682"))))
   (cons "node_modules/has-proto"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/has-proto/-/has-proto-1.0.3.tgz")
                 (sha256 (base32 "0ayqh62sl2fg8b11km8xccwfc3iygmk6nx8naa9kvdfg6wd6jqax"))))
   (cons "node_modules/has-symbols"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/has-symbols/-/has-symbols-1.1.0.tgz")
                 (sha256 (base32 "1ig7dbwgg0kbjg2wc7arp7a28g6l2rwc27lsvhnxzf185x9wfq24"))))
   (cons "node_modules/has-tostringtag"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/has-tostringtag/-/has-tostringtag-1.0.2.tgz")
                 (sha256 (base32 "0yzgy2kkf5z4w3x68r1ymm3aln7ji4ndfis7z1qn56hpy7ip876w"))))
   (cons "node_modules/hasown"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/hasown/-/hasown-2.0.4.tgz")
                 (sha256 (base32 "0k2fia5l1m6wpsala5ldacnfshiiirhww91iq7hh0djpjlzv1lp9"))))
   (cons "node_modules/hermes-estree"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/hermes-estree/-/hermes-estree-0.25.1.tgz")
                 (sha256 (base32 "1k7pw8xw03qlhgg0flb5kan52z59i6aalmg3fn9vahzp87dskc29"))))
   (cons "node_modules/hermes-parser"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/hermes-parser/-/hermes-parser-0.25.1.tgz")
                 (sha256 (base32 "1aiwlhc5a0sr4lpy3gffiygg6x46160ljs2kc89jkpci1wnqh2bl"))))
   (cons "node_modules/hoist-non-react-statics"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/hoist-non-react-statics/-/hoist-non-react-statics-3.3.2.tgz")
                 (sha256 (base32 "1fn8c8a85nszglnyygpc1dzg2h7k7xwylqg0l88if5sp5jsy8yhg"))))
   (cons "node_modules/hosted-git-info"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/hosted-git-info/-/hosted-git-info-4.1.0.tgz")
                 (sha256 (base32 "1pjzmqa9nz5pbmqa3mg24d0xv301wqbzgk71rfz9l7warz5z9zxq"))))
   (cons "node_modules/http-cache-semantics"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/http-cache-semantics/-/http-cache-semantics-4.2.0.tgz")
                 (sha256 (base32 "1dqfv0xk3fm9zz6ypvz0gq5s10a1mmq7ryxvm95nml5jibdm8x7m"))))
   (cons "node_modules/http-proxy-agent"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/http-proxy-agent/-/http-proxy-agent-7.0.2.tgz")
                 (sha256 (base32 "00kgi96l0vs04g2vl2xw3g53saxb4n9za2x23pbaiyrbm7x76pvq"))))
   (cons "node_modules/http-proxy-agent/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.4.3.tgz")
                 (sha256 (base32 "19z48fpic8jbb2833gh3bviylzp9512i2dsqhxd91s3fjjfarhc9"))))
   (cons "node_modules/http-proxy-agent/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/http2-wrapper"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/http2-wrapper/-/http2-wrapper-1.0.3.tgz")
                 (sha256 (base32 "07l26r82ixnlr5775afcw6a03c2bmih8z8lymc3izd5qgckrw7gx"))))
   (cons "node_modules/https-proxy-agent"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/https-proxy-agent/-/https-proxy-agent-7.0.6.tgz")
                 (sha256 (base32 "1q603cjw6z348j2i7k7s5zb3kp91hi9lml298bv84214wpl8j3wn"))))
   (cons "node_modules/https-proxy-agent/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.4.3.tgz")
                 (sha256 (base32 "19z48fpic8jbb2833gh3bviylzp9512i2dsqhxd91s3fjjfarhc9"))))
   (cons "node_modules/https-proxy-agent/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/iconv-lite"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.6.3.tgz")
                 (sha256 (base32 "1x681ziwavjjn09j4858fl3h3xi90vf512k5zwg06kwriwafq9vi"))))
   (cons "node_modules/ieee754"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ieee754/-/ieee754-1.2.1.tgz")
                 (sha256 (base32 "1b4xiyr6fmgl05cjgc8fiyfk2jagf7xq2y5rknw9scvy76dlpwcf"))))
   (cons "node_modules/ignore"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ignore/-/ignore-5.3.1.tgz")
                 (sha256 (base32 "1q35l5kx6220h9c1a85apnhmx3yispvamfcmna06qividczx2caf"))))
   (cons "node_modules/immediate"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/immediate/-/immediate-3.0.6.tgz")
                 (sha256 (base32 "04cxfcl4zm2qfsrrd19n5w4w8k8309wl1k2xq0c0ic2hjvrr5iwq"))))
   (cons "node_modules/import-fresh"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/import-fresh/-/import-fresh-3.3.1.tgz")
                 (sha256 (base32 "1xsgyzk76d3w7nwk7yf9rl795xwn0dzk054wy7c8b9diw98g8q6d"))))
   (cons "node_modules/imurmurhash"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/imurmurhash/-/imurmurhash-0.1.4.tgz")
                 (sha256 (base32 "0q6bf91h2g5dhvcdss74sjvp5irimd97hp73jb8p2wvajqqs08xc"))))
   (cons "node_modules/inflight"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz")
                 (sha256 (base32 "16w864087xsh3q7f5gm3754s7bpsb9fq3dhknk9nmbvlk3sxr7ss"))))
   (cons "node_modules/inherits"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz")
                 (sha256 (base32 "1bxg4igfni2hymabg8bkw86wd3qhhzhsswran47sridk3dnbqkfr"))))
   (cons "node_modules/internal-slot"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/internal-slot/-/internal-slot-1.0.7.tgz")
                 (sha256 (base32 "08pbmj5z8dn3nm64z55lpa3xy44g6j13i09g1a18ahaqm6sq6bkq"))))
   (cons "node_modules/is-array-buffer"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-array-buffer/-/is-array-buffer-3.0.4.tgz")
                 (sha256 (base32 "1bj107dg7vsvk3vcmvkca8jk006g8wkni5x1ys7ahswxhw753gqz"))))
   (cons "node_modules/is-async-function"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-async-function/-/is-async-function-2.0.0.tgz")
                 (sha256 (base32 "0ya2gv69is5gdc6fbgc3y2jz95dhpim26hg86ra1070kw3axdi2q"))))
   (cons "node_modules/is-bigint"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-bigint/-/is-bigint-1.0.4.tgz")
                 (sha256 (base32 "1mjf4m0l0yqp5qqk5rd6s1048rj2nmvj5mnpskbrz1d72rja0ya0"))))
   (cons "node_modules/is-boolean-object"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-boolean-object/-/is-boolean-object-1.1.2.tgz")
                 (sha256 (base32 "1czjzij32nbj0l0p2nizajy6m9spqq1wwdsz8khqnr1gqmkbd6f4"))))
   (cons "node_modules/is-callable"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-callable/-/is-callable-1.2.7.tgz")
                 (sha256 (base32 "18f30fsh8kckhfshfyfq98n4z9hbi2fvfbyagy2schmii976wp0v"))))
   (cons "node_modules/is-core-module"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-core-module/-/is-core-module-2.13.1.tgz")
                 (sha256 (base32 "0a4sbzny5baziyg5jsv3dqb91ja2lwvdmpcva2kwd8rifcjp56wd"))))
   (cons "node_modules/is-data-view"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-data-view/-/is-data-view-1.0.1.tgz")
                 (sha256 (base32 "1s2k2w09669ixbq2bky8b6n23k9v4hl3mvh9gvk3hvdy5scr6jnn"))))
   (cons "node_modules/is-date-object"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-date-object/-/is-date-object-1.0.5.tgz")
                 (sha256 (base32 "1m65xvxqmfxhh66rz77anznhg47vdhf2x9j8b53g5qzq1nqv44ik"))))
   (cons "node_modules/is-extglob"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-extglob/-/is-extglob-2.1.1.tgz")
                 (sha256 (base32 "06dwa2xzjx6az40wlvwj11vican2w46710b9170jzmka2j344pcc"))))
   (cons "node_modules/is-finalizationregistry"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-finalizationregistry/-/is-finalizationregistry-1.0.2.tgz")
                 (sha256 (base32 "1cpj68f80jlb0ppsbxl7szif5x85m5p0m3y5gx5hr6y5g244nwjb"))))
   (cons "node_modules/is-fullwidth-code-point"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz")
                 (sha256 (base32 "0jmw03rxmbwbrkx0a8wq05qsjhdrx9jn3vns88dhy1y6bnp5shbg"))))
   (cons "node_modules/is-generator-function"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-generator-function/-/is-generator-function-1.0.10.tgz")
                 (sha256 (base32 "0iqcr4pxv9iiqjsv1glhsjlzr16xfaahq7hxmn9lgqshxpqyn03i"))))
   (cons "node_modules/is-glob"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-glob/-/is-glob-4.0.3.tgz")
                 (sha256 (base32 "1imyq6pjl716cjc1ypmmnn0574rh28av3pq50mpqzd9v37xm7r1z"))))
   (cons "node_modules/is-map"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-map/-/is-map-2.0.3.tgz")
                 (sha256 (base32 "13z9nvyd6f8y5hq0m115mqsfyxd1881x51djllx39d4dla61v64v"))))
   (cons "node_modules/is-negative-zero"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-negative-zero/-/is-negative-zero-2.0.3.tgz")
                 (sha256 (base32 "0fhsbii12qv882g56k3ywi4fsj01cc8wma74yj2h2il286l29m7r"))))
   (cons "node_modules/is-number-object"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-number-object/-/is-number-object-1.0.7.tgz")
                 (sha256 (base32 "0xcv1ax7bggrhvf1c9a0a48al55abkn2cs258nncgvad9h56nddb"))))
   (cons "node_modules/is-regex"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-regex/-/is-regex-1.1.4.tgz")
                 (sha256 (base32 "0g1hlf8hd53cpxpnk4l519jcqbg8ibynhg704bnfglwa9rqdv497"))))
   (cons "node_modules/is-set"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-set/-/is-set-2.0.3.tgz")
                 (sha256 (base32 "1mr1jag05rwja0wrlssy9axw2jskwhbg33f98qka8ydjlgp0rqiy"))))
   (cons "node_modules/is-shared-array-buffer"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-shared-array-buffer/-/is-shared-array-buffer-1.0.3.tgz")
                 (sha256 (base32 "0jvnsq1fa0gprjx4vfp457lr2xblfswb32dml5rgwpv2lfwn3kdz"))))
   (cons "node_modules/is-string"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-string/-/is-string-1.0.7.tgz")
                 (sha256 (base32 "1x6fsxc1kpj7xpkzzp4bl3nakyyi0mv81yvmbjqk6q56vh1kdynd"))))
   (cons "node_modules/is-symbol"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-symbol/-/is-symbol-1.0.4.tgz")
                 (sha256 (base32 "03yw61jx8bsvwhpjyb874ncvc9nmgi39q1kv4rlbyz0cb4jy33vw"))))
   (cons "node_modules/is-typed-array"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-typed-array/-/is-typed-array-1.1.13.tgz")
                 (sha256 (base32 "172smf294mgjam5s7gis314khvhzapqvzj6ggmvbm1xl09wad4ws"))))
   (cons "node_modules/is-weakmap"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-weakmap/-/is-weakmap-2.0.2.tgz")
                 (sha256 (base32 "15x9apmi7qvy84lsww596zcz1h6kivlx1fajmrxc05czgyglx2pi"))))
   (cons "node_modules/is-weakref"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-weakref/-/is-weakref-1.0.2.tgz")
                 (sha256 (base32 "01a5149yadp14gzcljv4z23fwmbdnszxls8jdrh6172jw4mmgi4p"))))
   (cons "node_modules/is-weakset"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/is-weakset/-/is-weakset-2.0.3.tgz")
                 (sha256 (base32 "10h03i8k160lbl27lcg5yqg58akdkfcpdhh70p1dh33nfh791f0a"))))
   (cons "node_modules/isarray"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/isarray/-/isarray-0.0.1.tgz")
                 (sha256 (base32 "02lz1bvrrj779zlwidir18a7dp1ac194r7d0jbnhm04n0q14911y"))))
   (cons "node_modules/isbinaryfile"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/isbinaryfile/-/isbinaryfile-5.0.7.tgz")
                 (sha256 (base32 "1llrlh509l1278n73rhf388s9kkam1v2z9vnrjc6gg4i10l7i30v"))))
   (cons "node_modules/isexe"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz")
                 (sha256 (base32 "0nc3rcqjgyb9yyqajwlzzhfcqmsb682z7zinnx9qrql8w1rfiks7"))))
   (cons "node_modules/iterator.prototype"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/iterator.prototype/-/iterator.prototype-1.1.2.tgz")
                 (sha256 (base32 "12adbvh0aibfqj031dqxn5am8mg4k8s5fyppksfv49ri0s3qzpfw"))))
   (cons "node_modules/jake"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/jake/-/jake-10.9.4.tgz")
                 (sha256 (base32 "1mzsdqak7cln2nrdz12cd8s8x73jsrs1m4g35iw803hkf3rp0hm6"))))
   (cons "node_modules/jiti"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/jiti/-/jiti-2.5.1.tgz")
                 (sha256 (base32 "1irqmrx1227j3g6jbp6jrwh3v2r9igzd8vx5fpdqc13aq3gi1f8d"))))
   (cons "node_modules/js-tokens"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/js-tokens/-/js-tokens-4.0.0.tgz")
                 (sha256 (base32 "0lrw3qvcfmxrwwi7p7ng4r17yw32ki7jpnbj2a65ddddv2icg16q"))))
   (cons "node_modules/js-yaml"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/js-yaml/-/js-yaml-4.3.0.tgz")
                 (sha256 (base32 "1rpsplprciliax3msz9dmglkp6fw8cl21z9lr4gf9lkd94sfx545"))))
   (cons "node_modules/jsesc"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/jsesc/-/jsesc-3.1.0.tgz")
                 (sha256 (base32 "029w1pc3jck2y6bg2g9vvz3mij38l992zb7jhfzp16narhjj4w8c"))))
   (cons "node_modules/json-buffer"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/json-buffer/-/json-buffer-3.0.1.tgz")
                 (sha256 (base32 "19gmzrfyy4k7sckqgc3gsz5hpkjg6gg75nhrr5rmyg3ip56ldxyi"))))
   (cons "node_modules/json-schema-traverse"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz")
                 (sha256 (base32 "0rf0pvm62k8g81vs7n7zx080p6sfylwk52vc149jx1216vcssdgp"))))
   (cons "node_modules/json-stable-stringify-without-jsonify"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/json-stable-stringify-without-jsonify/-/json-stable-stringify-without-jsonify-1.0.1.tgz")
                 (sha256 (base32 "1smffz68mhcb5w6ckflwfh2n91nbi6z0vk8rhbxvk3lbhnn61gax"))))
   (cons "node_modules/json-stringify-safe"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz")
                 (sha256 (base32 "12ljc7ipy7cprz5zxzzds20ykw6z5616763ca5zx9xmzq1jvzyxp"))))
   (cons "node_modules/json5"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/json5/-/json5-2.2.3.tgz")
                 (sha256 (base32 "0yrpsb1frqahc48n6w2jzvhd7m8r9w2w9ylqkg41zl80nqyv7bq8"))))
   (cons "node_modules/jsonfile"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/jsonfile/-/jsonfile-6.2.1.tgz")
                 (sha256 (base32 "0dhdairwb10x1z0pfbgkx8wzpq9i3p1kfbldhl88nlbczkdy26kc"))))
   (cons "node_modules/jsx-ast-utils"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/jsx-ast-utils/-/jsx-ast-utils-3.1.0.tgz")
                 (sha256 (base32 "1ry6kl6agbxk73i2gqmy6fwpdrwrbsjyqlncyl9nchbwnlq922f8"))))
   (cons "node_modules/jszip"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/jszip/-/jszip-3.10.1.tgz")
                 (sha256 (base32 "08qvnasvaajkjkjr2lp7jz63b0fmb9brr0ivpw3v7bj5lsig85si"))))
   (cons "node_modules/keyv"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/keyv/-/keyv-4.5.4.tgz")
                 (sha256 (base32 "1630gds0l00zmx2kiaa76ybf6ig7ygsm8ssy6sjg8yp5c72z29pb"))))
   (cons "node_modules/lazy-val"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/lazy-val/-/lazy-val-1.0.5.tgz")
                 (sha256 (base32 "0wjk8d0mw86wpbvizvqkl2bn36fx64wbyvxlspxijgfvk2nh51kx"))))
   (cons "node_modules/levn"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/levn/-/levn-0.4.1.tgz")
                 (sha256 (base32 "1lb7409xvyj4sz36pslhrcz283yycc1fxzf0k4c554qgvza5fi0z"))))
   (cons "node_modules/lie"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/lie/-/lie-3.3.0.tgz")
                 (sha256 (base32 "0vm3wrzfrjmv2qjcf6fch7znad6k6kd5b34cb31jy3m1shf4df1d"))))
   (cons "node_modules/locate-path"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/locate-path/-/locate-path-6.0.0.tgz")
                 (sha256 (base32 "0al3dmihydmwr89wc4ivqnkww7gm9p2ysq57j5qrj6sq8ckhplki"))))
   (cons "node_modules/lodash"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/lodash/-/lodash-4.18.1.tgz")
                 (sha256 (base32 "05mfj422yf8xfpaf9gyd3ph2vd83rwng39cwir1dgjc8lk144sb9"))))
   (cons "node_modules/lodash.camelcase"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/lodash.camelcase/-/lodash.camelcase-4.3.0.tgz")
                 (sha256 (base32 "0kb7w25xhbfcsa6fdnw7vhw451rf4dplgdjmw9hwy4cyl4sxhqjh"))))
   (cons "node_modules/lodash.get"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/lodash.get/-/lodash.get-4.4.2.tgz")
                 (sha256 (base32 "16x492caalx0y2z91pmx3vrx6y0vw56z020b6vlgyv0mp2hynkfz"))))
   (cons "node_modules/lodash.merge"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/lodash.merge/-/lodash.merge-4.6.2.tgz")
                 (sha256 (base32 "15pgb54k3jl0qq1x5qdcvbm456y254gzyln667p1ajnna2ljfkm3"))))
   (cons "node_modules/long"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/long/-/long-5.3.2.tgz")
                 (sha256 (base32 "09kbcinla92p75h69i90v5n730wxfaxl34z5r597vpvkcx33w0v8"))))
   (cons "node_modules/loose-envify"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/loose-envify/-/loose-envify-1.4.0.tgz")
                 (sha256 (base32 "1p5b3ca0b2jkxalyg7h9bss6aspa8plkh0ak1mrlz2jkjc58660j"))))
   (cons "node_modules/lowercase-keys"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/lowercase-keys/-/lowercase-keys-2.0.0.tgz")
                 (sha256 (base32 "0l9vf2m7zz1hw8s0l2njhk3b128mq0z27z17dgpmk4ivcg181ij3"))))
   (cons "node_modules/lru-cache"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/lru-cache/-/lru-cache-6.0.0.tgz")
                 (sha256 (base32 "0pnziizgv8jpg708ykywcjby0syjz1l2ll1j727rdxhw0gmhvr2w"))))
   (cons "node_modules/magic-string"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/magic-string/-/magic-string-0.30.21.tgz")
                 (sha256 (base32 "0vv5mh4rnr83gnpd0kkspy1c810f4mfkczrjry64x96wcwjpcjgs"))))
   (cons "node_modules/matcher"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/matcher/-/matcher-3.0.0.tgz")
                 (sha256 (base32 "17sbpdkgfp24l1nr9qbxsih2sswbw08dam5xsvivfcg2z372hfxh"))))
   (cons "node_modules/math-intrinsics"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/math-intrinsics/-/math-intrinsics-1.1.0.tgz")
                 (sha256 (base32 "19s3yi9ziz007ymq0r1k2xk1nrg2m5lc9kw8vy3c0ga9fmaw7hmq"))))
   (cons "node_modules/merge2"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/merge2/-/merge2-1.4.1.tgz")
                 (sha256 (base32 "10bq7m23r366fk3r6j058i1l4jz6vn5xlxcfnp2mkj5kr68i4f5q"))))
   (cons "node_modules/mime"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/mime/-/mime-2.6.0.tgz")
                 (sha256 (base32 "0dmnrpwk42m7cr2v8knszz4qg1py6645jgbmha2smm1gxakil0dk"))))
   (cons "node_modules/mime-db"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/mime-db/-/mime-db-1.52.0.tgz")
                 (sha256 (base32 "0fwyiyqi3w03w3xwy2jhm8rsa0y9wgkc0j6q3q6mvk9asns0prxq"))))
   (cons "node_modules/mime-types"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/mime-types/-/mime-types-2.1.35.tgz")
                 (sha256 (base32 "1hyi043kcqyfz82w19s357klvj54f0s94d40rymbms86i74lyws9"))))
   (cons "node_modules/mimic-response"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/mimic-response/-/mimic-response-1.0.1.tgz")
                 (sha256 (base32 "1s4cran004criblxk656ajagx924cy3wps608ksssyxc1qn01wa2"))))
   (cons "node_modules/minimatch"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/minimatch/-/minimatch-3.1.5.tgz")
                 (sha256 (base32 "0j66fa5bw8xrkiyl6p5g88d9wg4l5mshfi3jsg2wiqrdyzn1f66q"))))
   (cons "node_modules/minimist"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/minimist/-/minimist-1.2.8.tgz")
                 (sha256 (base32 "10yfwkrl00d8gy9z622yrklg1jax3qk38j354jfw34xk2p0pc2im"))))
   (cons "node_modules/minipass"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/minipass/-/minipass-7.1.3.tgz")
                 (sha256 (base32 "04kxs8if6f6vj9vkhhrnzp3y58fls2300mlfr7yy6m9pfjz63b2j"))))
   (cons "node_modules/minizlib"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/minizlib/-/minizlib-3.1.0.tgz")
                 (sha256 (base32 "1qz2xkdz5zpr70z4g79pwb3ipxv81i4kfiv5y1qxswl1c4ljxgwr"))))
   (cons "node_modules/mkdirp"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/mkdirp/-/mkdirp-0.5.5.tgz")
                 (sha256 (base32 "02mvn5hllnsxzli8yy0gkgkkxndbwd3fh302shadsag3c4db0njf"))))
   (cons "node_modules/motion"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/motion/-/motion-12.23.22.tgz")
                 (sha256 (base32 "1ndwk8vzqd6b0264n1h9q6rifds86b0przjqg0z7z6r02nccm162"))))
   (cons "node_modules/motion-dom"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/motion-dom/-/motion-dom-12.23.21.tgz")
                 (sha256 (base32 "0g377npvw6afw9anhhsfvpykgddj2l0qywqfb2lhqn48yamzmnzp"))))
   (cons "node_modules/motion-utils"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/motion-utils/-/motion-utils-12.23.6.tgz")
                 (sha256 (base32 "0v6rj67x5ip5m5dd9168115jwkpdabbwma5abv58wcs8ahajr9vr"))))
   (cons "node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.0.0.tgz")
                 (sha256 (base32 "1jrysw9zx14av3jdvc3kywc3xkjqxh748g4s6p1iy634i2mm489n"))))
   (cons "node_modules/nanoid"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/nanoid/-/nanoid-3.3.16.tgz")
                 (sha256 (base32 "1dpliwfdc34xcl7l3fqwzn1hi6i0yqganalsmcmg75fznrrggds2"))))
   (cons "node_modules/natural-compare"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/natural-compare/-/natural-compare-1.4.0.tgz")
                 (sha256 (base32 "1vkrwxgc7w81923739lrnqklmpnin52qmhd868vgfr10s7n6jmay"))))
   (cons "node_modules/neo-async"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/neo-async/-/neo-async-2.6.2.tgz")
                 (sha256 (base32 "1x3dxkdflv3ibgab2aj91pkrqpzj62c38dk3x0zvv2qpyh6p18a3"))))
   (cons "node_modules/node-abi"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/node-abi/-/node-abi-4.33.0.tgz")
                 (sha256 (base32 "0l2pz06967rp6jkjnjwymnpbmwc0mmz8mimla1ls3k9ajqain8id"))))
   (cons "node_modules/node-api-version"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/node-api-version/-/node-api-version-0.2.1.tgz")
                 (sha256 (base32 "03ix795pmyjwsvhl443gwcivs7z7pxwgxb6jp3jas2xj0nc1d4y7"))))
   (cons "node_modules/node-gettext"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/node-gettext/-/node-gettext-3.0.0.tgz")
                 (sha256 (base32 "1psyzpgv9f20skf92fhcmzlkf6wq4kjz15dc4xwsx79jmsnd2hwc"))))
   (cons "node_modules/node-gyp"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/node-gyp/-/node-gyp-12.4.0.tgz")
                 (sha256 (base32 "0adz0pkidk6fp0lawc2zw8k9x26l34qh83qfydna6hi9m57ilrf5"))))
   (cons "node_modules/node-gyp/node_modules/isexe"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/isexe/-/isexe-4.0.0.tgz")
                 (sha256 (base32 "18i8pch2c69l71jvw9yl1wdk8ws6fl7z14iixcr9k6xfqgimngf3"))))
   (cons "node_modules/node-gyp/node_modules/undici"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/undici/-/undici-6.28.0.tgz")
                 (sha256 (base32 "173ai163g91i72albsfraxad6ynkpc2qq12man8qpm4gl9pnra1j"))))
   (cons "node_modules/node-gyp/node_modules/which"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/which/-/which-6.0.1.tgz")
                 (sha256 (base32 "1dmzyhaq3a7yaf60ffwapncbgi6nz29pihhfdz0r6bk8vj3swv1h"))))
   (cons "node_modules/node-int64"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/node-int64/-/node-int64-0.4.0.tgz")
                 (sha256 (base32 "0mr21y67mxrzp7ps8w52q8sjp0f4ags8z97f5ig995f86y4n40i5"))))
   (cons "node_modules/node-releases"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/node-releases/-/node-releases-2.0.47.tgz")
                 (sha256 (base32 "084jrxalifyqqjj5aa4sjanssi7mdp0572l85f072vbpghri8k0n"))))
   (cons "node_modules/nopt"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/nopt/-/nopt-9.0.0.tgz")
                 (sha256 (base32 "094bq860gxzxby901s536azhwc790hmlpi11s98cga2bc7ji968g"))))
   (cons "node_modules/normalize-url"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/normalize-url/-/normalize-url-6.1.0.tgz")
                 (sha256 (base32 "03iv7s36r9alrm2krzs05ansrbivd8zgww7f12abdy5sd78b8d4g"))))
   (cons "node_modules/object-assign"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/object-assign/-/object-assign-4.1.1.tgz")
                 (sha256 (base32 "1v999sycxcp74j2pikdhyinm2d80p2bsy4nnrrnb59rv4rm74bbq"))))
   (cons "node_modules/object-inspect"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/object-inspect/-/object-inspect-1.13.1.tgz")
                 (sha256 (base32 "0fs5s8vx963cyzgzvy0m2sh1qbxyx78hdl5imk49jyhhkzva9pp2"))))
   (cons "node_modules/object-keys"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/object-keys/-/object-keys-1.1.1.tgz")
                 (sha256 (base32 "04pjwxszvk8alk6z5lzk02ba3q56i2g70cs02f57qxhraq2xjy4n"))))
   (cons "node_modules/object.assign"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/object.assign/-/object.assign-4.1.5.tgz")
                 (sha256 (base32 "1xyyd1lcy7pxi3q5sc992ymfa54s8rahc29xkyvg1kms22846spl"))))
   (cons "node_modules/object.entries"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/object.entries/-/object.entries-1.1.8.tgz")
                 (sha256 (base32 "1h779sjkw4jp6qqh94lajpzpzlapq41hijkg6sjalm7pr18zbh3a"))))
   (cons "node_modules/object.fromentries"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/object.fromentries/-/object.fromentries-2.0.8.tgz")
                 (sha256 (base32 "0spmpd26n3bgdzxbhnsx2k41mnx248fj1j5b9yqxjw4w7h73q9p7"))))
   (cons "node_modules/object.values"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/object.values/-/object.values-1.2.0.tgz")
                 (sha256 (base32 "0shz7mrnwj8dlp3n5kdvk6y8x9l9hyfsgcfb2wjd0k0xkl3sqkzb"))))
   (cons "node_modules/obug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/obug/-/obug-2.1.1.tgz")
                 (sha256 (base32 "0hxfqqjcy24n7ibc5rz30iqxxqjjm5jdsjzx407wnj14w2a1g913"))))
   (cons "node_modules/once"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/once/-/once-1.4.0.tgz")
                 (sha256 (base32 "1kygzk36kdcfiqz01dhql2dk75rl256m2vlpigv9iikhlc5lclfg"))))
   (cons "node_modules/optionator"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/optionator/-/optionator-0.9.4.tgz")
                 (sha256 (base32 "0sw2q8l29b0a5gfa6zh6941qz5vfrm9h6lzpclg2rbxl87hvnwm7"))))
   (cons "node_modules/p-cancelable"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/p-cancelable/-/p-cancelable-2.1.1.tgz")
                 (sha256 (base32 "1l20j33lw75r4hvrlhahvaj46dwkj8xw45y180i5g3q0qwip1clh"))))
   (cons "node_modules/p-limit"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/p-limit/-/p-limit-3.1.0.tgz")
                 (sha256 (base32 "1q69dflz7cr8j18l0va73jyg2nrzd0vq3jhvvica3yna6sbm3rin"))))
   (cons "node_modules/p-locate"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/p-locate/-/p-locate-5.0.0.tgz")
                 (sha256 (base32 "1z136h1a3c6a20dzsi5qc24ajk2gs8r59gj1n59sfr89m6019h9f"))))
   (cons "node_modules/pako"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/pako/-/pako-1.0.11.tgz")
                 (sha256 (base32 "0h9rmpkzyav4qxpb185z89nrhi17gy8p5mxz1k1l19sj0gf2hh0d"))))
   (cons "node_modules/parent-module"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/parent-module/-/parent-module-1.0.1.tgz")
                 (sha256 (base32 "01z4k8a3y21gqmpcwyf7gq9v8v4k2y5180f5g7qgswd4gq986zk0"))))
   (cons "node_modules/path-is-absolute"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz")
                 (sha256 (base32 "0p7p04xxd8q495qhxmxydyjgzcf762dp1hp2wha2b52n3agp0vbf"))))
   (cons "node_modules/path-key"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/path-key/-/path-key-3.1.1.tgz")
                 (sha256 (base32 "14kvp849wnkg6f3dqgmcb73nnb5k6b3gxf65sgf0x0qlp6n9k2ab"))))
   (cons "node_modules/path-parse"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/path-parse/-/path-parse-1.0.7.tgz")
                 (sha256 (base32 "18vkai53yyiv1c1rimsh2whiymxnz9xj6a39c6b65097ly61jym0"))))
   (cons "node_modules/path-to-regexp"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/path-to-regexp/-/path-to-regexp-1.9.0.tgz")
                 (sha256 (base32 "054dpjiric4anb8rwmf302qlb38xpz3am9jy5w34rkdl4cpdpc2d"))))
   (cons "node_modules/pathe"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/pathe/-/pathe-2.0.3.tgz")
                 (sha256 (base32 "0dnzjq3529b584wj6rich8p0c16s0ydlbn7miw88lzxvbny76fvf"))))
   (cons "node_modules/pe-library"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/pe-library/-/pe-library-0.4.1.tgz")
                 (sha256 (base32 "0yrxpi2pga6g4nawmyy8jkg0wq9j2nr2z7qxf1p5vbik921yx3zm"))))
   (cons "node_modules/picocolors"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/picocolors/-/picocolors-1.1.1.tgz")
                 (sha256 (base32 "1nc2z3w16wpz2840srcwyxd747khwfvh66yigyrpwywn0wldpbnk"))))
   (cons "node_modules/picomatch"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/picomatch/-/picomatch-2.3.2.tgz")
                 (sha256 (base32 "1rmcxh6pfgcgygygg1ivpppv9d5pk9an4q8iaan1bj5y2nh3p12c"))))
   (cons "node_modules/pkijs"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/pkijs/-/pkijs-3.4.0.tgz")
                 (sha256 (base32 "14wpiqcsg7qnvy532qpgggq28mz6dzwvlj520bvrgv74zrvwrwav"))))
   (cons "node_modules/pkijs/node_modules/@noble/hashes"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@noble/hashes/-/hashes-1.4.0.tgz")
                 (sha256 (base32 "0fgckf0dqr21wpj70fj8cljx5ndngj4kbw6iksqygjcmj2nscpy5"))))
   (cons "node_modules/playwright"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/playwright/-/playwright-1.55.1.tgz")
                 (sha256 (base32 "06j5il95pqvdzxiz9iz5dfl4j36ffs97v5j3kx3kvik898b01j6b"))))
   (cons "node_modules/playwright-core"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/playwright-core/-/playwright-core-1.55.1.tgz")
                 (sha256 (base32 "1jc5y3y3k03n0wc1q2nr9ffyrnn62lsn2hxnixp89zzdl8x3wb67"))))
   (cons "node_modules/playwright/node_modules/fsevents"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fsevents/-/fsevents-2.3.2.tgz")
                 (sha256 (base32 "0a2l5kh9szlyhz1yf01dg346cqf2kbi5z4f7vydf0gqr1jaxwyp1"))))
   (cons "node_modules/plist"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/plist/-/plist-3.1.0.tgz")
                 (sha256 (base32 "196zs6wqjpmg1dcw7a93wgqs5dl8ay0i78bggxhlpc539927v5za"))))
   (cons "node_modules/pofile"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/pofile/-/pofile-1.0.11.tgz")
                 (sha256 (base32 "1bmyqzm059bd09nckjry6sz3c89scc8mzana9n1zzr327bql5vr0"))))
   (cons "node_modules/possible-typed-array-names"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/possible-typed-array-names/-/possible-typed-array-names-1.0.0.tgz")
                 (sha256 (base32 "0ibrspm4c2mrn9zfqg8dmrxylq1j1vhwldfc1l826i3fx399ky9n"))))
   (cons "node_modules/postcss"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/postcss/-/postcss-8.5.23.tgz")
                 (sha256 (base32 "1wa40x661adr6xbnczwmdsdyw5gy5fzhk4y7w4s8rbqby57k5kyj"))))
   (cons "node_modules/postcss-value-parser"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/postcss-value-parser/-/postcss-value-parser-4.2.0.tgz")
                 (sha256 (base32 "19whda1if07mb56pyqw7y750xclqnaqld82qn92a6rjvz4n3gr9x"))))
   (cons "node_modules/postject"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/postject/-/postject-1.0.0-alpha.6.tgz")
                 (sha256 (base32 "14kxgr9zvkp4rkazciya1rv75yps1a3hqddkgypxsjbxx19pni6i"))))
   (cons "node_modules/postject/node_modules/commander"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/commander/-/commander-9.5.0.tgz")
                 (sha256 (base32 "0lig2h2wyydirfngs273jzj816nbiqxvd95109hc4f6vd2zlhjdn"))))
   (cons "node_modules/prelude-ls"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/prelude-ls/-/prelude-ls-1.2.1.tgz")
                 (sha256 (base32 "14fjp2mzgn4a705pkwggdy3dib854q0rvlmylpyjz18zgwwzrs0l"))))
   (cons "node_modules/prettier"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/prettier/-/prettier-3.3.3.tgz")
                 (sha256 (base32 "0ilzcf1j5zl77w6rs6ch067vs7p7759d9ls09l6qwn3snl5cn7ig"))))
   (cons "node_modules/prettier-linter-helpers"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/prettier-linter-helpers/-/prettier-linter-helpers-1.0.0.tgz")
                 (sha256 (base32 "0v5pxf86l4p67i7nq7yn2y5qpvq8qzv8jarhmpwpzx0v6ldkb8pm"))))
   (cons "node_modules/proc-log"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/proc-log/-/proc-log-6.1.0.tgz")
                 (sha256 (base32 "1iar7wz9xvqn30pjx9s9z6g6zy2p6lf23p94jy9mjifplvvkglq2"))))
   (cons "node_modules/process"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/process/-/process-0.11.10.tgz")
                 (sha256 (base32 "1fz6fjkaldphhj1vphhk00d35k2gkw7x8c6n58amdc4w7jdmc43w"))))
   (cons "node_modules/process-nextick-args"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/process-nextick-args/-/process-nextick-args-2.0.0.tgz")
                 (sha256 (base32 "0klwkva2pp5wkf97v7ffwi2dg3fgl52mcvc1pkll757jg8djgv4f"))))
   (cons "node_modules/progress"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/progress/-/progress-2.0.3.tgz")
                 (sha256 (base32 "191ax3hag867ggjsn6wh1b00bp5iippxsml7fyxf7h7nizhna63h"))))
   (cons "node_modules/promise-retry"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/promise-retry/-/promise-retry-2.0.1.tgz")
                 (sha256 (base32 "1k2mdc2jbw2h3ykxcgvh2wv20gdb6m1siacllr7dy2x4rlk3g5jq"))))
   (cons "node_modules/prop-types"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/prop-types/-/prop-types-15.8.1.tgz")
                 (sha256 (base32 "0mx539ks64wvzzll94jjldpmqj755hpx17afd8l2qilabnq9wwqw"))))
   (cons "node_modules/proper-lockfile"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/proper-lockfile/-/proper-lockfile-4.1.2.tgz")
                 (sha256 (base32 "0s49g8x645nacdxwmyy0w4rgl08ba5lv73wjpgnwpbkwlm5r2y7x"))))
   (cons "node_modules/protobufjs"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/protobufjs/-/protobufjs-7.6.5.tgz")
                 (sha256 (base32 "0vzqgzx4m74ghgc6zsdra7jr07g3xnfp62hqjhkfa1xb6v8hhsyn"))))
   (cons "node_modules/pump"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/pump/-/pump-3.0.0.tgz")
                 (sha256 (base32 "1vq58w7663jdwlsks9qbzga0bsca11il5x04w9q2q0qlllb14k41"))))
   (cons "node_modules/punycode"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/punycode/-/punycode-2.1.1.tgz")
                 (sha256 (base32 "0g7z0kdxs15jrcijwbka2jajgr4b7bvpa6xmrcs0wf82pxwx1k75"))))
   (cons "node_modules/pvtsutils"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/pvtsutils/-/pvtsutils-1.3.6.tgz")
                 (sha256 (base32 "0kc39klf2m0kl86497dbh2kr7a2ikc6hx86lhshn9y6javph6kfw"))))
   (cons "node_modules/pvutils"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/pvutils/-/pvutils-1.2.0.tgz")
                 (sha256 (base32 "1z2ydg16b7ka2misn3r2x0w31diga6d2qi5fjsv04fra9mb3lyzz"))))
   (cons "node_modules/queue-microtask"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/queue-microtask/-/queue-microtask-1.2.3.tgz")
                 (sha256 (base32 "1kcyybqa9jqb339mr9i9fxa7b6pn7fl5fzm278a5x1h1l8h0mbzz"))))
   (cons "node_modules/quick-lru"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/quick-lru/-/quick-lru-5.1.1.tgz")
                 (sha256 (base32 "1prmggnyx8kw2f4fxbqpaj9hnlpkxaydmkgrvi7qv8h9la25i0xr"))))
   (cons "node_modules/react"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/react/-/react-18.3.1.tgz")
                 (sha256 (base32 "0iq3hz3mmzgrc1h3181hk8446skwshd7hbclhzrymrvjlq0yv6wd"))))
   (cons "node_modules/react-dom"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/react-dom/-/react-dom-18.3.1.tgz")
                 (sha256 (base32 "1q20n02nai7cznb4h3yi8x7px9llhlqbzfqqmin3ybwzm4kl8783"))))
   (cons "node_modules/react-is"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/react-is/-/react-is-16.13.1.tgz")
                 (sha256 (base32 "13zfzbq3z5cmh7fzvbzwm2ivcqg2crv97ww7162kxhfxfgabbnqb"))))
   (cons "node_modules/react-redux"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/react-redux/-/react-redux-9.2.0.tgz")
                 (sha256 (base32 "0r6v47hbd8fpzbz77f1crxnm6wn94dghvka14mp9rav2s5hq9g52"))))
   (cons "node_modules/react-refresh"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/react-refresh/-/react-refresh-0.18.0.tgz")
                 (sha256 (base32 "01z2cfws1miaqm9ayw957r8g9fkrz010xf2w840q3hr0id67f9gi"))))
   (cons "node_modules/react-router"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/react-router/-/react-router-5.3.4.tgz")
                 (sha256 (base32 "09q4mlsqafpch3nq0ls5yikjj8gqdg2gb8agzndkl7sxjfgfkmci"))))
   (cons "node_modules/react-router/node_modules/history"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/history/-/history-4.10.1.tgz")
                 (sha256 (base32 "043sy1j2vr0ih1a3pp0cvb954cljrhbmfikidjbbair5bzjzhz98"))))
   (cons "node_modules/react-router/node_modules/resolve-pathname"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/resolve-pathname/-/resolve-pathname-3.0.0.tgz")
                 (sha256 (base32 "1w6xrizqq39vcd0mqhfrin0rcwsw63sxhbbrvm1w09xk55r3kn7i"))))
   (cons "node_modules/react-router/node_modules/value-equal"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/value-equal/-/value-equal-1.0.1.tgz")
                 (sha256 (base32 "12z8rc5grl95jbddil510v3hzdl52507mgnljy9fd6w4qq0j1ypx"))))
   (cons "node_modules/read-binary-file-arch"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/read-binary-file-arch/-/read-binary-file-arch-1.0.6.tgz")
                 (sha256 (base32 "1dz61k816gkpsqv4316jxdn08h0r6k68vjk5qshxq35z3vxxa02g"))))
   (cons "node_modules/read-binary-file-arch/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.4.3.tgz")
                 (sha256 (base32 "19z48fpic8jbb2833gh3bviylzp9512i2dsqhxd91s3fjjfarhc9"))))
   (cons "node_modules/read-binary-file-arch/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz")
                 (sha256 (base32 "1ii24v83yrryzmj9p369qxmpr53337kkqbdaklpmbv9hwlanwqgn"))))
   (cons "node_modules/readable-stream"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/readable-stream/-/readable-stream-2.3.8.tgz")
                 (sha256 (base32 "0cm5g4a5mfqb5im98mzv5y3dpv377bws6wlgpv5wk2pn90wn2j0n"))))
   (cons "node_modules/readable-stream/node_modules/isarray"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/isarray/-/isarray-1.0.0.tgz")
                 (sha256 (base32 "11qcjpdzigcwcprhv7nyarlzjcwf3sv5i66q75zf08jj9zqpcg72"))))
   (cons "node_modules/redux"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/redux/-/redux-5.0.1.tgz")
                 (sha256 (base32 "12rrji6w7kqsbfr1v50ncn92rwlgidgf8s5mzsikirkplgwd9b5d"))))
   (cons "node_modules/reflect.getprototypeof"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/reflect.getprototypeof/-/reflect.getprototypeof-1.0.6.tgz")
                 (sha256 (base32 "13072zpvx6jhx151ldxzprwvlmf1kh02z31wz27mdlr3vy8caqqh"))))
   (cons "node_modules/regenerator-runtime"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/regenerator-runtime/-/regenerator-runtime-0.14.1.tgz")
                 (sha256 (base32 "083w9685pagk4qgw5004ddw19sm39carp7cdnf66dv85na7z73by"))))
   (cons "node_modules/regexp.prototype.flags"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/regexp.prototype.flags/-/regexp.prototype.flags-1.5.2.tgz")
                 (sha256 (base32 "1dg6gxci3d5ip3fgfpq8fpzzv11g6jfr0kqpda56b7j0nbdqrc1b"))))
   (cons "node_modules/require-directory"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/require-directory/-/require-directory-2.1.1.tgz")
                 (sha256 (base32 "1j46ydacaai73mx5krskl0k78r32lnjx94l79bz860rn8h4fwfvh"))))
   (cons "node_modules/require-from-string"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/require-from-string/-/require-from-string-2.0.2.tgz")
                 (sha256 (base32 "10ldp2bzb86czf47kmvirn9x2976yh6g0my7l1spg3whcm4llsfb"))))
   (cons "node_modules/resedit"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/resedit/-/resedit-1.7.2.tgz")
                 (sha256 (base32 "1kdidj5wpbh8d164y2ckmjaggidsvpnz4la62q9vhjfhn722nn6v"))))
   (cons "node_modules/resolve-alpn"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/resolve-alpn/-/resolve-alpn-1.2.1.tgz")
                 (sha256 (base32 "0853fjjwl8as4px6mh6fcs59mnk4l5f4g7yl7pig0m9s72w4z5zx"))))
   (cons "node_modules/resolve-from"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/resolve-from/-/resolve-from-4.0.0.tgz")
                 (sha256 (base32 "1p11030pz8qdm9x2d9q0qi2p329447i2bb7a5j7hbsxxqbs2hhi4"))))
   (cons "node_modules/responselike"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/responselike/-/responselike-2.0.1.tgz")
                 (sha256 (base32 "1xaszdarkass77bwzijlnrqfsh05rkvgf2b6909hcf0pn31s8bvy"))))
   (cons "node_modules/retry"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/retry/-/retry-0.12.0.tgz")
                 (sha256 (base32 "0a5l61f1aqn124j25m2q6m0j60mv7d9h74a8gfqnmp5ajz8wcqfz"))))
   (cons "node_modules/reusify"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/reusify/-/reusify-1.0.4.tgz")
                 (sha256 (base32 "1i1kl423618nfp3rjalyl810v7sxz2x04smrmfpafbzs2zahql5a"))))
   (cons "node_modules/rimraf"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/rimraf/-/rimraf-3.0.2.tgz")
                 (sha256 (base32 "0lkzjyxjij6ssh5h2l3ncp0zx00ylzhww766dq2vf1s7v07w4xjq"))))
   (cons "node_modules/roarr"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/roarr/-/roarr-2.15.4.tgz")
                 (sha256 (base32 "1n4lyd5s9j07aj00hy2kpgkilk1f8mrqqhmrawqnx6j4aszyymia"))))
   (cons "node_modules/rollup"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/rollup/-/rollup-4.59.0.tgz")
                 (sha256 (base32 "0mjdv5wqw92rbv4xv9lv8nrywvzv8rvz1hvhc2d04dxaaxg4p7r1"))))
   (cons "node_modules/run-parallel"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/run-parallel/-/run-parallel-1.2.0.tgz")
                 (sha256 (base32 "1j3syw7nnhr98sr9jngzmgqj33khjnl5rimhgbpih2vy6zsk38kb"))))
   (cons "node_modules/safe-array-concat"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/safe-array-concat/-/safe-array-concat-1.1.2.tgz")
                 (sha256 (base32 "07187ph44bg1p1ba19r5b9lj9k28fhisj0xpf3hs2f2wwzwvp4i9"))))
   (cons "node_modules/safe-array-concat/node_modules/isarray"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/isarray/-/isarray-2.0.5.tgz")
                 (sha256 (base32 "14zpnpwcjxi86qgjv9lxbcaqv6zffqn0204c2554nq0sp1iy9fkj"))))
   (cons "node_modules/safe-buffer"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.1.2.tgz")
                 (sha256 (base32 "08ma0a2a9j537bxl7qd2dn6sjcdhrclpdbslr19bkbyc1z30d4p0"))))
   (cons "node_modules/safe-regex-test"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/safe-regex-test/-/safe-regex-test-1.0.3.tgz")
                 (sha256 (base32 "0m1j657ww9srdzl3602f6dqc9px41667df6xq0rnz4dqdhb94xsi"))))
   (cons "node_modules/safer-buffer"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/safer-buffer/-/safer-buffer-2.1.2.tgz")
                 (sha256 (base32 "1cx383s7vchfac8jlg3mnb820hkgcvhcpfn9w4f0g61vmrjjz0bq"))))
   (cons "node_modules/sanitize-filename"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/sanitize-filename/-/sanitize-filename-1.6.4.tgz")
                 (sha256 (base32 "1spkmc7s99fixfsn3dzix9m07a6wd0zbsmz463qalhv2b8h6x4s2"))))
   (cons "node_modules/sax"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/sax/-/sax-1.6.1.tgz")
                 (sha256 (base32 "1gc5pqsvpmh0lx4zg1gp0hsmh3hs4whn92xvjh4bh2468w1vz6kf"))))
   (cons "node_modules/scheduler"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/scheduler/-/scheduler-0.23.2.tgz")
                 (sha256 (base32 "1bi6dzp0zb1w0plxa6vzpynjc4wwmz8hlay9cvpr7ax9cgzdiwg4"))))
   (cons "node_modules/semver"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/semver/-/semver-7.7.3.tgz")
                 (sha256 (base32 "1g92hn6179rh5qf0kryl401mfx6chlk27z6a2jhcj10ydl4755dl"))))
   (cons "node_modules/semver-compare"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/semver-compare/-/semver-compare-1.0.0.tgz")
                 (sha256 (base32 "101wry6pwhbl7h3icx4vic5x87hhsgim55z01ylq3nm736bnkwg7"))))
   (cons "node_modules/serialize-error"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/serialize-error/-/serialize-error-7.0.1.tgz")
                 (sha256 (base32 "0q657dq63b2839q2m4bn5bvvjdfn8djrf48n0f7r9av051h1s796"))))
   (cons "node_modules/set-function-length"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/set-function-length/-/set-function-length-1.2.2.tgz")
                 (sha256 (base32 "0jibjpyi630gp59w40fjhnarmmhjaa8n8x0kw8zpll53vxqdyfd3"))))
   (cons "node_modules/set-function-name"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/set-function-name/-/set-function-name-2.0.2.tgz")
                 (sha256 (base32 "1wry0dvq3b7x3zfj5369w9cahjngagw6v975xrp2wlz0jxxffh4j"))))
   (cons "node_modules/setimmediate"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/setimmediate/-/setimmediate-1.0.5.tgz")
                 (sha256 (base32 "17icj9sgsg9fcyclds1a8mlgmspza3fa6sidq11fsr43d4igrfaw"))))
   (cons "node_modules/shallowequal"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/shallowequal/-/shallowequal-1.1.0.tgz")
                 (sha256 (base32 "0j9zd88x347nhssa2p7409wiv5xj2j1igl923wb40z3z61mf0dka"))))
   (cons "node_modules/shebang-command"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/shebang-command/-/shebang-command-2.0.0.tgz")
                 (sha256 (base32 "0vjmdpwcz23glkhlmxny8hc3x01zyr6hwf4qb3grq7m532ysbjws"))))
   (cons "node_modules/shebang-regex"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/shebang-regex/-/shebang-regex-3.0.0.tgz")
                 (sha256 (base32 "13wmb23w5srjpn9xx1c85yk5jbc5z9ypg0iz33h6nv5jdnmapnzy"))))
   (cons "node_modules/side-channel"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/side-channel/-/side-channel-1.0.6.tgz")
                 (sha256 (base32 "1ynm0l0fwp8gh2x487r7nnidac1d6i7vjs7gp8wf1aw6x5xh40ri"))))
   (cons "node_modules/siginfo"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/siginfo/-/siginfo-2.0.0.tgz")
                 (sha256 (base32 "06vhqyr028bznlnfi0f4inr0526mk10ns5ya9ab4jh2iqi9xh3x2"))))
   (cons "node_modules/signal-exit"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/signal-exit/-/signal-exit-3.0.7.tgz")
                 (sha256 (base32 "1a10ixkiak24yy6s7p9m7c6v9jkz2fm7wxgc2l3614dbdbx275j3"))))
   (cons "node_modules/simple-plist"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/simple-plist/-/simple-plist-1.3.1.tgz")
                 (sha256 (base32 "0hfmw50nn87b60cw7gkal3k9yw90shqb511gnkr6f50drha6wlsg"))))
   (cons "node_modules/simple-update-notifier"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/simple-update-notifier/-/simple-update-notifier-2.0.0.tgz")
                 (sha256 (base32 "1wig8ccrk6swz38hnliqxqsivgc9axwby98gq30lzgyd0m97pkpf"))))
   (cons "node_modules/source-map"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz")
                 (sha256 (base32 "11ib173i7xf5sd85da9jfrcbzygr48pppz5csl15hnpz2w6s3g5x"))))
   (cons "node_modules/source-map-js"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/source-map-js/-/source-map-js-1.2.1.tgz")
                 (sha256 (base32 "0ls8kncpxm2wxd4da6b1jrx1hyajjlx8rjyq34ra91x4zkwsc9pi"))))
   (cons "node_modules/source-map-support"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/source-map-support/-/source-map-support-0.5.21.tgz")
                 (sha256 (base32 "0dpnahsipxckan03b5w5qrmlibkz8amh7k6gj77zs9387vph96sx"))))
   (cons "node_modules/sprintf-js"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/sprintf-js/-/sprintf-js-1.1.3.tgz")
                 (sha256 (base32 "1dmfvr48ls8m3yjlhrn4f55jsjnv36p3ikzmamq9hbnxij93g1cs"))))
   (cons "node_modules/stackback"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/stackback/-/stackback-0.0.2.tgz")
                 (sha256 (base32 "0n2qll6342m6219skx7cjmc6rpd747n4idj6sj779yfcs613qriy"))))
   (cons "node_modules/stat-mode"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/stat-mode/-/stat-mode-1.0.0.tgz")
                 (sha256 (base32 "1hqpcydwfvxc5b26jpnx2fc9bxzxxjk8rjbfnycmd0bv2gmw9z44"))))
   (cons "node_modules/stream-buffers"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/stream-buffers/-/stream-buffers-2.2.0.tgz")
                 (sha256 (base32 "0jdmybjdxjcj8wpwy6yl5mv7dsyh8x8vmw1na3swg3fnn78cpyi1"))))
   (cons "node_modules/string_decoder"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/string_decoder/-/string_decoder-1.1.1.tgz")
                 (sha256 (base32 "0fln2r91b8gj845j7jl76fvsp7nij13fyzvz82985yh88m1n50mg"))))
   (cons "node_modules/string.prototype.matchall"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/string.prototype.matchall/-/string.prototype.matchall-4.0.11.tgz")
                 (sha256 (base32 "1ja5924hygcd2wk2bj0drsx6fxb6xmgnkl3cyrp2nhbjr1c95vdp"))))
   (cons "node_modules/string.prototype.repeat"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/string.prototype.repeat/-/string.prototype.repeat-1.0.0.tgz")
                 (sha256 (base32 "02xh16gxr6qa84hbxga4nxxffbhy5y4n1044mw0gn009nkvj55vw"))))
   (cons "node_modules/string.prototype.trim"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/string.prototype.trim/-/string.prototype.trim-1.2.9.tgz")
                 (sha256 (base32 "0mmdbl0sfw6w15g96ksy97g1xg0ja89bpw2lw7i7h7xrkl42nfsx"))))
   (cons "node_modules/string.prototype.trimend"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/string.prototype.trimend/-/string.prototype.trimend-1.0.8.tgz")
                 (sha256 (base32 "0kpn8m66l10v430i8j4rfbpdavfxk91ahwlcfr2q97srimq2inl3"))))
   (cons "node_modules/string.prototype.trimstart"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/string.prototype.trimstart/-/string.prototype.trimstart-1.0.8.tgz")
                 (sha256 (base32 "03pvh9mxgy4jgskx7hvdvviy31x2m1p5214rqzhmw5zhxd9cpjdw"))))
   (cons "node_modules/strip-json-comments"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/strip-json-comments/-/strip-json-comments-3.1.1.tgz")
                 (sha256 (base32 "1vffnq04fk4spnmvrzq3wg41f88lcb9s1z0gqvshqiqw3imzw4q2"))))
   (cons "node_modules/styled-components"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/styled-components/-/styled-components-6.1.19.tgz")
                 (sha256 (base32 "13qimb5srp8wh7yij9nhpiz8v08xazfp4a98vmb4vkcvmpa74p49"))))
   (cons "node_modules/styled-components/node_modules/tslib"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/tslib/-/tslib-2.6.2.tgz")
                 (sha256 (base32 "1qnrm0dsrkmva0490nml242jg09750pqakq4lni7jas7y6nfc0b0"))))
   (cons "node_modules/stylis"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/stylis/-/stylis-4.3.2.tgz")
                 (sha256 (base32 "0siqfnsni2dqc5r32cy69wxwsvcjzn9n4xh8rs6jh8739riyr9hi"))))
   (cons "node_modules/sumchecker"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/sumchecker/-/sumchecker-3.0.1.tgz")
                 (sha256 (base32 "026xzxspqlk8zia7x0qalpmz9mxg5w3wvcq3m0rik9rkbc0g6mk7"))))
   (cons "node_modules/sumchecker/node_modules/debug"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/debug/-/debug-4.3.4.tgz")
                 (sha256 (base32 "1kwbyb5m63bz8a2bvhy4gsnsma6ks5wa4w5qya6qb9ip5sdjr4h4"))))
   (cons "node_modules/sumchecker/node_modules/ms"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ms/-/ms-2.1.2.tgz")
                 (sha256 (base32 "0j7vrqxzg2fxip3q0cws360wk3cz2nprr8zkragipziz1piscmqi"))))
   (cons "node_modules/supports-preserve-symlinks-flag"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/supports-preserve-symlinks-flag/-/supports-preserve-symlinks-flag-1.0.0.tgz")
                 (sha256 (base32 "1ygp0kk7p6df5p6p2q1csdshilklhfbh49g7h90m6i2kmxh13nlp"))))
   (cons "node_modules/synckit"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/synckit/-/synckit-0.9.1.tgz")
                 (sha256 (base32 "0svrq453aj4nkff1j2v8wgc48pj1sd0db4r35p3m7aiyjp04zrfs"))))
   (cons "node_modules/tar"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/tar/-/tar-7.5.22.tgz")
                 (sha256 (base32 "1in6g5c71srjg0ga18sgvqwfw0pfkv1gz89ca880jxzwqz8w54mp"))))
   (cons "node_modules/tar/node_modules/yallist"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/yallist/-/yallist-5.0.0.tgz")
                 (sha256 (base32 "15ffxgcsvvq8yp4rxcqnacl84i012jpsbrmh6cqkpavwmgdl77bw"))))
   (cons "node_modules/temp"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/temp/-/temp-0.9.4.tgz")
                 (sha256 (base32 "08pwh41s9kax4hjcmdb7j06hbas48h2k8j8y9qkgigrvnwg9rm6z"))))
   (cons "node_modules/temp-file"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/temp-file/-/temp-file-3.4.0.tgz")
                 (sha256 (base32 "1pc096ghsr4f2p3cpys6rb33mx7pv6h0xgxapfb8zmlpp53aihw4"))))
   (cons "node_modules/temp/node_modules/rimraf"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/rimraf/-/rimraf-2.6.3.tgz")
                 (sha256 (base32 "0zkzyrndihic25mizl3hhqw3y2ah36hq5kr4rqcwy56jpp56zdcc"))))
   (cons "node_modules/tiny-async-pool"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/tiny-async-pool/-/tiny-async-pool-1.3.0.tgz")
                 (sha256 (base32 "02vb3nwfl17gg6nfh1qcmarb0irc1qf6pljiqc2mrsqkipcf2amk"))))
   (cons "node_modules/tiny-async-pool/node_modules/semver"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/semver/-/semver-5.7.2.tgz")
                 (sha256 (base32 "1yamwq6fygzmjv84rl0zwadr91xchml9dplv6k7xv628pi6kfj75"))))
   (cons "node_modules/tiny-invariant"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/tiny-invariant/-/tiny-invariant-1.1.0.tgz")
                 (sha256 (base32 "14bv44p581zv41213wh6pcbarwri64v40ks8w77nhwdip5ccs1m6"))))
   (cons "node_modules/tiny-warning"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/tiny-warning/-/tiny-warning-1.0.3.tgz")
                 (sha256 (base32 "1ck9zdjxdda20xdfn75mj97vc0h7lmcqrq9i0h00z8wcgdir7wai"))))
   (cons "node_modules/tinybench"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/tinybench/-/tinybench-2.9.0.tgz")
                 (sha256 (base32 "0f9fb0840qfhz6kbwpv12an1ia6qwbx7w7ml1xkmjqrnq99yjf1s"))))
   (cons "node_modules/tinyexec"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/tinyexec/-/tinyexec-1.0.2.tgz")
                 (sha256 (base32 "126vcdg1rcjwqq2p6m7cr08bhvk314w6iq7wgifhqc0s4iprxf09"))))
   (cons "node_modules/tinyglobby"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/tinyglobby/-/tinyglobby-0.2.15.tgz")
                 (sha256 (base32 "1p993j64mlwzk3c9c5vx2v4ja5x4yl4cszqhabczng9pzppzb4dr"))))
   (cons "node_modules/tinyglobby/node_modules/fdir"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fdir/-/fdir-6.5.0.tgz")
                 (sha256 (base32 "0pin1ngw51v3z7q8gs4q84bwwcw3pdyh29jk8351yahyygcxq794"))))
   (cons "node_modules/tinyglobby/node_modules/picomatch"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/picomatch/-/picomatch-4.0.4.tgz")
                 (sha256 (base32 "072pg3ji6ib0ns6jv3ypink59pmfj8432fj82yhxk3jmcsv5lnsi"))))
   (cons "node_modules/tmp"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/tmp/-/tmp-0.2.7.tgz")
                 (sha256 (base32 "0zznwh2r93csbarz2yjrjbwvi62b8bjnsw5rxd26f1g5i9c104p5"))))
   (cons "node_modules/tmp-promise"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/tmp-promise/-/tmp-promise-3.0.3.tgz")
                 (sha256 (base32 "1nf9pds0x20r9w4gkgx46j5axigbwn06nbrvi56s8i0y2hjlr24x"))))
   (cons "node_modules/truncate-utf8-bytes"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/truncate-utf8-bytes/-/truncate-utf8-bytes-1.0.2.tgz")
                 (sha256 (base32 "0r7bmf7faszkqd3calb35g92yf4113cxgs95ccxwdrjhd8rfcyii"))))
   (cons "node_modules/ts-api-utils"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ts-api-utils/-/ts-api-utils-1.4.0.tgz")
                 (sha256 (base32 "1jffh018q99j0kbi04jy3y2zc50c8ichmqlcgx10lzj0q3mbjbz4"))))
   (cons "node_modules/tslib"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/tslib/-/tslib-2.8.1.tgz")
                 (sha256 (base32 "17hiw9pawyczkhsnhlq4k9dn3kq2l49nk5rlfn049bmbxvakbxk6"))))
   (cons "node_modules/type-check"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/type-check/-/type-check-0.4.0.tgz")
                 (sha256 (base32 "13iza44xzxi2sfdz411wdfprl9wmlzgvlv60i8sr49lfqh6d2dc0"))))
   (cons "node_modules/type-fest"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/type-fest/-/type-fest-0.13.1.tgz")
                 (sha256 (base32 "0xqlxm099arzx10i80vfygz6j6df1zqik6lnf8k1wc990aw6b77x"))))
   (cons "node_modules/typed-array-buffer"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/typed-array-buffer/-/typed-array-buffer-1.0.2.tgz")
                 (sha256 (base32 "1djab5d9x0ffm4cihd0sshwsbyaybw4wjzkwhklnla73ibn57zkf"))))
   (cons "node_modules/typed-array-byte-length"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/typed-array-byte-length/-/typed-array-byte-length-1.0.1.tgz")
                 (sha256 (base32 "0hvzzs12dhrn2y94hwq4w413zs7sj9334gmnbdidn75a13r6mf2a"))))
   (cons "node_modules/typed-array-byte-offset"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/typed-array-byte-offset/-/typed-array-byte-offset-1.0.2.tgz")
                 (sha256 (base32 "1lwp261afcacbmy04dfz44zaglvqqqypyzkqhbl02rvw1kw1qpl8"))))
   (cons "node_modules/typed-array-length"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/typed-array-length/-/typed-array-length-1.0.6.tgz")
                 (sha256 (base32 "1ggnzlzz1xxgynbyyr1g26h30hbwf7fyh3cvxydvljrh0vf2x3w1"))))
   (cons "node_modules/typescript"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/typescript/-/typescript-5.9.3.tgz")
                 (sha256 (base32 "1lx1hwb5g73x06pylqzgrkran1dlbx8iizrx0mwjhpvxrz4hiq8h"))))
   (cons "node_modules/typescript-eslint"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/typescript-eslint/-/typescript-eslint-8.15.0.tgz")
                 (sha256 (base32 "0ifq9sa7h1kn0pi6ssjgqh7zgraf7jzm3ik037dy88ha4rp6wnrd"))))
   (cons "node_modules/uglify-js"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/uglify-js/-/uglify-js-3.13.6.tgz")
                 (sha256 (base32 "1ya9sq54i1xlb7cc6v02dqjhds30bk0pqx91nd1k245y0gkqbwdz"))))
   (cons "node_modules/unbox-primitive"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/unbox-primitive/-/unbox-primitive-1.0.2.tgz")
                 (sha256 (base32 "07fa9yq0z8512a7ig1p8w5gb81j638pxcgl29884knqsnmqb2gkk"))))
   (cons "node_modules/undici"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/undici/-/undici-7.28.0.tgz")
                 (sha256 (base32 "0pvx33jrvxgx7zyq9c5zxipxs40wmz291mla31r836s7dhyzhf9b"))))
   (cons "node_modules/undici-types"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/undici-types/-/undici-types-7.18.2.tgz")
                 (sha256 (base32 "15sl89zgd53738z3bzx46hqp2zm2q4rz1vvh1yini5311sdpk4jd"))))
   (cons "node_modules/universalify"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/universalify/-/universalify-2.0.1.tgz")
                 (sha256 (base32 "0rbqgcdmmz5kqjryyyjyjppa6d1kcxkmwj551cps2dhqnqxk21vx"))))
   (cons "node_modules/unzip-crx-3"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/unzip-crx-3/-/unzip-crx-3-0.2.0.tgz")
                 (sha256 (base32 "0b2c22v54397yapyqm6r7qc66b9qhjzx0xl6jvyk52v0hnyjjzjg"))))
   (cons "node_modules/unzipper"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/unzipper/-/unzipper-0.12.5.tgz")
                 (sha256 (base32 "11aaxjzzqhwnq4fsf22k64kv5k7jj5vxma7d22dw6nlw8xfh745a"))))
   (cons "node_modules/unzipper/node_modules/fs-extra"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fs-extra/-/fs-extra-11.3.1.tgz")
                 (sha256 (base32 "1xgw4mv65raljjy2lcr92sla8lc00vp9v8rmdd773wn54k65czh9"))))
   (cons "node_modules/update-browserslist-db"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/update-browserslist-db/-/update-browserslist-db-1.2.3.tgz")
                 (sha256 (base32 "1hs4d1y9z7wa44z7kppyid1rzg2ysi54wfs6s3slssimsh0dmbvb"))))
   (cons "node_modules/uri-js"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/uri-js/-/uri-js-4.2.2.tgz")
                 (sha256 (base32 "1bppdmqj9ajmsr8vsas1ipnjvigsf11l5nzg5k49vaz0vc7klbps"))))
   (cons "node_modules/use-sync-external-store"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/use-sync-external-store/-/use-sync-external-store-1.5.0.tgz")
                 (sha256 (base32 "0hjii7x2c1fhz24hcwykkixsf8dqzhc6hz312hvycwi5y0gbxlc8"))))
   (cons "node_modules/utf8-byte-length"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/utf8-byte-length/-/utf8-byte-length-1.0.5.tgz")
                 (sha256 (base32 "1cck9dmdsprgqafcah6vahr57jj905680ng3xazy7nvi89pggc5g"))))
   (cons "node_modules/util-deprecate"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/util-deprecate/-/util-deprecate-1.0.2.tgz")
                 (sha256 (base32 "1rd3qbgdrwkmcrf7vqx61sh7icma7jvxcmklqj032f8v7jcdx8br"))))
   (cons "node_modules/webcrypto-core"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/webcrypto-core/-/webcrypto-core-1.9.2.tgz")
                 (sha256 (base32 "00lbz94dd97zjylykaih7yvi7wm65mzsy508yp2kf2lxglxcd1hv"))))
   (cons "node_modules/which"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/which/-/which-1.3.1.tgz")
                 (sha256 (base32 "077d08k2zz1zhn5nc09m4vkiz2hjfk2lp02a3kphhianj3b26rcn"))))
   (cons "node_modules/which-boxed-primitive"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/which-boxed-primitive/-/which-boxed-primitive-1.0.2.tgz")
                 (sha256 (base32 "1788bq6cymqsv6arbp96lrk81cs3xllwarzcqc5xizh3j6x1fh2a"))))
   (cons "node_modules/which-builtin-type"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/which-builtin-type/-/which-builtin-type-1.1.3.tgz")
                 (sha256 (base32 "020crfbic5957v69lq6b96grxbbh5dg8rd1bxlwvir820yax7szp"))))
   (cons "node_modules/which-builtin-type/node_modules/isarray"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/isarray/-/isarray-2.0.5.tgz")
                 (sha256 (base32 "14zpnpwcjxi86qgjv9lxbcaqv6zffqn0204c2554nq0sp1iy9fkj"))))
   (cons "node_modules/which-collection"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/which-collection/-/which-collection-1.0.2.tgz")
                 (sha256 (base32 "0m25f9q7apslkc85knq83b1gcany98f2qmzi3fxp3kn8n0ja393r"))))
   (cons "node_modules/which-typed-array"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/which-typed-array/-/which-typed-array-1.1.15.tgz")
                 (sha256 (base32 "05193samzb34d5bvan1r0m7q7qb1w38x552rmafjdhi24hsz02xp"))))
   (cons "node_modules/why-is-node-running"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/why-is-node-running/-/why-is-node-running-2.3.0.tgz")
                 (sha256 (base32 "0qwrxh3bl4mdf9cb1y4ls57gddgmr5x621ggg409sl2kg7vnixnj"))))
   (cons "node_modules/word-wrap"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/word-wrap/-/word-wrap-1.2.5.tgz")
                 (sha256 (base32 "1v4xynx2nyawlbx0y6gpa52wqb5nns316bc2sc4slgw634xwrmyh"))))
   (cons "node_modules/wordwrap"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/wordwrap/-/wordwrap-1.0.0.tgz")
                 (sha256 (base32 "0f08g3gb6si97h2faw175isf8k7hjbnw5rr2bm4wcr1141lzd0f3"))))
   (cons "node_modules/wrappy"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz")
                 (sha256 (base32 "1yzx63jf27yz0bk0m78vy4y1cqzm113d2mi9h91y3cdpj46p7wxg"))))
   (cons "node_modules/xmlbuilder"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/xmlbuilder/-/xmlbuilder-15.1.1.tgz")
                 (sha256 (base32 "17p1k7a172zsf9lj691mxvkj1xnr9ljmvfjjfhq3c6zr882hbi75"))))
   (cons "node_modules/xvfb-maybe"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/xvfb-maybe/-/xvfb-maybe-0.2.1.tgz")
                 (sha256 (base32 "03m4fvlw85h2m6wqsrjvahz8g0f88fyfvnirizpwr3imrpm3ny8p"))))
   (cons "node_modules/yaku"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/yaku/-/yaku-0.16.7.tgz")
                 (sha256 (base32 "0nrz9vkm67849mwhi1zq1i9nmvrwsk33cq9y7ha6ynrx7cmbj45q"))))
   (cons "node_modules/yallist"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz")
                 (sha256 (base32 "0jadz9mh1lzfk19bvqqlrg40ggfk2yyfyrpgj5c62dk54ym7h358"))))
   (cons "node_modules/yargs"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/yargs/-/yargs-17.7.2.tgz")
                 (sha256 (base32 "1jdfhg5pvp8834zsbm0vibjxx9rpwargqw1619i61mxm21gr7v28"))))
   (cons "node_modules/yargs/node_modules/ansi-regex"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.1.tgz")
                 (sha256 (base32 "1ng0r2k4mcz7b2bfr6g1dschnxm0vifaslsvv2smv06smb6ss3hf"))))
   (cons "node_modules/yargs/node_modules/cliui"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/cliui/-/cliui-8.0.1.tgz")
                 (sha256 (base32 "13cc8rvmzcvvlvf2prwxj1zjyxhybsznl1nirnlrwd4abvid3yny"))))
   (cons "node_modules/yargs/node_modules/get-caller-file"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/get-caller-file/-/get-caller-file-2.0.5.tgz")
                 (sha256 (base32 "0pwk4r8iyyq2j0xpxavdm3ldb4h4k4s4xb74m8dlrzs9374f24vv"))))
   (cons "node_modules/yargs/node_modules/string-width"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/string-width/-/string-width-4.2.3.tgz")
                 (sha256 (base32 "0d19spdisrqxd6311fc7z1yg34ww6rwh1zxdk6pnk03fnaqlzfxd"))))
   (cons "node_modules/yargs/node_modules/strip-ansi"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.1.tgz")
                 (sha256 (base32 "1jh81jj6cn1lli1c7m6xi0ynra9zdghb1g63v1nib7zlpz87bnwv"))))
   (cons "node_modules/yargs/node_modules/wrap-ansi"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-7.0.0.tgz")
                 (sha256 (base32 "0bx4bkwfli34343rl97qy5pdg3zmskinsf8mlkv3isfj1d8v7587"))))
   (cons "node_modules/yargs/node_modules/y18n"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/y18n/-/y18n-5.0.8.tgz")
                 (sha256 (base32 "0sd7mpg2c0fxqq4q2574hvm26fgy6byp1gxnsgskmjx7sfx46dyl"))))
   (cons "node_modules/yargs/node_modules/yargs-parser"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/yargs-parser/-/yargs-parser-21.1.1.tgz")
                 (sha256 (base32 "0lcif2zbzw2jfj63paq2wdgc1hs9fd8i2xzjcidjcwjagm97sarl"))))
   (cons "node_modules/yocto-queue"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/yocto-queue/-/yocto-queue-0.1.0.tgz")
                 (sha256 (base32 "1w99c4y6vl1q5dmw9hnkbiqxnmaz72x22qdc13mg084glpnbqwn7"))))
   (cons "node_modules/zod"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/zod/-/zod-3.23.8.tgz")
                 (sha256 (base32 "06cyf3513flahlxckkkfgk2kz5lxcvjfjy7nggllwnn7awyfl726"))))
   (cons "node_modules/zod-validation-error"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/zod-validation-error/-/zod-validation-error-3.4.0.tgz")
                 (sha256 (base32 "12i44b0z0zkj8lf6afcqy4agklwv673plfxqk0z8pkydpa569cyd"))))
   (cons "packages/mullvad-vpn/node_modules/@rolldown/pluginutils"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@rolldown/pluginutils/-/pluginutils-1.0.0-rc.3.tgz")
                 (sha256 (base32 "05njq25fg7qx1pmww7mqq5rwhj9f0kk6129ifydij1q2759b3pkj"))))
   (cons "packages/mullvad-vpn/node_modules/@vitejs/plugin-react"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@vitejs/plugin-react/-/plugin-react-5.1.4.tgz")
                 (sha256 (base32 "1s1bnvl9qsnya7aqajwacp2269d5y4zydiq6frbml3w6fr7gmrsw"))))
   (cons "packages/mullvad-vpn/node_modules/@vitest/expect"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@vitest/expect/-/expect-4.1.4.tgz")
                 (sha256 (base32 "1dp3w9zldh6rzca85v8psjdf6w32011n2gxnscw09zjkjffv4ibj"))))
   (cons "packages/mullvad-vpn/node_modules/@vitest/mocker"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@vitest/mocker/-/mocker-4.1.4.tgz")
                 (sha256 (base32 "05zn0k674nrk9ck05ncvwzv6capnfg9hc36gjiyyq9xiadjg2vvx"))))
   (cons "packages/mullvad-vpn/node_modules/@vitest/pretty-format"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@vitest/pretty-format/-/pretty-format-4.1.4.tgz")
                 (sha256 (base32 "0sfc302p2qyrr6z4h1nrjx95lyb3qxri8kf1yyqs384pas8r0gdn"))))
   (cons "packages/mullvad-vpn/node_modules/@vitest/runner"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@vitest/runner/-/runner-4.1.4.tgz")
                 (sha256 (base32 "004zrc2h0xbhg2243nbvbpqv126fxzv821q8il9fsn25kx4xmfab"))))
   (cons "packages/mullvad-vpn/node_modules/@vitest/snapshot"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@vitest/snapshot/-/snapshot-4.1.4.tgz")
                 (sha256 (base32 "1fj0h2vh698ny8dv650q7ji06pn6a5qyazr1p5bzhafxvay3ndv6"))))
   (cons "packages/mullvad-vpn/node_modules/@vitest/spy"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@vitest/spy/-/spy-4.1.4.tgz")
                 (sha256 (base32 "1758panshkwnydzi733nfnj03ydlzwhbgr0hvv9xw2c30h26dvvj"))))
   (cons "packages/mullvad-vpn/node_modules/@vitest/utils"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/@vitest/utils/-/utils-4.1.4.tgz")
                 (sha256 (base32 "1ypmdf31sdjwjcpybh1rj2kg4d08v3kf2xwgf3924fyjp26lrvhm"))))
   (cons "packages/mullvad-vpn/node_modules/es-module-lexer"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/es-module-lexer/-/es-module-lexer-2.0.0.tgz")
                 (sha256 (base32 "0fml2xzqqfy37s7jk3p91p9dxa94mjr28n67nph66qxyficijgvj"))))
   (cons "packages/mullvad-vpn/node_modules/fdir"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/fdir/-/fdir-6.5.0.tgz")
                 (sha256 (base32 "0pin1ngw51v3z7q8gs4q84bwwcw3pdyh29jk8351yahyygcxq794"))))
   (cons "packages/mullvad-vpn/node_modules/picomatch"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/picomatch/-/picomatch-4.0.4.tgz")
                 (sha256 (base32 "072pg3ji6ib0ns6jv3ypink59pmfj8432fj82yhxk3jmcsv5lnsi"))))
   (cons "packages/mullvad-vpn/node_modules/react"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/react/-/react-19.1.1.tgz")
                 (sha256 (base32 "19d2xsac4hsl4cyyzl152wpdgv1if09y9ja3lh8x5lvqa3nj2k3m"))))
   (cons "packages/mullvad-vpn/node_modules/react-dom"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/react-dom/-/react-dom-19.1.1.tgz")
                 (sha256 (base32 "1n5xs25xc7va64bizmfzkq8bh2lsysrdkhz4jvpcy33z04lbsbnp"))))
   (cons "packages/mullvad-vpn/node_modules/scheduler"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/scheduler/-/scheduler-0.26.0.tgz")
                 (sha256 (base32 "0anpg716fh3x79459c3dzz6rbk4rgpvzim3n5a588nyj04s5vg0v"))))
   (cons "packages/mullvad-vpn/node_modules/std-env"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/std-env/-/std-env-4.0.0.tgz")
                 (sha256 (base32 "06rxk3asmnyaydk33l1rn4f7j092xf4p8g3a5q2rn2s3s30b92df"))))
   (cons "packages/mullvad-vpn/node_modules/tinyrainbow"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/tinyrainbow/-/tinyrainbow-3.1.0.tgz")
                 (sha256 (base32 "0hlq2h2knalxmfiapqv6c3nzpk7w7s9pmar114xfw9zwfzly8ww3"))))
   (cons "packages/mullvad-vpn/node_modules/vite"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/vite/-/vite-7.3.5.tgz")
                 (sha256 (base32 "110k0cy6k3w758dqlwd1invjswd7kb0il6brqgsy3grb36v35jfy"))))
   (cons "packages/mullvad-vpn/node_modules/vite-plugin-electron"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/vite-plugin-electron/-/vite-plugin-electron-0.29.1.tgz")
                 (sha256 (base32 "0cdliiwd3h3diicnskscq36s0f20kjzb5dp22k5kz559myy8g8pm"))))
   (cons "packages/mullvad-vpn/node_modules/vitest"
         (origin (method url-fetch) (uri "https://registry.npmjs.org/vitest/-/vitest-4.1.4.tgz")
                 (sha256 (base32 "0cnvcv8gdmlxfg8rs18vpl7wffybyndaaqla8a3qhskll3nn8c20"))))
))
