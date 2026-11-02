;;; -*- mode: scheme; -*-
;;
;;; Crate origins for mullvad-vpn 2026.5, generated from upstream Cargo.lock.
;;; Regenerate with tools/update-mullvad-crates.sh -- mostly.  Two entries are
;;; hand-added and would be lost by a regeneration: rust-jiff-0.2.22 and
;;; rust-jiff-static-0.2.22.  They are not in upstream's Cargo.lock (cargo
;;; pruned them), but a from-scratch resolution -- which is what happens here,
;;; since cargo-build-system deletes the lock -- reaches jiff through
;;; test-log -> env_logger, so the crates have to be vendored.  See the LONG
;;; comment in modules/patches/vpn.scm and the mullvad-vpn section of README.md.
;;
;;; Each entry is a proper two-element list (label origin), which is what
;;; cargo-build-system's expand-crate-sources matches on before turning it
;;; into a bag input.
(define-module (patches crates mullvad)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix build-system cargo)
  #:export (mullvad-crate-inputs))

(define rust-adler2-2.0.1
  (crate-source "adler2" "2.0.1"
                "1ymy18s9hs7ya1pjc9864l30wk8p2qfqdi7mhhcc5nfakxbij09j"))

(define rust-aead-0.5.2
  (crate-source "aead" "0.5.2"
                "1c32aviraqag7926xcb9sybdm36v5vh9gnxpn4pxdwjc50zl28ni"))

(define rust-aes-0.8.4
  (crate-source "aes" "0.8.4"
                "1853796anlwp4kqim0s6wm1srl4ib621nm0cl2h3c8klsjkgfsdi"))

(define rust-aes-gcm-0.10.3
  (crate-source "aes-gcm" "0.10.3"
                "1lgaqgg1gh9crg435509lqdhajg1m2vgma6f7fdj1qa2yyh10443"))

(define rust-aho-corasick-1.1.4
  (crate-source "aho-corasick" "1.1.4"
                "00a32wb2h07im3skkikc495jvncf62jl6s96vwc7bhi70h9imlyx"))

(define rust-android-system-properties-0.1.5
  (crate-source "android_system_properties" "0.1.5"
                "04b3wrz12837j7mdczqd95b732gw5q7q66cv4yn4646lvccp57l1"))

(define rust-anes-0.1.6
  (crate-source "anes" "0.1.6"
                "16bj1ww1xkwzbckk32j2pnbn5vk6wgsl3q4p3j9551xbcarwnijb"))

(define rust-anstream-0.6.21
  (crate-source "anstream" "0.6.21"
                "0jjgixms4qjj58dzr846h2s29p8w7ynwr9b9x6246m1pwy0v5ma3"))

(define rust-anstream-1.0.0
  (crate-source "anstream" "1.0.0"
                "13d2bj0xfg012s4rmq44zc8zgy1q8k9yp7yhvfnarscnmwpj2jl2"))

(define rust-anstyle-1.0.14
  (crate-source "anstyle" "1.0.14"
                "0030szmgj51fxkic1hpakxxgappxzwm6m154a3gfml83lq63l2wl"))

(define rust-anstyle-parse-0.2.7
  (crate-source "anstyle-parse" "0.2.7"
                "1hhmkkfr95d462b3zf6yl2vfzdqfy5726ya572wwg8ha9y148xjf"))

(define rust-anstyle-parse-1.0.0
  (crate-source "anstyle-parse" "1.0.0"
                "03hkv2690s0crssbnmfkr76kw1k7ah2i6s5amdy9yca2n8w7zkjj"))

(define rust-anstyle-query-1.1.5
  (crate-source "anstyle-query" "1.1.5"
                "1p6shfpnbghs6jsa0vnqd8bb8gd7pjd0jr7w0j8jikakzmr8zi20"))

(define rust-anstyle-wincon-3.0.11
  (crate-source "anstyle-wincon" "3.0.11"
                "0zblannm70sk3xny337mz7c6d8q8i24vhbqi42ld8v7q1wjnl7i9"))

(define rust-anyhow-1.0.103
  (crate-source "anyhow" "1.0.103"
                "1wsav2g6vxcvf2c0fv3jhxfr55l0p2g8nygy7rmmvcsfwgi8ahra"))

(define rust-arrayref-0.3.9
  (crate-source "arrayref" "0.3.9"
                "1jzyp0nvp10dmahaq9a2rnxqdd5wxgbvp8xaibps3zai8c9fi8kn"))

(define rust-arrayvec-0.7.6
  (crate-source "arrayvec" "0.7.6"
                "0l1fz4ccgv6pm609rif37sl5nv5k6lbzi7kkppgzqzh1vwix20kw"))

(define rust-askama-0.14.0
  (crate-source "askama" "0.14.0"
                "1i3m3dzshx46v94w24chl6xg7xjyf350gqzzyijy46vp9f3n6lzp"))

(define rust-askama-derive-0.14.0
  (crate-source "askama_derive" "0.14.0"
                "0kx9sfych8m7cswcs75jhq0cy9pqn7iah1w4lvl8hc781wh9g4qj"))

(define rust-askama-parser-0.14.0
  (crate-source "askama_parser" "0.14.0"
                "0n235ljbvbvlhwr54s675x1z6lgbjmzrfrq1c8rg5snmncq5dayn"))

(define rust-assert-json-diff-2.0.2
  (crate-source "assert-json-diff" "2.0.2"
                "04mg3w0rh3schpla51l18362hsirl23q93aisws2irrj32wg5r27"))

(define rust-async-broadcast-0.7.2
  (crate-source "async-broadcast" "0.7.2"
                "0ckmqcwyqwbl2cijk1y4r0vy60i89gqc86ijrxzz5f2m4yjqfnj3"))

(define rust-async-channel-2.5.0
  (crate-source "async-channel" "2.5.0"
                "1ljq24ig8lgs2555myrrjighycpx2mbjgrm3q7lpa6rdsmnxjklj"))

(define rust-async-executor-1.14.0
  (crate-source "async-executor" "1.14.0"
                "0al1rmxjy7p7r6h50z698q5lwssqs5a2vzmqbazm1z2sv1rgjsy9"))

(define rust-async-io-2.6.0
  (crate-source "async-io" "2.6.0"
                "1z16s18bm4jxlmp6rif38mvn55442yd3wjvdfhvx4hkgxf7qlss5"))

(define rust-async-lock-3.4.2
  (crate-source "async-lock" "3.4.2"
                "04c3xrrdrfrvh9v0ajxrangpy38qi76qq268zslphnxxjqjpy3r9"))

(define rust-async-process-2.5.0
  (crate-source "async-process" "2.5.0"
                "0xfswxmng6835hjlfhv7k0jrfp7czqxpfj6y2s5dsp05q0g94l7w"))

(define rust-async-recursion-1.1.1
  (crate-source "async-recursion" "1.1.1"
                "04ac4zh8qz2xjc79lmfi4jlqj5f92xjvfaqvbzwkizyqd4pl4hrv"))

(define rust-async-signal-0.2.14
  (crate-source "async-signal" "0.2.14"
                "11dlpb15la279r5cazppy18gbk2xzzl60ahzl19m1kr0l2psmdaj"))

(define rust-async-task-4.7.1
  (crate-source "async-task" "4.7.1"
                "1pp3avr4ri2nbh7s6y9ws0397nkx1zymmcr14sq761ljarh3axcb"))

(define rust-async-tempfile-0.6.0
  (crate-source "async-tempfile" "0.6.0"
                "1rvmx43vgm32bfrjzdmsvi763813h9a1z7y7mw4m20d86jc0vfdc"))

(define rust-async-trait-0.1.89
  (crate-source "async-trait" "0.1.89"
                "1fsxxmz3rzx1prn1h3rs7kyjhkap60i7xvi0ldapkvbb14nssdch"))

(define rust-atomic-waker-1.1.2
  (crate-source "atomic-waker" "1.1.2"
                "1h5av1lw56m0jf0fd3bchxq8a30xv0b4wv8s4zkp4s0i7mfvs18m"))

(define rust-autocfg-1.5.0
  (crate-source "autocfg" "1.5.0"
                "1s77f98id9l4af4alklmzq46f21c980v13z2r1pcxx6bqgw0d1n0"))

(define rust-axum-0.8.9
  (crate-source "axum" "0.8.9"
                "146df5x8dhczm1sp939gr3839220wl6rxc1k65bzc450z72ridii"))

(define rust-axum-core-0.5.6
  (crate-source "axum-core" "0.5.6"
                "1lcjhxysnbc64rh21ag9m9fpiryd1iwcdh9mwxz1yadiswqqziq8"))

(define rust-base64-0.22.1
  (crate-source "base64" "0.22.1"
                "1imqzgh7bxcikp5vx3shqvw9j09g9ly0xr0jma0q66i52r7jbcvj"))

(define rust-base64ct-1.8.3
  (crate-source "base64ct" "1.8.3"
                "01nyyyx84bhwrcc168hn47d8gvz2pzpv3y3lmck7mq4hw5vh3x9a"))

(define rust-basic-toml-0.1.10
  (crate-source "basic-toml" "0.1.10"
                "12hp59jl28kk229q4sqx6v4fc9p66v8i2byi0vlc9922h9g6fqms"))

(define rust-bincode-1.3.3
  (crate-source "bincode" "1.3.3"
                "1bfw3mnwzx5g1465kiqllp5n4r10qrqy88kdlp3jfwnq2ya5xx5i"))

(define rust-bit-set-0.8.0
  (crate-source "bit-set" "0.8.0"
                "18riaa10s6n59n39vix0cr7l2dgwdhcpbcm97x1xbyfp1q47x008"))

(define rust-bit-vec-0.8.0
  (crate-source "bit-vec" "0.8.0"
                "1xxa1s2cj291r7k1whbxq840jxvmdsq9xgh7bvrxl46m80fllxjy"))

(define rust-bitfield-struct-0.12.1
  (crate-source "bitfield-struct" "0.12.1"
                "0fq0lq42yh7m69jdxd6cmqm4qgglbk8hkzgnvm92injs9j2w8sc7"))

(define rust-bitflags-1.3.2
  (crate-source "bitflags" "1.3.2"
                "12ki6w8gn1ldq7yz9y680llwk5gmrhrzszaa17g1sbrw2r2qvwxy"))

(define rust-bitflags-2.11.1
  (crate-source "bitflags" "2.11.1"
                "1cvqijg3rvwgis20a66vfdxannjsxfy5fgjqkaq3l13gyfcj4lf4"))

(define rust-blake2-0.10.6
  (crate-source "blake2" "0.10.6"
                "1zlf7w7gql12v61d9jcbbswa3dw8qxsjglylsiljp9f9b3a2ll26"))

(define rust-blake3-1.8.5
  (crate-source "blake3" "1.8.5"
                "1khz6wq61fnr0gl1kmy4bxadc7gbcv4gbq05z4jdjhr8wqs3ra0a"))

(define rust-block-0.1.6
  (crate-source "block" "0.1.6"
                "16k9jgll25pzsq14f244q22cdv0zb4bqacldg3kx6h89d7piz30d"))

(define rust-block-buffer-0.10.4
  (crate-source "block-buffer" "0.10.4"
                "0w9sa2ypmrsqqvc20nhwr75wbb5cjr4kkyhpjm1z1lv2kdicfy1h"))

(define rust-block2-0.5.1
  (crate-source "block2" "0.5.1"
                "0pyiha5his2grzqr3mynmq244laql2j20992i59asp0gy7mjw4rc"))

(define rust-block2-0.6.2
  (crate-source "block2" "0.6.2"
                "1xcfllzx6c3jc554nmb5qy6xmlkl6l6j5ib4wd11800n0n3rvsyd"))

(define rust-blocking-1.6.2
  (crate-source "blocking" "1.6.2"
                "08bz3f9agqlp3102snkvsll6wc9ag7x5m1xy45ak2rv9pq18sgz8"))

(define rust-bumpalo-3.20.2
  (crate-source "bumpalo" "3.20.2"
                "1jrgxlff76k9glam0akhwpil2fr1w32gbjdf5hpipc7ld2c7h82x"))

(define rust-byte-string-1.0.0
  (crate-source "byte_string" "1.0.0"
                "1vdll2i5gdx98d3wqbrq8c2l61jqqhzlri7d3hskm35a0mxdxahi"))

(define rust-byteorder-1.5.0
  (crate-source "byteorder" "1.5.0"
                "0jzncxyf404mwqdbspihyzpkndfgda450l0893pz5xj685cg5l0z"))

(define rust-byteorder-slice-3.0.0
  (crate-source "byteorder_slice" "3.0.0"
                "141i06ka1kj04jn8q7pqbxhylc5r64hj9x7qif79ay3k70q4wa8b"))

(define rust-bytes-1.12.1
  (crate-source "bytes" "1.12.1"
                "017z19dpg4f942h051m7bpnzcgng042hhcpd7bmg7bjjqd42lrgw"))

(define rust-cacao-0.3.2
  (crate-source "cacao" "0.3.2"
                "0yiyjihk78glvmpkmibqw1cpgxbaql2ikl06qy7smr3jhsaz0ljr"))

(define rust-camellia-0.1.0
  (crate-source "camellia" "0.1.0"
                "0c6f61rf0gzq7x9d2qmp0330pb397aldwdpmwqybbwly9rby4r1j"))

(define rust-camino-1.2.4
  (crate-source "camino" "1.2.4"
                "183v8ff17fnl8f4rygxz2hqgvc8k0rmivlsi5n9jch1w2zj30baz"))

(define rust-cargo-platform-0.1.9
  (crate-source "cargo-platform" "0.1.9"
                "1sinpmqjdk3q9llbmxr0h0nyvqrif1r5qs34l000z73b024z2np3"))

(define rust-cargo-metadata-0.19.2
  (crate-source "cargo_metadata" "0.19.2"
                "1fkr8jp6vhva4kc3rhx13yrnl8g3zch463j20vbwa9scxlabcpnx"))

(define rust-cast-0.3.0
  (crate-source "cast" "0.3.0"
                "1dbyngbyz2qkk0jn2sxil8vrz3rnpcj142y184p9l4nbl9radcip"))

(define rust-cbindgen-0.28.0
  (crate-source "cbindgen" "0.28.0"
                "1zyiaifg6mcd4wwhhbxk8adzhph6qz4wxzgagvg3ijp95j58dpga"))

(define rust-cc-1.2.61
  (crate-source "cc" "1.2.61"
                "0vawvnrrsmi8dygavq3wx085cmlp10sp3fhld5842rlqkqsr0vfi"))

(define rust-cesu8-1.1.0
  (crate-source "cesu8" "1.1.0"
                "0g6q58wa7khxrxcxgnqyi9s1z2cjywwwd3hzr5c55wskhx6s0hvd"))

(define rust-cfg-if-1.0.4
  (crate-source "cfg-if" "1.0.4"
                "008q28ajc546z5p2hcwdnckmg0hia7rnx52fni04bwqkzyrghc4k"))

(define rust-cfg-aliases-0.2.1
  (crate-source "cfg_aliases" "0.2.1"
                "092pxdc1dbgjb6qvh83gk56rkic2n2ybm4yvy76cgynmzi3zwfk1"))

(define rust-chacha20-0.9.1
  (crate-source "chacha20" "0.9.1"
                "0678wipx6kghp71hpzhl2qvx80q7caz3vm8vsvd07b1fpms3yqf3"))

(define rust-chacha20-0.10.0
  (crate-source "chacha20" "0.10.0"
                "00bn2rn8l68qvlq93mhq7b4ns4zy9qbjsyjbb9kljgl4hqr9i3bg"))

(define rust-chacha20poly1305-0.10.1
  (crate-source "chacha20poly1305" "0.10.1"
                "0dfwq9ag7x7lnd0znafpcn8h7k4nfr9gkzm0w7sc1lcj451pkk8h"))

(define rust-chrono-0.4.44
  (crate-source "chrono" "0.4.44"
                "1c64mk9a235271j5g3v4zrzqqmd43vp9vki7vqfllpqf5rd0fwy6"))

(define rust-ciborium-0.2.2
  (crate-source "ciborium" "0.2.2"
                "03hgfw4674im1pdqblcp77m7rc8x2v828si5570ga5q9dzyrzrj2"))

(define rust-ciborium-io-0.2.2
  (crate-source "ciborium-io" "0.2.2"
                "0my7s5g24hvp1rs1zd1cxapz94inrvqpdf1rslrvxj8618gfmbq5"))

(define rust-ciborium-ll-0.2.2
  (crate-source "ciborium-ll" "0.2.2"
                "1n8g4j5rwkfs3rzfi6g1p7ngmz6m5yxsksryzf5k72ll7mjknrjp"))

(define rust-cipher-0.4.4
  (crate-source "cipher" "0.4.4"
                "1b9x9agg67xq5nq879z66ni4l08m6m3hqcshk37d4is4ysd3ngvp"))

(define rust-clap-4.5.60
  (crate-source "clap" "4.5.60"
                "02h3nzznssjgp815nnbzk0r62y2iw03kdli75c233kirld6z75r7"))

(define rust-clap-builder-4.5.60
  (crate-source "clap_builder" "4.5.60"
                "0xk8mdizvmmn6w5ij5cwhy5pbgyac4w9pfvl6nqmjl7a5hql38i4"))

(define rust-clap-complete-4.6.3
  (crate-source "clap_complete" "4.6.3"
                "1hxc8nd0xanjssw1bjb9zda48zixcigksfdhpjwi642v8lh0a336"))

(define rust-clap-derive-4.5.55
  (crate-source "clap_derive" "4.5.55"
                "1r949xis3jmhzh387smd70vc8a3b9734ck3g5ahg59a63bd969x9"))

(define rust-clap-lex-1.1.0
  (crate-source "clap_lex" "1.1.0"
                "1ycqkpygnlqnndghhcxjb44lzl0nmgsia64x9581030yifxs7m68"))

(define rust-colorchoice-1.0.5
  (crate-source "colorchoice" "1.0.5"
                "0w75k89hw39p0mnnhlrwr23q50rza1yjki44qvh2mgrnj065a1qx"))

(define rust-colored-3.1.1
  (crate-source "colored" "3.1.1"
                "0d5cpbgvyvmmky199s885s6385ykd75q6qg3d2kcxjxq563ldygs"))

(define rust-combine-4.6.7
  (crate-source "combine" "4.6.7"
                "1z8rh8wp59gf8k23ar010phgs0wgf5i8cx4fg01gwcnzfn5k0nms"))

(define rust-concurrent-queue-2.5.0
  (crate-source "concurrent-queue" "2.5.0"
                "0wrr3mzq2ijdkxwndhf79k952cp4zkz35ray8hvsxl96xrx1k82c"))

(define rust-console-0.16.3
  (crate-source "console" "0.16.3"
                "11zwz1vnfr0nx6dyjx0gjymp8864y5hxwf01ynfd2s8kapsqlknn"))

(define rust-const-oid-0.9.6
  (crate-source "const-oid" "0.9.6"
                "1y0jnqaq7p2wvspnx7qj76m7hjcqpz73qzvr9l2p9n2s51vr6if2"))

(define rust-constant-time-eq-0.4.2
  (crate-source "constant_time_eq" "0.4.2"
                "16zamq60dq80k3rqlzh9j9cpjhishmh924lnwbplgrnmkkvfylix"))

(define rust-convert-case-0.10.0
  (crate-source "convert_case" "0.10.0"
                "1fff1x78mp2c233g68my0ag0zrmjdbym8bfyahjbfy4cxza5hd33"))

(define rust-core-foundation-0.9.4
  (crate-source "core-foundation" "0.9.4"
                "13zvbbj07yk3b61b8fhwfzhy35535a583irf23vlcg59j7h9bqci"))

(define rust-core-foundation-sys-0.8.7
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "core-foundation-sys" "0.8.7"
                "12w8j73lazxmr1z0h98hf3z623kl8ms7g07jch7n4p8f9nwlhdkp"))

(define rust-core-graphics-0.22.3
  (crate-source "core-graphics" "0.22.3"
                "1yz4xzbz36vbmlra0viazzlicp8kap1ldgshsp5nzz4g7fmvp095"))

(define rust-core-graphics-types-0.1.3
  (crate-source "core-graphics-types" "0.1.3"
                "1bxg8nxc8fk4kxnqyanhf36wq0zrjr552c58qy6733zn2ihhwfa5"))

(define rust-cpufeatures-0.2.17
  (crate-source "cpufeatures" "0.2.17"
                "10023dnnaghhdl70xcds12fsx2b966sxbxjq5sxs49mvxqw5ivar"))

(define rust-cpufeatures-0.3.0
  (crate-source "cpufeatures" "0.3.0"
                "00fjhygsqmh4kbxxlb99mcsbspxcai6hjydv4c46pwb67wwl2alb"))

(define rust-crc32fast-1.5.0
  (crate-source "crc32fast" "1.5.0"
                "04d51liy8rbssra92p0qnwjw8i9rm9c4m3bwy19wjamz1k4w30cl"))

(define rust-criterion-0.7.0
  (crate-source "criterion" "0.7.0"
                "0a6rrgka8013l5d7bhlln60fja7nj4qmlhc4z92y3hqc5fk4gh71"))

(define rust-criterion-plot-0.6.0
  (crate-source "criterion-plot" "0.6.0"
                "0f73hgvmxacda8xk3a2xfbrqmphcz1ail2xdhjfmkbnzqw6wq6wv"))

(define rust-critical-section-1.2.0
  (crate-source "critical-section" "1.2.0"
                "02ylhcykxjc40xrfhk1lwc21jqgz4dbwv3jr49ymw733c51yl3kr"))

(define rust-crossbeam-channel-0.5.15
  (crate-source "crossbeam-channel" "0.5.15"
                "1cicd9ins0fkpfgvz9vhz3m9rpkh6n8d3437c3wnfsdkd3wgif42"))

(define rust-crossbeam-deque-0.8.6
  (crate-source "crossbeam-deque" "0.8.6"
                "0l9f1saqp1gn5qy0rxvkmz4m6n7fc0b3dbm6q1r5pmgpnyvi3lcx"))

(define rust-crossbeam-epoch-0.9.20
  (crate-source "crossbeam-epoch" "0.9.20"
                "0gzg0v8in20iajikalg5i5qgpp0m26r426f0fs8nwk953w218s9d"))

(define rust-crossbeam-utils-0.8.21
  (crate-source "crossbeam-utils" "0.8.21"
                "0a3aa2bmc8q35fb67432w16wvi54sfmb69rk9h5bhd18vw0c99fh"))

(define rust-crunchy-0.2.4
  (crate-source "crunchy" "0.2.4"
                "1mbp5navim2qr3x48lyvadqblcxc1dm0lqr0swrkkwy2qblvw3s6"))

(define rust-crypto-common-0.1.7
  (crate-source "crypto-common" "0.1.7"
                "02nn2rhfy7kvdkdjl457q2z0mklcvj9h662xrq6dzhfialh2kj3q"))

(define rust-csv-1.4.0
  (crate-source "csv" "1.4.0"
                "0f7r2ip0rbi7k377c3xmsh9xd69sillffhpfmbgnvz3yrxl9vkaj"))

(define rust-csv-core-0.1.13
  (crate-source "csv-core" "0.1.13"
                "10lppd3fdb1i5npgx9xqjs5mjmy2qbdi8n16i48lg03ak4k3qjkh"))

(define rust-ctr-0.9.2
  (crate-source "ctr" "0.9.2"
                "0d88b73waamgpfjdml78icxz45d95q7vi2aqa604b0visqdfws83"))

(define rust-ctrlc-3.5.2
  (crate-source "ctrlc" "3.5.2"
                "0qh1lvlr6k58dliqllx1n7mjfwp1mzr607bks3r9m0a5msrgmcg0"))

(define rust-curve25519-dalek-4.1.3
  (crate-source "curve25519-dalek" "4.1.3"
                "1gmjb9dsknrr8lypmhkyjd67p1arb8mbfamlwxm7vph38my8pywp"))

(define rust-curve25519-dalek-derive-0.1.1
  (crate-source "curve25519-dalek-derive" "0.1.1"
                "1cry71xxrr0mcy5my3fb502cwfxy6822k4pm19cwrilrg7hq4s7l"))

(define rust-darling-0.20.11
  (crate-source "darling" "0.20.11"
                "1vmlphlrlw4f50z16p4bc9p5qwdni1ba95qmxfrrmzs6dh8lczzw"))

(define rust-darling-core-0.20.11
  (crate-source "darling_core" "0.20.11"
                "0bj1af6xl4ablnqbgn827m43b8fiicgv180749f5cphqdmcvj00d"))

(define rust-darling-macro-0.20.11
  (crate-source "darling_macro" "0.20.11"
                "1bbfbc2px6sj1pqqq97bgqn6c8xdnb2fmz66f7f40nrqrcybjd7w"))

(define rust-data-encoding-2.11.0
  (crate-source "data-encoding" "2.11.0"
                "1j00wfmk4dzn4bnib07qlhylmd6a3kizwjz8mp00iix3vlamzbm4"))

(define rust-dbus-0.9.11
  (crate-source "dbus" "0.9.11"
                "0wxzld0baycxa4z6zrmnh68yy456b0f82j8wyp8wyymvj8ln0hmr"))

(define rust-defmt-0.3.100
  (crate-source "defmt" "0.3.100"
                "1bb4dcq13szxs7y1ibvyjy7yn1sigb84vz1n841b4abhh51k95ph"))

(define rust-defmt-1.1.1
  (crate-source "defmt" "1.1.1"
                "1lc8xlfj700xqjmvp7n9hhc1czgpaqkq960iqw6d5fwk9zz3p5g2"))

(define rust-defmt-macros-1.1.1
  (crate-source "defmt-macros" "1.1.1"
                "1s2zkcbaj1l306ph1n1gsfm6vzc2sah4acl1qc6pw4x2ghpcgnds"))

(define rust-defmt-parser-1.0.0
  (crate-source "defmt-parser" "1.0.0"
                "0gpfky9sssil5qfaix5wxcwiqk7snszhl5gq3vcwkrxjncs07mhh"))

(define rust-der-0.7.10
  (crate-source "der" "0.7.10"
                "1jyxacyxdx6mxbkfw99jz59dzvcd9k17rq01a7xvn1dr6wl87hg7"))

(define rust-deranged-0.5.8
  (crate-source "deranged" "0.5.8"
                "0711df3w16vx80k55ivkwzwswziinj4dz05xci3rvmn15g615n3w"))

(define rust-derive-into-owned-0.2.0
  (crate-source "derive-into-owned" "0.2.0"
                "08y9qkiyqgm4sjcnl1xnm4f3ffb3pi4g8f46daqaf69q3vc9979c"))

(define rust-derive-builder-0.20.2
  (crate-source "derive_builder" "0.20.2"
                "0is9z7v3kznziqsxa5jqji3ja6ay9wzravppzhcaczwbx84znzah"))

(define rust-derive-builder-core-0.20.2
  (crate-source "derive_builder_core" "0.20.2"
                "1s640r6q46c2iiz25sgvxw3lk6b6v5y8hwylng7kas2d09xwynrd"))

(define rust-derive-builder-macro-0.20.2
  (crate-source "derive_builder_macro" "0.20.2"
                "0g1zznpqrmvjlp2w7p0jzsjvpmw5rvdag0rfyypjhnadpzib0qxb"))

(define rust-derive-more-2.1.1
  (crate-source "derive_more" "2.1.1"
                "0d5i10l4aff744jw7v4n8g6cv15rjk5mp0f1z522pc2nj7jfjlfp"))

(define rust-derive-more-impl-2.1.1
  (crate-source "derive_more-impl" "2.1.1"
                "1jwdp836vymp35d7mfvvalplkdgk2683nv3zjlx65n1194k9g6kr"))

(define rust-digest-0.10.7
  (crate-source "digest" "0.10.7"
                "14p2n6ih29x81akj097lvz7wi9b6b9hvls0lwrv7b6xwyy0s5ncy"))

(define rust-dirs-6.0.0
  (crate-source "dirs" "6.0.0"
                "0knfikii29761g22pwfrb8d0nqpbgw77sni9h2224haisyaams63"))

(define rust-dirs-sys-0.5.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "dirs-sys" "0.5.0"
                "1aqzpgq6ampza6v012gm2dppx9k35cdycbj54808ksbys9k366p0"))

(define rust-dispatch-0.2.0
  (crate-source "dispatch" "0.2.0"
                "0fwjr9b7582ic5689zxj8lf7zl94iklhlns3yivrnv8c9fxr635x"))

(define rust-dispatch2-0.3.1
  (crate-source "dispatch2" "0.3.1"
                "0f5xmnbzpaz1g80m27kd804p75nswh0ikb6wvqh4ba3x9rz3c3hy"))

(define rust-displaydoc-0.2.5
  (crate-source "displaydoc" "0.2.5"
                "1q0alair462j21iiqwrr21iabkfnb13d6x5w95lkdg21q2xrqdlp"))

(define rust-domain-fronting-0.1.0
  (crate-source "domain-fronting" "0.1.0"
                "1czrh2gdsk3zrx0bgfnnhsrf6dwad5p7xs1vayqn1s0nf6i7745p"))

(define rust-dunce-1.0.5
  (crate-source "dunce" "1.0.5"
                "04y8wwv3vvcqaqmqzssi6k0ii9gs6fpz96j5w9nky2ccsl23axwj"))

(define rust-duplicate-2.0.1
  (crate-source "duplicate" "2.0.1"
                "091cfk8krd3k31pc50qaz2h1xnsi3nhzmazdrbxbyv0p945g34lf"))

(define rust-dynosaur-0.3.0
  (crate-source "dynosaur" "0.3.0"
                "0cm5vmmxjj2dy2mr9bdirhb8w3fzm5wgq4nb2ax2k3rpgx0h68x1"))

(define rust-dynosaur-derive-0.3.0
  (crate-source "dynosaur_derive" "0.3.0"
                "0r13mgkgn2qlas2ngyxb47ww83vw7l28pfypbi67fbnmq7ai61qb"))

(define rust-ed25519-2.2.3
  (crate-source "ed25519" "2.2.3"
                "0lydzdf26zbn82g7xfczcac9d7mzm3qgx934ijjrd5hjpjx32m8i"))

(define rust-ed25519-dalek-2.2.0
  (crate-source "ed25519-dalek" "2.2.0"
                "1agcwij1z687hg26ngzwhnmpz29b2w56m8z1ap3pvrnfh709drvh"))

(define rust-educe-0.4.23
  (crate-source "educe" "0.4.23"
                "0py06ad6l0bfdiilg6jbh1dfhf9k0zdywb3xwzdn78s6hbzl400g"))

(define rust-either-1.15.0
  (crate-source "either" "1.15.0"
                "069p1fknsmzn9llaizh77kip0pqmcwpdsykv2x30xpjyija5gis8"))

(define rust-encode-unicode-1.0.0
  (crate-source "encode_unicode" "1.0.0"
                "1h5j7j7byi289by63s3w4a8b3g6l5ccdrws7a67nn07vdxj77ail"))

(define rust-endi-1.1.1
  (crate-source "endi" "1.1.1"
                "16a0076dx41vgrzzimm9clcym77h732czqjiajanmzvd1i1y5dv6"))

(define rust-enum-map-2.7.3
  (crate-source "enum-map" "2.7.3"
                "1sgjgl4mmz93jdkfdsmapc3dmaq8gddagw9s0fd501w2vyzz6rk8"))

(define rust-enum-map-derive-0.17.0
  (crate-source "enum-map-derive" "0.17.0"
                "1sv4mb343rsz4lc3rh7cyn0pdhf7fk18k1dgq8kfn5i5x7gwz0pj"))

(define rust-enum-ordinalize-3.1.15
  (crate-source "enum-ordinalize" "3.1.15"
                "1vj9iw2px39jaya7b8k0vdbrd8wjm55b3ix9n6jixzxv0qzzmw8v"))

(define rust-enumflags2-0.7.12
  (crate-source "enumflags2" "0.7.12"
                "1vzcskg4dca2jiflsfx1p9yw1fvgzcakcs7cpip0agl51ilgf9qh"))

(define rust-enumflags2-derive-0.7.12
  (crate-source "enumflags2_derive" "0.7.12"
                "09rqffacafl1b83ir55hrah9gza0x7pzjn6lr6jm76fzix6qmiv7"))

(define rust-env-filter-1.0.1
  (crate-source "env_filter" "1.0.1"
                "1vvf9xhaxm0m78bp23b8j3cbv1vm5vffn3gaas27mc64rhm0rs9j"))

(define rust-env-logger-0.11.10
  (crate-source "env_logger" "0.11.10"
                "0smmk1hqzk7z91rg7fdq98d03gh9kidkd0ymim43zb4n457w0886"))

(define rust-equivalent-1.0.2
  (crate-source "equivalent" "1.0.2"
                "03swzqznragy8n0x31lqc78g2af054jwivp7lkrbrc0khz74lyl7"))

(define rust-err-context-0.1.0
  (crate-source "err-context" "0.1.0"
                "17n80zklsw187zvlgyv50320bmzg0iagal5zydzr4kinn4iav6j4"))

(define rust-errno-0.2.8
  (crate-source "errno" "0.2.8"
                "18cnqgk8r6lq1n5cfy3bryiyz9zkqr10dxj49sa3fkzfamih8fgn"))

(define rust-errno-0.3.14
  (crate-source "errno" "0.3.14"
                "1szgccmh8vgryqyadg8xd58mnwwicf39zmin3bsn63df2wbbgjir"))

(define rust-errno-dragonfly-0.1.2
  (crate-source "errno-dragonfly" "0.1.2"
                "1grrmcm6q8512hkq5yzch3yv8wafflc2apbmsaabiyk44yqz2s5a"))

(define rust-event-listener-5.4.1
  (crate-source "event-listener" "5.4.1"
                "1asnp3agbr8shcl001yd935m167ammyi8hnvl0q1ycajryn6cfz1"))

(define rust-event-listener-strategy-0.5.4
  (crate-source "event-listener-strategy" "0.5.4"
                "14rv18av8s7n8yixg38bxp5vg2qs394rl1w052by5npzmbgz7scb"))

(define rust-eyre-0.6.12
  (crate-source "eyre" "0.6.12"
                "1v1a3vb9gs5zkwp4jzkcfnpg0gvyp4ifydzx37f4qy14kzcibnbw"))

(define rust-fastrand-2.4.1
  (crate-source "fastrand" "2.4.1"
                "1mnqxxnxvd69ma9mczabpbbsgwlhd6l78yv3vd681453a9s247wz"))

(define rust-fiat-crypto-0.2.9
  (crate-source "fiat-crypto" "0.2.9"
                "07c1vknddv3ak7w89n85ik0g34nzzpms6yb845vrjnv9m4csbpi8"))

(define rust-find-msvc-tools-0.1.9
  (crate-source "find-msvc-tools" "0.1.9"
                "10nmi0qdskq6l7zwxw5g56xny7hb624iki1c39d907qmfh3vrbjv"))

(define rust-fixedbitset-0.5.7
  (crate-source "fixedbitset" "0.5.7"
                "16fd3v9d2cms2vddf9xhlm56sz4j0zgrk3d2h6v1l7hx760lwrqx"))

(define rust-flate2-1.1.9
  (crate-source "flate2" "1.1.9"
                "0g2pb7cxnzcbzrj8bw4v6gpqqp21aycmf6d84rzb6j748qkvlgw4"))

(define rust-fluid-let-1.0.0
  (crate-source "fluid-let" "1.0.0"
                "0nj848aiglv2ggwg43pa05266lx74791v91i1f58gby1gn3zz73l"))

(define rust-fnv-1.0.7
  (crate-source "fnv" "1.0.7"
                "1hc2mcqha06aibcaza94vbi81j6pr9a1bbxrxjfhc91zin8yr7iz"))

(define rust-foldhash-0.1.5
  (crate-source "foldhash" "0.1.5"
                "1wisr1xlc2bj7hk4rgkcjkz3j2x4dhd1h9lwk7mj8p71qpdgbi6r"))

(define rust-foreign-types-0.3.2
  (crate-source "foreign-types" "0.3.2"
                "1cgk0vyd7r45cj769jym4a6s7vwshvd0z4bqrb92q1fwibmkkwzn"))

(define rust-foreign-types-shared-0.1.1
  (crate-source "foreign-types-shared" "0.1.1"
                "0jxgzd04ra4imjv8jgkmdq59kj8fsz6w4zxsbmlai34h26225c00"))

(define rust-form-urlencoded-1.2.2
  (crate-source "form_urlencoded" "1.2.2"
                "1kqzb2qn608rxl3dws04zahcklpplkd5r1vpabwga5l50d2v4k6b"))

(define rust-fs-err-2.11.0
  (crate-source "fs-err" "2.11.0"
                "0hdajzh5sjvvdjg0n15j91mv8ydvb7ff6m909frvdmg1bw81z948"))

(define rust-fsevent-sys-4.1.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "fsevent-sys" "4.1.0"
                "1liz67v8b0gcs8r31vxkvm2jzgl9p14i78yfqx81c8sdv817mvkn"))

(define rust-futures-0.3.33
  (crate-source "futures" "0.3.33"
                "066j5aqz8an05xh4hn5ljdnjn80z3g335v4grx4gaifr57wg3358"))

(define rust-futures-channel-0.3.33
  (crate-source "futures-channel" "0.3.33"
                "1bn5hlhfkl1sgypmiachaqcgwmr6wmjal7dyhfyb1zkazvs90996"))

(define rust-futures-core-0.3.33
  (crate-source "futures-core" "0.3.33"
                "1iqdbvcdlplfr2g43h7xrfkv2sg5p1a26x8acz1xgxl07i3hrm9c"))

(define rust-futures-executor-0.3.33
  (crate-source "futures-executor" "0.3.33"
                "0n3lpkmcfrsnh40i4armn040gnqbpd257hz5qs46zipjr6f8fm37"))

(define rust-futures-io-0.3.33
  (crate-source "futures-io" "0.3.33"
                "0yjx13qdm9b2p4w00ddw85k6yccnnmqrlrrz8yfmi5jg7jmfqxs5"))

(define rust-futures-lite-2.6.1
  (crate-source "futures-lite" "2.6.1"
                "1ba4dg26sc168vf60b1a23dv1d8rcf3v3ykz2psb7q70kxh113pp"))

(define rust-futures-macro-0.3.33
  (crate-source "futures-macro" "0.3.33"
                "02xiyd5y1nk9b805aympj4wq2czgvxnhcml9w9xkc665d3g3qv9d"))

(define rust-futures-sink-0.3.33
  (crate-source "futures-sink" "0.3.33"
                "01z38z344hpryw84b6r0rbwcb669d8pyvl2szg10aqwx96n1hi73"))

(define rust-futures-task-0.3.33
  (crate-source "futures-task" "0.3.33"
                "02f1y1yvjg1cv998zkgl1706pi9y4fyc9045l1hlmyqyhclfscdj"))

(define rust-futures-util-0.3.33
  (crate-source "futures-util" "0.3.33"
                "1anyg40j5www5l22r2jbn1birsafz4q1w9qmcjk4vqzwasi90ym7"))

(define rust-generic-array-0.14.7
  (crate-source "generic-array" "0.14.7"
                "16lyyrzrljfq424c3n8kfwkqihlimmsg5nhshbbp48np3yjrqr45"))

(define rust-getrandom-0.2.17
  (crate-source "getrandom" "0.2.17"
                "1l2ac6jfj9xhpjjgmcx6s1x89bbnw9x6j9258yy6xjkzpq0bqapz"))

(define rust-getrandom-0.3.4
  (crate-source "getrandom" "0.3.4"
                "1zbpvpicry9lrbjmkd4msgj3ihff1q92i334chk7pzf46xffz7c9"))

(define rust-getrandom-0.4.2
  (crate-source "getrandom" "0.4.2"
                "0mb5833hf9pvn9dhvxjgfg5dx0m77g8wavvjdpvpnkp9fil1xr8d"))

(define rust-ghash-0.5.1
  (crate-source "ghash" "0.5.1"
                "1wbg4vdgzwhkpkclz1g6bs4r5x984w5gnlsj4q5wnafb5hva9n7h"))

(define rust-glob-0.3.3
  (crate-source "glob" "0.3.3"
                "106jpd3syfzjfj2k70mwm0v436qbx96wig98m4q8x071yrq35hhc"))

(define rust-goblin-0.8.2
  (crate-source "goblin" "0.8.2"
                "0isg7yzqv7y9s4xs594niy4vqzpc7d6h58z65x06dxk5q4q3ldhv"))

(define rust-gotatun-0.8.2
  (crate-source "gotatun" "0.8.2"
                "1qx5zkzi8xvdf5xrvqwjsv2xvsc0gbj1zy7fgrkdb6b7sn4r2mg6"))

(define rust-h2-0.4.13
  (crate-source "h2" "0.4.13"
                "0m6w5gg0n0m1m5915bxrv8n4rlazhx5icknkslz719jhh4xdli1g"))

(define rust-h3-0.0.7
  (crate-source "h3" "0.0.7"
                "1lxhjrdb8z0xhd9r79fbd9kr1x22s49djsnidqc6z9i89yd0byvx"))

(define rust-h3-datagram-0.0.1
  (crate-source "h3-datagram" "0.0.1"
                "077sd3572m62hz59w761lbkzni0g5pgw0z6rd92kmx8g1v05ih4q"))

(define rust-h3-quinn-0.0.9
  (crate-source "h3-quinn" "0.0.9"
                "1gvgqsvbd9ww0di7rv768kbnbj4r62xbgc6bwg48y6clmqc26j3d"))

(define rust-half-2.7.1
  (crate-source "half" "2.7.1"
                "0jyq42xfa6sghc397mx84av7fayd4xfxr4jahsqv90lmjr5xi8kf"))

(define rust-hash32-0.3.1
  (crate-source "hash32" "0.3.1"
                "01h68z8qi5gl9lnr17nz10lay8wjiidyjdyd60kqx8ibj090pmj7"))

(define rust-hashbrown-0.15.5
  (crate-source "hashbrown" "0.15.5"
                "189qaczmjxnikm9db748xyhiw04kpmhm9xj9k9hg0sgx7pjwyacj"))

(define rust-hashbrown-0.17.0
  (crate-source "hashbrown" "0.17.0"
                "0l8gvcz80lvinb7x22h53cqbi2y1fm603y2jhhh9qwygvkb7sijg"))

(define rust-heapless-0.9.3
  (crate-source "heapless" "0.9.3"
                "192s7fnk1mqacc16qr74bc86lqkfqwa5gp6q9s5va5cl7zc4pfi5"))

(define rust-heck-0.4.1
  (crate-source "heck" "0.4.1"
                "1a7mqsnycv5z4z5vnv1k34548jzmc0ajic7c1j8jsaspnhw5ql4m"))

(define rust-heck-0.5.0
  (crate-source "heck" "0.5.0"
                "1sjmpsdl8czyh9ywl3qcsfsq9a307dg4ni2vnlwgnzzqhc4y0113"))

(define rust-hermit-abi-0.5.2
  (crate-source "hermit-abi" "0.5.2"
                "1744vaqkczpwncfy960j2hxrbjl1q01csm84jpd9dajbdr2yy3zw"))

(define rust-hex-0.4.3
  (crate-source "hex" "0.4.3"
                "0w1a4davm1lgzpamwnba907aysmlrnygbqmfis2mqjx5m552a93z"))

(define rust-hickory-net-0.26.1
  (crate-source "hickory-net" "0.26.1"
                "10xi6nfbxvni70hmjjahq4kln7qf7y5gia182hg4f7n3z795wag2"))

(define rust-hickory-proto-0.26.1
  (crate-source "hickory-proto" "0.26.1"
                "0hy6z06q46385y90h8c9ryrd260crn0zx5rf4lm6fi7vgf0k3aqb"))

(define rust-hickory-resolver-0.26.1
  (crate-source "hickory-resolver" "0.26.1"
                "130p1yb969q4flk0hbh8vk6838374q66cabpc3kcvvlwhwl8vmgh"))

(define rust-hickory-server-0.26.1
  (crate-source "hickory-server" "0.26.1"
                "1v4qy67nvy3vqi5wfp8lqf9baqnq4xxsixxclyk0vadvdax3c0hk"))

(define rust-hkdf-0.12.4
  (crate-source "hkdf" "0.12.4"
                "1xxxzcarz151p1b858yn5skmhyrvn8fs4ivx5km3i1kjmnr8wpvv"))

(define rust-hmac-0.12.1
  (crate-source "hmac" "0.12.1"
                "0pmbr069sfg76z7wsssfk5ddcqd9ncp79fyz6zcm6yn115yc6jbc"))

(define rust-home-0.5.12
  (crate-source "home" "0.5.12"
                "13bjyzgx6q9srnfvl43dvmhn93qc8mh5w7cylk2g13sj3i3pyqnc"))

(define rust-htmlize-1.1.0
  (crate-source "htmlize" "1.1.0"
                "09kjb0dd05mxblqxymmpvl6jc24w2gnfcc6pj0kbl4g4v585v09f"))

(define rust-http-1.4.0
  (crate-source "http" "1.4.0"
                "06iind4cwsj1d6q8c2xgq8i2wka4ps74kmws24gsi1bzdlw2mfp3"))

(define rust-http-body-1.0.1
  (crate-source "http-body" "1.0.1"
                "111ir5k2b9ihz5nr9cz7cwm7fnydca7dx4hc7vr16scfzghxrzhy"))

(define rust-http-body-util-0.1.3
  (crate-source "http-body-util" "0.1.3"
                "0jm6jv4gxsnlsi1kzdyffjrj8cfr3zninnxpw73mvkxy4qzdj8dh"))

(define rust-httparse-1.10.1
  (crate-source "httparse" "1.10.1"
                "11ycd554bw2dkgw0q61xsa7a4jn1wb1xbfacmf3dbwsikvkkvgvd"))

(define rust-httpdate-1.0.3
  (crate-source "httpdate" "1.0.3"
                "1aa9rd2sac0zhjqh24c9xvir96g188zldkx0hr6dnnlx5904cfyz"))

(define rust-hybrid-array-0.2.3
  (crate-source "hybrid-array" "0.2.3"
                "1afjq3ap0p1lal70x5pmcpa6pqpzhqcddmlq59kgijad8l2milzj"))

(define rust-hyper-1.9.0
  (crate-source "hyper" "1.9.0"
                "1jmwbwqcaficskg76kq402gbymbnh2z4v99xwq3l5aa6n8bg16b2"))

(define rust-hyper-rustls-0.27.9
  (crate-source "hyper-rustls" "0.27.9"
                "03vfnsm873wsp1dk0q85nxvk7w6syp8c2m5bcdjcyfgg4786ijik"))

(define rust-hyper-timeout-0.5.2
  (crate-source "hyper-timeout" "0.5.2"
                "1c431l5ckr698248yd6bnsmizjy2m1da02cbpmsnmkpvpxkdb41b"))

(define rust-hyper-util-0.1.20
  (crate-source "hyper-util" "0.1.20"
                "186zdc58hmm663csmjvrzgkr6jdh93sfmi3q2pxi57gcaqjpqm4n"))

(define rust-iana-time-zone-0.1.65
  (crate-source "iana-time-zone" "0.1.65"
                "0w64khw5p8s4nzwcf36bwnsmqzf61vpwk9ca1920x82bk6nwj6z3"))

(define rust-iana-time-zone-haiku-0.1.2
  (crate-source "iana-time-zone-haiku" "0.1.2"
                "17r6jmj31chn7xs9698r122mapq85mfnv98bb4pg6spm0si2f67k"))

(define rust-icu-collections-2.1.1
  (crate-source "icu_collections" "2.1.1"
                "0hsblchsdl64q21qwrs4hvc2672jrf466zivbj1bwyv606bn8ssc"))

(define rust-icu-locale-core-2.1.1
  (crate-source "icu_locale_core" "2.1.1"
                "1djvdc2f5ylmp1ymzv4gcnmq1s4hqfim9nxlcm173lsd01hpifpd"))

(define rust-icu-normalizer-2.1.1
  (crate-source "icu_normalizer" "2.1.1"
                "16dmn5596la2qm0r3vih0bzjfi0vx9a20yqjha6r1y3vnql8hv2z"))

(define rust-icu-normalizer-data-2.1.1
  (crate-source "icu_normalizer_data" "2.1.1"
                "02jnzizg6q75m41l6c13xc7nkc5q8yr1b728dcgfhpzw076wrvbs"))

(define rust-icu-properties-2.1.2
  (crate-source "icu_properties" "2.1.2"
                "1v3lbmhhi7i6jgw51ikjb1p50qh5rb67grlkdnkc63l7zq1gq2q2"))

(define rust-icu-properties-data-2.1.2
  (crate-source "icu_properties_data" "2.1.2"
                "1bvpkh939rgzrjfdb7hz47v4wijngk0snmcgrnpwc9fpz162jv31"))

(define rust-icu-provider-2.1.1
  (crate-source "icu_provider" "2.1.1"
                "0576b7dizgyhpfa74kacv86y4g1p7v5ffd6c56kf1q82rvq2r5l5"))

(define rust-id-arena-2.3.0
  (crate-source "id-arena" "2.3.0"
                "0m6rs0jcaj4mg33gkv98d71w3hridghp5c4yr928hplpkgbnfc1x"))

(define rust-ident-case-1.0.1
  (crate-source "ident_case" "1.0.1"
                "0fac21q6pwns8gh1hz3nbq15j8fi441ncl6w4vlnd1cmc55kiq5r"))

(define rust-idna-1.1.0
  (crate-source "idna" "1.1.0"
                "1pp4n7hppm480zcx411dsv9wfibai00wbpgnjj4qj0xa7kr7a21v"))

(define rust-idna-adapter-1.2.1
  (crate-source "idna_adapter" "1.2.1"
                "0i0339pxig6mv786nkqcxnwqa87v4m94b2653f6k3aj0jmhfkjis"))

(define rust-indenter-0.3.4
  (crate-source "indenter" "0.3.4"
                "1maq7yl2px9y40f68c2g2gjsq93rabphzp5shinj8nsldplfckcn"))

(define rust-indexmap-2.14.0
  (crate-source "indexmap" "2.14.0"
                "1na9z6f0d5pkjr1lgsni470v98gv2r7c41j8w48skr089x2yjrnl"))

(define rust-inotify-0.10.2
  (crate-source "inotify" "0.10.2"
                "1k2m6a95827yspax1icmwiz4szr7c01w3dnn2b2bil4hfvcnilgx"))

(define rust-inotify-0.11.1
  (crate-source "inotify" "0.11.1"
                "16fiffnqhfdwzgrv3wcnaih0a9xbx1a44nma1yn5idr83apkwnxx"))

(define rust-inotify-sys-0.1.5
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "inotify-sys" "0.1.5"
                "1syhjgvkram88my04kv03s0zwa66mdwa5v7ddja3pzwvx2sh4p70"))

(define rust-inout-0.1.4
  (crate-source "inout" "0.1.4"
                "008xfl1jn9rxsq19phnhbimccf4p64880jmnpg59wqi07kk117w7"))

(define rust-insta-1.47.2
  (crate-source "insta" "1.47.2"
                "0kh9gspras3vhvx8wkygnw2wzlwjln7gwzgks8g4194kxd464jkv"))

(define rust-internet-checksum-0.2.1
  (crate-source "internet-checksum" "0.2.1"
                "05nxhharlwnkvd99s6gr3ha8ayzb179ybywp3xdi49cf00364vgw"))

(define rust-ioctl-sys-0.6.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "ioctl-sys" "0.6.0"
                "0bhqal9zbala895b5iwvwfi8k13jbxb2dz19jmk8iwjqlvzryhhw"))

(define rust-ioctl-sys-0.8.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "ioctl-sys" "0.8.0"
                "0g0kjq308kdm81wq3f1p6q1v2x5sd2v31iwqzzsjch2354x1zlcb"))

(define rust-ip-network-0.4.1
  (crate-source "ip_network" "0.4.1"
                "1c8fkq601gj8bqqf36jf96pglw1m8j470vaxmacz5clq19y08bxa"))

(define rust-ip-network-table-0.2.0
  (crate-source "ip_network_table" "0.2.0"
                "1h5jghwk1nm5lmilylwpqsf4qwbsvxx6ygyzbs6gxqn5qp7vg6a0"))

(define rust-ip-network-table-deps-treebitmap-0.5.0
  (crate-source "ip_network_table-deps-treebitmap" "0.5.0"
                "0pcyl0q3kdhlamzds5immbm00ql3d9mk9w2jnys0x75rvqr72lwf"))

(define rust-ipconfig-0.3.4
  (crate-source "ipconfig" "0.3.4"
                "08l2nk7q2kasbsixpdj83jb62rixys7xc2k3n3j6qgg31h64ch2d"))

(define rust-ipnet-2.12.0
  (crate-source "ipnet" "2.12.0"
                "1qpq2y0asyv0jppw7zww9y96fpnpinwap8a0phhqqgyy3znnz3yr"))

(define rust-ipnetwork-0.21.1
  (crate-source "ipnetwork" "0.21.1"
                "0qqpyjfma524v734nw4xri38xwj524z8q3k29bji6kfmmyyhldyg"))

(define rust-iri-string-0.7.12
  (crate-source "iri-string" "0.7.12"
                "082fpx6c5ghvmqpwxaf2b268m47z2ic3prajqbmi1s1qpfj5kri5"))

(define rust-is-terminal-polyfill-1.70.2
  (crate-source "is_terminal_polyfill" "1.70.2"
                "15anlc47sbz0jfs9q8fhwf0h3vs2w4imc030shdnq54sny5i7jx6"))

(define rust-itertools-0.13.0
  (crate-source "itertools" "0.13.0"
                "11hiy3qzl643zcigknclh446qb9zlg4dpdzfkjaa9q9fqpgyfgj1"))

(define rust-itertools-0.14.0
  (crate-source "itertools" "0.14.0"
                "118j6l1vs2mx65dqhwyssbrxpawa90886m3mzafdvyip41w2q69b"))

(define rust-itoa-1.0.18
  (crate-source "itoa" "1.0.18"
                "10jnd1vpfkb8kj38rlkn2a6k02afvj3qmw054dfpzagrpl6achlg"))

(define rust-jni-0.19.0
  (crate-source "jni" "0.19.0"
                "1v0pn0i1wb8zp4wns4l8hz9689hqsplv7iba7hylaznvwg11ipy6"))

(define rust-jni-0.22.4
  (crate-source "jni" "0.22.4"
                "161lza8gz071h22pgyqyx4n91ixd691z2dbb1pq2g97k5i49mzay"))

(define rust-jni-macros-0.22.4
  (crate-source "jni-macros" "0.22.4"
                "18v02mcn5c7mb2yw6r930xg6ynsn7hwkxv8z2kdhn3qprjn0j0d0"))

(define rust-jni-sys-0.3.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "jni-sys" "0.3.1"
                "0n1j8fbz081w1igfrpc79n6vgm7h3ik34nziy5fjgq5nz7hm59j1"))

(define rust-jni-sys-0.4.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "jni-sys" "0.4.1"
                "1wlahx6f2zhczdjqyn8mk7kshb8x5vsd927sn3lvw41rrf47ldy6"))

(define rust-jni-sys-macros-0.4.1
  (crate-source "jni-sys-macros" "0.4.1"
                "0r32gbabrak15a7p487765b5wc0jcna2yv88mk6m1zjqyi1bkh1q"))

(define rust-jnix-0.5.3
  (crate-source "jnix" "0.5.3"
                "12k7ayxmgfczq6i9ydsy9xbxghbazh73p390204cpgxgnzqn1i33"))

(define rust-jnix-macros-0.4.1
  (crate-source "jnix-macros" "0.4.1"
                "1y7zp9rps4iv27zripljlkcq2vzw3z9w129l7z1qiblpdpz4sbq0"))

(define rust-jobserver-0.1.34
  (crate-source "jobserver" "0.1.34"
                "0cwx0fllqzdycqn4d6nb277qx5qwnmjdxdl0lxkkwssx77j3vyws"))

(define rust-js-sys-0.3.97
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "js-sys" "0.3.97"
                "1kyaxgn1sm5am98jb48aj5j7r7s98kdrab41la5wzys5q2a0r151"))

(define rust-json-canon-0.1.3
  (crate-source "json-canon" "0.1.3"
                "1nqfzidgikjfdxd851cpxn3yyclf82ai44qdrhddcixxl99y2yj4"))

(define rust-keccak-0.1.6
  (crate-source "keccak" "0.1.6"
                "0lynp77kk3xw5kbdnmpc4wzx3qqn9cyfvg5prfb3sfnfik4ww9nb"))

(define rust-kem-0.3.0-pre.0
  (crate-source "kem" "0.3.0-pre.0"
                "17r3vy8pmij1wqrps53lmvdzxfnhyzn6v5kz3aq6gnrp0d3lb1ib"))

(define rust-kqueue-1.1.1
  (crate-source "kqueue" "1.1.1"
                "0sjrsnza8zxr1zfpv6sa0zapd54kx9wlijrz9apqvs6wsw303hza"))

(define rust-kqueue-sys-1.0.4
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "kqueue-sys" "1.0.4"
                "12w3wi90y4kwis4k9g6fp0kqjdmc6l00j16g8mgbhac7vbzjb5pd"))

(define rust-lazy-static-1.5.0
  (crate-source "lazy_static" "1.5.0"
                "1zk6dqqni0193xg6iijh7i3i44sryglwgvx20spdvwk3r6sbrlmv"))

(define rust-leb128fmt-0.1.0
  (crate-source "leb128fmt" "0.1.0"
                "1chxm1484a0bly6anh6bd7a99sn355ymlagnwj3yajafnpldkv89"))

(define rust-libc-0.2.189
  (crate-source "libc" "0.2.189"
                "1whjfs375vlng2q6yrbzs73cvp5lm3w1n2gfqajb2vgf7zg3xbry"))

(define rust-libdbus-sys-0.2.7
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "libdbus-sys" "0.2.7"
                "0hzhq0dz6lfzmhsym9m95cfhjzrwq74qdg85xkpg2012sj4lg31j"))

(define rust-libloading-0.8.9
  (crate-source "libloading" "0.8.9"
                "0mfwxwjwi2cf0plxcd685yxzavlslz7xirss3b9cbrzyk4hv1i6p"))

(define rust-libloading-0.9.0
  (crate-source "libloading" "0.9.0"
                "0q4bvhp4kqy2v3bw4cn2bmyq73hskqd1ansa9125gfq5x0ns4k3m"))

(define rust-libm-0.2.16
  (crate-source "libm" "0.2.16"
                "10brh0a3qjmbzkr5mf5xqi887nhs5y9layvnki89ykz9xb1wxlmn"))

(define rust-libredox-0.1.16
  (crate-source "libredox" "0.1.16"
                "0v54zvgknag9310wcjykgv86pgq02qr3mzgkdg4r6m1k7ns3nbz0"))

(define rust-linkme-0.3.36
  (crate-source "linkme" "0.3.36"
                "1ks1mrhf4nc7vy9scfncsiqkv3vw7sn7jib8rbn8vyvkcga74cp8"))

(define rust-linkme-impl-0.3.36
  (crate-source "linkme-impl" "0.3.36"
                "0js4vz4223vdd1wm6imiwvqjxyy7wpgnwdxlcbz0hz9w80h9xm9j"))

(define rust-linux-raw-sys-0.4.15
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "linux-raw-sys" "0.4.15"
                "1aq7r2g7786hyxhv40spzf2nhag5xbw2axxc1k8z5k1dsgdm4v6j"))

(define rust-linux-raw-sys-0.12.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "linux-raw-sys" "0.12.1"
                "0lwasljrqxjjfk9l2j8lyib1babh2qjlnhylqzl01nihw14nk9ij"))

(define rust-litemap-0.8.2
  (crate-source "litemap" "0.8.2"
                "1w7628bc7wwcxc4n4s5kw0610xk06710nh2hn5kwwk2wa91z9nlj"))

(define rust-lock-api-0.4.14
  (crate-source "lock_api" "0.4.14"
                "0rg9mhx7vdpajfxvdjmgmlyrn20ligzqvn8ifmaz7dc79gkrjhr2"))

(define rust-log-0.4.33
  (crate-source "log" "0.4.33"
                "1bd9dmk22pxgnf0h0slba6rz99zb0a0b2mdhpk8p92bp26ycbvhc"))

(define rust-log-panics-2.1.0
  (crate-source "log-panics" "2.1.0"
                "0pxcq9f4jmcs2l9lgs6hj2w3ba80zzsj4zgnxi81h70r8s2xvyb8"))

(define rust-lru-slab-0.1.2
  (crate-source "lru-slab" "0.1.2"
                "0m2139k466qj3bnpk66bwivgcx3z88qkxvlzk70vd65jq373jaqi"))

(define rust-malloc-buf-0.0.6
  (crate-source "malloc_buf" "0.0.6"
                "1jqr77j89pwszv51fmnknzvd53i1nkmcr8rjrvcxhm4dx1zr1fv2"))

(define rust-managed-0.8.0
  (crate-source "managed" "0.8.0"
                "13b1j5gpm55jxk24qrbpc25j0ds47bkk9g83d04kp50ab9r8va0c"))

(define rust-matchers-0.2.0
  (crate-source "matchers" "0.2.0"
                "1sasssspdj2vwcwmbq3ra18d3qniapkimfcbr47zmx6750m5llni"))

(define rust-matchit-0.8.4
  (crate-source "matchit" "0.8.4"
                "1hzl48fwq1cn5dvshfly6vzkzqhfihya65zpj7nz7lfx82mgzqa7"))

(define rust-maybenot-2.2.2
  (crate-source "maybenot" "2.2.2"
                "1j1n91drps7xk86f4wr87s440njmhh548sm6bkmyyhgl8kb1wws4"))

(define rust-md-5-0.10.6
  (crate-source "md-5" "0.10.6"
                "1kvq5rnpm4fzwmyv5nmnxygdhhb2369888a06gdc9pxyrzh7x7nq"))

(define rust-memchr-2.8.0
  (crate-source "memchr" "2.8.0"
                "0y9zzxcqxvdqg6wyag7vc3h0blhdn7hkq164bxyx2vph8zs5ijpq"))

(define rust-memoffset-0.6.5
  (crate-source "memoffset" "0.6.5"
                "1kkrzll58a3ayn5zdyy9i1f1v3mx0xgl29x0chq614zazba638ss"))

(define rust-memoffset-0.9.1
  (crate-source "memoffset" "0.9.1"
                "12i17wh9a9plx869g7j4whf62xw68k5zd4k0k5nh6ys5mszid028"))

(define rust-mime-0.3.17
  (crate-source "mime" "0.3.17"
                "16hkibgvb9klh0w0jk5crr5xv90l3wlf77ggymzjmvl1818vnxv8"))

(define rust-minimal-lexical-0.2.1
  (crate-source "minimal-lexical" "0.2.1"
                "16ppc5g84aijpri4jzv14rvcnslvlpphbszc7zzp6vfkddf4qdb8"))

(define rust-miniz-oxide-0.8.9
  (crate-source "miniz_oxide" "0.8.9"
                "05k3pdg8bjjzayq3rf0qhpirq9k37pxnasfn4arbs17phqn6m9qz"))

(define rust-mio-1.2.0
  (crate-source "mio" "1.2.0"
                "1hanrh4fwsfkdqdaqfidz48zz1wdix23zwn3r2x78am0garfbdsh"))

(define rust-ml-kem-0.2.3
  (crate-source "ml-kem" "0.2.3"
                "13x1jcwsaixbr1ln2yg22gwqk4szx2vin0rj0a64jdacywyrpr4d"))

(define rust-mnl-0.3.1
  (crate-source "mnl" "0.3.1"
                "0rbh019lf9zjkmshv1sj5hwpakl31mpck392aybv06a44mib72jj"))

(define rust-mnl-sys-0.2.2
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "mnl-sys" "0.2.2"
                "0k0d3qfhiixxnvshf2xw1a036mgdxjnyg3nyrbrm7v8jmw3wdwx0"))

(define rust-mockito-1.7.2
  (crate-source "mockito" "1.7.2"
                "1h4jpghvhgcyybqbvhxkzjpq4sjl49n4q9vbqk7ikarcf4c0d0lh"))

(define rust-moka-0.12.15
  (crate-source "moka" "0.12.15"
                "0ijhgjfprcjkvrhgmm71m9gaph5lc9xjb3rwz4wyhbh42anjhwlm"))

(define rust-multimap-0.10.1
  (crate-source "multimap" "0.10.1"
                "1150lf0hjfjj4ksb8s3y0hl7a2nqzqlbh0is7vdym2iyjfrfr1qx"))

(define rust-native-windows-gui-1.0.13
  (crate-source "native-windows-gui" "1.0.13"
                "0m44lbslzvs04i4rgcphld23qlwf9zzlzmspgimyp3gnd6k06w2g"))

(define rust-natord-1.0.9
  (crate-source "natord" "1.0.9"
                "0z75spwag3ch20841pvfwhh3892i2z2sli4pzp1jgizbipdrd39h"))

(define rust-ndk-context-0.1.1
  (crate-source "ndk-context" "0.1.1"
                "12sai3dqsblsvfd1l1zab0z6xsnlha3xsfl7kagdnmj3an3jvc17"))

(define rust-ndk-sys-0.5.0+25.2.9519653
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "ndk-sys" "0.5.0+25.2.9519653"
                "14bnxww0f17xl8pyn6j5kpkl98snjl9lin8i7qv4zzb0vmlnf6cc"))

(define rust-neon-1.1.1
  (crate-source "neon" "1.1.1"
                "1qgil3pwhrrvlr09wfmxjwm9s8n1z7hsqf76l7ss6q4yqycd5hbl"))

(define rust-neon-macros-1.1.1
  (crate-source "neon-macros" "1.1.1"
                "1cbh5ghc8swss22hci6608v41cm2cw4n007lj0zrdz0pg1v477n3"))

(define rust-netlink-packet-core-0.8.1
  (crate-source "netlink-packet-core" "0.8.1"
                "1x707b3a579vr9p9hqdpjhrlfzhrq8zvj9n9w90h3jwlhfvwnqrl"))

(define rust-netlink-packet-route-0.30.0
  (crate-source "netlink-packet-route" "0.30.0"
                "14jhj28nj1hrymzmx4g0qqi3fgm4m4s15zmvmi7ana305xhik2dy"))

(define rust-netlink-proto-0.12.0
  (crate-source "netlink-proto" "0.12.0"
                "0a11h4jvzbzzdcvrgpcpy23w74x67jj6x2fpxr3hwhqiw4716pdn"))

(define rust-netlink-sys-0.8.8
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "netlink-sys" "0.8.8"
                "1bizb26qgk765vg7qyrnwywdwsqzjz68a6s93m4wqsgs23nk0v6d"))

(define rust-nftnl-0.9.2
  (crate-source "nftnl" "0.9.2"
                "0fxv9gz8037bddp54b7zkwk28ixrds3j93bjbggc71r9rwp4gjir"))

(define rust-nftnl-sys-0.6.4
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "nftnl-sys" "0.6.4"
                "1979gxhdjzaiwinr42m5a295a6jy896n6m6l9y56mshyr2s2iyng"))

(define rust-nix-0.30.1
  (crate-source "nix" "0.30.1"
                "1dixahq9hk191g0c2ydc0h1ppxj0xw536y6rl63vlnp06lx3ylkl"))

(define rust-nix-0.31.3
  (crate-source "nix" "0.31.3"
                "0gbwnjfny9rq9hl5bz4ry520n9rnfknna4bg88n66f7zx3yx486g"))

(define rust-no-std-net-0.6.0
  (crate-source "no-std-net" "0.6.0"
                "0ravflgyh0q2142gjdz9iav5yqci3ga7gbnk4mmfcnqkrq54lya3"))

(define rust-nom-7.1.3
  (crate-source "nom" "7.1.3"
                "0jha9901wxam390jcf5pfa0qqfrgh8li787jx2ip0yk5b8y9hwyj"))

(define rust-notify-8.2.0
  (crate-source "notify" "8.2.0"
                "1hrb83451vm5cpjw83nz5skgwjg5ara28zq8nxsqbzsif690fgad"))

(define rust-notify-types-2.1.0
  (crate-source "notify-types" "2.1.0"
                "0yj710mxd4lsaz4hq7601mh6xb02awb8hg4z6lvh76ik1vpczf22"))

(define rust-nu-ansi-term-0.50.3
  (crate-source "nu-ansi-term" "0.50.3"
                "1ra088d885lbd21q1bxgpqdlk1zlndblmarn948jz2a40xsbjmvr"))

(define rust-num-bigint-0.4.6
  (crate-source "num-bigint" "0.4.6"
                "1f903zd33i6hkjpsgwhqwi2wffnvkxbn6rv4mkgcjcqi7xr4zr55"))

(define rust-num-conv-0.2.1
  (crate-source "num-conv" "0.2.1"
                "0rqrr29brafaa2za352pbmhkk556n7f8z9rrkgmjp1idvdl3fry6"))

(define rust-num-integer-0.1.46
  (crate-source "num-integer" "0.1.46"
                "13w5g54a9184cqlbsq80rnxw4jj4s0d8wv75jsq5r2lms8gncsbr"))

(define rust-num-traits-0.2.19
  (crate-source "num-traits" "0.2.19"
                "0h984rhdkkqd4ny9cif7y2azl3xdfb7768hb9irhpsch4q3gq787"))

(define rust-objc-0.2.7
  (crate-source "objc" "0.2.7"
                "1cbpf6kz8a244nn1qzl3xyhmp05gsg4n313c9m3567625d3innwi"))

(define rust-objc-sys-0.3.5
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "objc-sys" "0.3.5"
                "0423gry7s3rmz8s3pzzm1zy5mdjif75g6dbzc2lf2z0c77fipffd"))

(define rust-objc2-0.5.2
  (crate-source "objc2" "0.5.2"
                "015qa2d3vh7c1j2736h5wjrznri7x5ic35vl916c22gzxva8b9s6"))

(define rust-objc2-0.6.4
  (crate-source "objc2" "0.6.4"
                "17x8qpl512frscfqbmgjr20kg3y4r0xdqxphja17dz5f0znsh4is"))

(define rust-objc2-app-kit-0.2.2
  (crate-source "objc2-app-kit" "0.2.2"
                "1zqyi5l1bm26j1bgmac9783ah36m5kcrxlqp5carglnpwgcrms74"))

(define rust-objc2-cloud-kit-0.3.2
  (crate-source "objc2-cloud-kit" "0.3.2"
                "0714xrydi9wvh25s2110sjfpx9mv4xs9p4ys71q8fhxvh3c79bbk"))

(define rust-objc2-core-data-0.2.2
  (crate-source "objc2-core-data" "0.2.2"
                "1vvk8zjylfjjj04dzawydmqqz5ajvdkhf22cnb07ihbiw14vyzv1"))

(define rust-objc2-core-data-0.3.2
  (crate-source "objc2-core-data" "0.3.2"
                "1ylqsa6hpma7k4090pkil8b7c0i8dcxnh46zwhnfidgv7rjjlh0b"))

(define rust-objc2-core-foundation-0.3.2
  (crate-source "objc2-core-foundation" "0.3.2"
                "0dnmg7606n4zifyjw4ff554xvjmi256cs8fpgpdmr91gckc0s61a"))

(define rust-objc2-core-graphics-0.3.2
  (crate-source "objc2-core-graphics" "0.3.2"
                "01x8413pxq0m5rwidlaczni8v5cz9dc3xqzq8l9zlpl9cv8cj8p0"))

(define rust-objc2-core-image-0.2.2
  (crate-source "objc2-core-image" "0.2.2"
                "102csfb82zi2sbzliwsfd589ckz0gysf7y6434c9zj97lmihj9jm"))

(define rust-objc2-core-image-0.3.2
  (crate-source "objc2-core-image" "0.3.2"
                "01phi7cx2k32a8x45qr0y1623l2b8gg764c6isgj15rbinrn7mg5"))

(define rust-objc2-core-location-0.3.2
  (crate-source "objc2-core-location" "0.3.2"
                "02908pp1knq64wjq07zd6q2z77qppdpd7l2z0by77jabw8a74d6a"))

(define rust-objc2-core-text-0.3.2
  (crate-source "objc2-core-text" "0.3.2"
                "0bfrzqxhgh4y1imk1bb9g0v28g0frigls6hnc942npfj93xhvphc"))

(define rust-objc2-encode-4.1.0
  (crate-source "objc2-encode" "4.1.0"
                "0cqckp4cpf68mxyc2zgnazj8klv0z395nsgbafa61cjgsyyan9gg"))

(define rust-objc2-foundation-0.2.2
  (crate-source "objc2-foundation" "0.2.2"
                "1a6mi77jsig7950vmx9ydvsxaighzdiglk5d229k569pvajkirhf"))

(define rust-objc2-foundation-0.3.2
  (crate-source "objc2-foundation" "0.3.2"
                "0wijkxzzvw2xkzssds3fj8279cbykz2rz9agxf6qh7y2agpsvq73"))

(define rust-objc2-io-surface-0.3.2
  (crate-source "objc2-io-surface" "0.3.2"
                "07fqx4fmwydf2arrc4xs4awv7zyzzxh60fyqdfmrpm9n148qh1qq"))

(define rust-objc2-metal-0.2.2
  (crate-source "objc2-metal" "0.2.2"
                "1mmdga66qpxrcfq3gxxhysfx3zg1hpx4z886liv3j0pnfq9bl36x"))

(define rust-objc2-quartz-core-0.2.2
  (crate-source "objc2-quartz-core" "0.2.2"
                "0ynw8819c36l11rim8n0yzk0fskbzrgaqayscyqi8swhzxxywaz4"))

(define rust-objc2-quartz-core-0.3.2
  (crate-source "objc2-quartz-core" "0.3.2"
                "07vzaf6y1lk7zygkgvpp23mm19ipdm9yq8af22gvywdkaa23bhcn"))

(define rust-objc2-security-0.3.2
  (crate-source "objc2-security" "0.3.2"
                "0nl9dnnjj0z6yaw5s70szkd62acbgmxgg44km6syilcv20vy37vh"))

(define rust-objc2-service-management-0.3.2
  (crate-source "objc2-service-management" "0.3.2"
                "1s35zq8vdjh3q4km3sac16w0kbzajnjpl8dirqin1k2rd4nn84xj"))

(define rust-objc2-ui-kit-0.3.2
  (crate-source "objc2-ui-kit" "0.3.2"
                "08mbgqg8pffclyxpz2lr8r1fv8wn2i4m1k6bk1s5fvy06f766zfq"))

(define rust-objc2-user-notifications-0.3.2
  (crate-source "objc2-user-notifications" "0.3.2"
                "0gk1frfj875pkbz3ncs8swvjgdipz3vwq5l42vd3rxzypf615ycx"))

(define rust-objc-id-0.1.1
  (crate-source "objc_id" "0.1.1"
                "0fq71hnp2sdblaighjc82yrac3adfmqzhpr11irhvdfp9gdlsbf9"))

(define rust-once-cell-1.21.4
  (crate-source "once_cell" "1.21.4"
                "0l1v676wf71kjg2khch4dphwh1jp3291ffiymr2mvy1kxd5kwz4z"))

(define rust-once-cell-polyfill-1.70.2
  (crate-source "once_cell_polyfill" "1.70.2"
                "1zmla628f0sk3fhjdjqzgxhalr2xrfna958s632z65bjsfv8ljrq"))

(define rust-oorandom-11.1.5
  (crate-source "oorandom" "11.1.5"
                "07mlf13z453fq01qff38big1lh83j8l6aaglf63ksqzzqxc0yyfn"))

(define rust-opaque-debug-0.3.1
  (crate-source "opaque-debug" "0.3.1"
                "10b3w0kydz5jf1ydyli5nv10gdfp97xh79bgz327d273bs46b3f0"))

(define rust-option-ext-0.2.0
  (crate-source "option-ext" "0.2.0"
                "0zbf7cx8ib99frnlanpyikm1bx8qn8x602sw1n7bg6p9x94lyx04"))

(define rust-ordered-stream-0.2.0
  (crate-source "ordered-stream" "0.2.0"
                "0l0xxp697q7wiix1gnfn66xsss7fdhfivl2k7bvpjs4i3lgb18ls"))

(define rust-os-info-3.14.0
  (crate-source "os_info" "3.14.0"
                "09122f72665q30qsaq4r6c57zpphhgjdlvr3d6ixc02sb4bjl0p4"))

(define rust-papaya-0.2.4
  (crate-source "papaya" "0.2.4"
                "1dqrr8bliqk60vzpjrlyrc5qha5dy0a3fr26f2d4c0ccscyf0zlr"))

(define rust-paranoid-android-0.2.2
  (crate-source "paranoid-android" "0.2.2"
                "1p5a1jn373r67j4zgxr2f3qq5gjpfrkm8wkfipil66rp7pb9a5qh"))

(define rust-parking-2.2.1
  (crate-source "parking" "2.2.1"
                "1fnfgmzkfpjd69v4j9x737b1k8pnn054bvzcn5dm3pkgq595d3gk"))

(define rust-parking-lot-0.12.5
  (crate-source "parking_lot" "0.12.5"
                "06jsqh9aqmc94j2rlm8gpccilqm6bskbd67zf6ypfc0f4m9p91ck"))

(define rust-parking-lot-core-0.9.12
  (crate-source "parking_lot_core" "0.9.12"
                "1hb4rggy70fwa1w9nb0svbyflzdc69h047482v2z3sx2hmcnh896"))

(define rust-paste-1.0.15
  (crate-source "paste" "1.0.15"
                "02pxffpdqkapy292harq6asfjvadgp1s005fip9ljfsn9fvxgh2p"))

(define rust-pastey-0.1.1
  (crate-source "pastey" "0.1.1"
                "1v389jkifv757903flrrps67dvc6q6giwlyx3xi33hcfjmgjxyrm"))

(define rust-pcap-2.4.0
  (crate-source "pcap" "2.4.0"
                "0xbx8nq30szyv0agn6jxlrldxajncn29zcxmcg2iwryw5p6fxlmv"))

(define rust-pcap-file-2.0.0
  (crate-source "pcap-file" "2.0.0"
                "1cni4pljw1hbk160sk5al2d2rlcr2x84hv5p6ygqy1bvflwz3h8z"))

(define rust-percent-encoding-2.3.2
  (crate-source "percent-encoding" "2.3.2"
                "083jv1ai930azvawz2khv7w73xh8mnylk7i578cifndjn5y64kwv"))

(define rust-petgraph-0.8.3
  (crate-source "petgraph" "0.8.3"
                "0mblnaqbx1y20h5y7pz6y11hk9jjk6k87lsmn7jxaq3hm67ba0c7"))

(define rust-pfctl-0.7.0
  (crate-source "pfctl" "0.7.0"
                "1aan6ia6d1lim6d1xzlk6np4xmv9rxagyz2igyjvvdjq6w3jqkcl"))

(define rust-phf-0.13.1
  (crate-source "phf" "0.13.1"
                "1pzswx5gdglgjgp4azyzwyr4gh031r0kcnpqq6jblga72z3jsmn1"))

(define rust-phf-codegen-0.13.1
  (crate-source "phf_codegen" "0.13.1"
                "1qfnsl2hiny0yg4lwn888xla5iwccszgxnx8dhbwl6s2h2fpzaj9"))

(define rust-phf-generator-0.13.1
  (crate-source "phf_generator" "0.13.1"
                "0dwpp11l41dy9mag4phkyyvhpf66lwbp79q3ik44wmhyfqxcwnhk"))

(define rust-phf-shared-0.13.1
  (crate-source "phf_shared" "0.13.1"
                "0rpjchnswm0x5l4mz9xqfpw0j4w68sjvyqrdrv13h7lqqmmyyzz5"))

(define rust-pin-project-1.1.11
  (crate-source "pin-project" "1.1.11"
                "05zm3y3bl83ypsr6favxvny2kys4i19jiz1y18ylrbxwsiz9qx7i"))

(define rust-pin-project-internal-1.1.11
  (crate-source "pin-project-internal" "1.1.11"
                "1ik4mpb92da75inmjvxf2qm61vrnwml3x24wddvrjlqh1z9hxcnr"))

(define rust-pin-project-lite-0.2.17
  (crate-source "pin-project-lite" "0.2.17"
                "1kfmwvs271si96zay4mm8887v5khw0c27jc9srw1a75ykvgj54x8"))

(define rust-piper-0.2.5
  (crate-source "piper" "0.2.5"
                "1hd3j94mw5dwc457gs9ssb2r5b9iipywndf5srqx7pj38jd4fdf8"))

(define rust-pkcs8-0.10.2
  (crate-source "pkcs8" "0.10.2"
                "1dx7w21gvn07azszgqd3ryjhyphsrjrmq5mmz1fbxkj5g0vv4l7r"))

(define rust-pkg-config-0.3.33
  (crate-source "pkg-config" "0.3.33"
                "17jnqmcbxsnwhg9gjf0nh6dj5k0x3hgwi3mb9krjnmfa9v435w8r"))

(define rust-plain-0.2.3
  (crate-source "plain" "0.2.3"
                "19n1xbxb4wa7w891268bzf6cbwq4qvdb86bik1z129qb0xnnnndl"))

(define rust-plotters-0.3.7
  (crate-source "plotters" "0.3.7"
                "0ixpy9svpmr2rkzkxvvdpysjjky4gw104d73n7pi2jbs7m06zsss"))

(define rust-plotters-backend-0.3.7
  (crate-source "plotters-backend" "0.3.7"
                "0ahpliim4hrrf7d4ispc2hwr7rzkn6d6nf7lyyrid2lm28yf2hnz"))

(define rust-plotters-svg-0.3.7
  (crate-source "plotters-svg" "0.3.7"
                "0w56sxaa2crpasa1zj0bhxzihlapqfkncggavyngg0w86anf5fji"))

(define rust-pnet-base-0.34.0
  (crate-source "pnet_base" "0.34.0"
                "0k2z3jh6vw99bwl0ckpsd142n4yiscza1bmj3b86i2xk7bxzck7y"))

(define rust-pnet-base-0.35.0
  (crate-source "pnet_base" "0.35.0"
                "1xxj1ym32zqmy7m7ciiisv513rk9qis3p6x4mgrnmwbx0va91hgz"))

(define rust-pnet-macros-0.34.0
  (crate-source "pnet_macros" "0.34.0"
                "010qhwkw597pzmiqmphnf8fl11pwlp5sa2nai90a017fkr4ig2v8"))

(define rust-pnet-macros-0.35.0
  (crate-source "pnet_macros" "0.35.0"
                "0qy8f65cybbidzl1dfqjc5hk7l951k9y7j0b1d40ma71dv45lchk"))

(define rust-pnet-macros-support-0.34.0
  (crate-source "pnet_macros_support" "0.34.0"
                "0mhg0dzdxg6lkpx3z60c6nc39dkq9jz1n8hgmf77zlsb5yvjbagf"))

(define rust-pnet-macros-support-0.35.0
  (crate-source "pnet_macros_support" "0.35.0"
                "1arl67djpslh9c99naf8cp32m63bqlgrn10303fhkmc54napmmpf"))

(define rust-pnet-packet-0.34.0
  (crate-source "pnet_packet" "0.34.0"
                "1flhxbwgw9348c955hc0mi6h7ma2qgdqiqm871xgxdwnaf10b859"))

(define rust-pnet-packet-0.35.0
  (crate-source "pnet_packet" "0.35.0"
                "03snjv5nl65vqxyvvf31hjgc701ssfkk1fin631gqddnzanyp5jc"))

(define rust-polling-3.11.0
  (crate-source "polling" "3.11.0"
                "0622qfbxi3gb0ly2c99n3xawp878fkrd1sl83hjdhisx11cly3jx"))

(define rust-poly1305-0.8.0
  (crate-source "poly1305" "0.8.0"
                "1grs77skh7d8vi61ji44i8gpzs3r9x7vay50i6cg8baxfa8bsnc1"))

(define rust-polyval-0.6.2
  (crate-source "polyval" "0.6.2"
                "09gs56vm36ls6pyxgh06gw2875z2x77r8b2km8q28fql0q6yc7wx"))

(define rust-portable-atomic-1.13.1
  (crate-source "portable-atomic" "1.13.1"
                "0j8vlar3n5acyigq8q6f4wjx3k3s5yz0rlpqrv76j73gi5qr8fn3"))

(define rust-potential-utf-0.1.4
  (crate-source "potential_utf" "0.1.4"
                "0xxg0pkfpq299wvwln409z4fk80rbv55phh3f1jhjajy5x1ljfdp"))

(define rust-powerfmt-0.2.0
  (crate-source "powerfmt" "0.2.0"
                "14ckj2xdpkhv3h6l5sdmb9f1d57z8hbfpdldjc2vl5givq2y77j3"))

(define rust-ppv-lite86-0.2.21
  (crate-source "ppv-lite86" "0.2.21"
                "1abxx6qz5qnd43br1dd9b2savpihzjza8gb4fbzdql1gxp2f7sl5"))

(define rust-pqcrypto-hqc-0.2.2
  (crate-source "pqcrypto-hqc" "0.2.2"
                "03qaq9w98788wjz0f7krwy3bk1vr4fvpklsbb9i7wzkbwaa3vda1"))

(define rust-pqcrypto-internals-0.2.11
  (crate-source "pqcrypto-internals" "0.2.11"
                "07dn49zva63sbgcsgilcdbksjys901ixazyaj712mgvwyb52d8xl"))

(define rust-pqcrypto-traits-0.3.5
  (crate-source "pqcrypto-traits" "0.3.5"
                "1fsigdrjrwkyc00da0y2z1n626lnak268wfjsxl9xvafcp3m3s4l"))

(define rust-prefix-trie-0.8.3
  (crate-source "prefix-trie" "0.8.3"
                "0rjrpdkgg4xhq5ln01hdj4856zymqiy8370z18jgrlqj80hn3xch"))

(define rust-prettyplease-0.2.37
  (crate-source "prettyplease" "0.2.37"
                "0azn11i1kh0byabhsgab6kqs74zyrg69xkirzgqyhz6xmjnsi727"))

(define rust-proc-macro-crate-3.5.0
  (crate-source "proc-macro-crate" "3.5.0"
                "0kv1g1d1zjwxlgcaba2qlshzyy32j03xic8rskqlcr5mnblsfyz6"))

(define rust-proc-macro2-1.0.103
  (crate-source "proc-macro2" "1.0.103"
                "1s29bz20xl2qk5ffs2mbdqknaj43ri673dz86axdbf47xz25psay"))

(define rust-proptest-1.11.0
  (crate-source "proptest" "1.11.0"
                "0i27rr5drw4ic8hjzx6i1c6q8s7kmsgpfmzy4m80ys2c6k1gqiab"))

(define rust-prost-0.14.3
  (crate-source "prost" "0.14.3"
                "0s057z9nzggzy7x4bbsiar852hg7zb81f4z4phcdb0ig99971snj"))

(define rust-prost-build-0.14.3
  (crate-source "prost-build" "0.14.3"
                "1rrf4rs74schd38jyaxglymi66vxzzg6hki00fdq7nkf0pbkng9l"))

(define rust-prost-derive-0.14.3
  (crate-source "prost-derive" "0.14.3"
                "02zvva6kb0pfvlyc4nac6gd37ncjrs8jq5scxcq4nbqkc8wh5ii7"))

(define rust-prost-types-0.14.3
  (crate-source "prost-types" "0.14.3"
                "1mrxrciryfgi6a0vmrgyj3g27r9hdhlgwkq71cgv3icbvg5w94c9"))

(define rust-quick-error-1.2.3
  (crate-source "quick-error" "1.2.3"
                "1q6za3v78hsspisc197bg3g7rpc989qycy8ypr8ap8igv10ikl51"))

(define rust-quick-xml-0.41.0
  (crate-source "quick-xml" "0.41.0"
                "1h9y8zry34r3mxfd5vqfj50vvvzvri4kzbx5d657jkqjalg4aq76"))

(define rust-quinn-0.11.9
  (crate-source "quinn" "0.11.9"
                "086gzj666dr3slmlynkvxlndy28hahgl361d6bf93hk3i6ahmqmr"))

(define rust-quinn-proto-0.11.15
  (crate-source "quinn-proto" "0.11.15"
                "0gknq1m2b9g3fsndka2gn7f2k45vb0zdssrh1qpkql7cbdf97jsg"))

(define rust-quinn-udp-0.5.14
  (crate-source "quinn-udp" "0.5.14"
                "1gacawr17a2zkyri0r3m0lc9spzmxbq1by3ilyb8v2mdvjhcdpmd"))

(define rust-quote-1.0.40
  (crate-source "quote" "1.0.40"
                "1394cxjg6nwld82pzp2d4fp6pmaz32gai1zh9z5hvh0dawww118q"))

(define rust-r-efi-5.3.0
  (crate-source "r-efi" "5.3.0"
                "03sbfm3g7myvzyylff6qaxk4z6fy76yv860yy66jiswc2m6b7kb9"))

(define rust-r-efi-6.0.0
  (crate-source "r-efi" "6.0.0"
                "1gyrl2k5fyzj9k7kchg2n296z5881lg7070msabid09asp3wkp7q"))

(define rust-rand-0.9.4
  (crate-source "rand" "0.9.4"
                "1sknbxgs6nfg0nxdd7689lwbyr2i4vaswchrv4b34z8vpc3azia4"))

(define rust-rand-0.10.1
  (crate-source "rand" "0.10.1"
                "01r22vdpw6z69jzy6khnyr0ljq9im337h4j0mkyz26lnqyyfis6j"))

(define rust-rand-chacha-0.9.0
  (crate-source "rand_chacha" "0.9.0"
                "1jr5ygix7r60pz0s1cv3ms1f6pd1i9pcdmnxzzhjc3zn3mgjn0nk"))

(define rust-rand-core-0.6.4
  (crate-source "rand_core" "0.6.4"
                "0b4j2v4cb5krak1pv6kakv4sz6xcwbrmy2zckc32hsigbrwy82zc"))

(define rust-rand-core-0.9.5
  (crate-source "rand_core" "0.9.5"
                "0g6qc5r3f0hdmz9b11nripyp9qqrzb0xqk9piip8w8qlvqkcibvn"))

(define rust-rand-core-0.10.1
  (crate-source "rand_core" "0.10.1"
                "0s9wiacxrr100icl7i41308gcj85nlcclrc5jx1jd6p10dhigf33"))

(define rust-rand-distr-0.5.1
  (crate-source "rand_distr" "0.5.1"
                "0qvlzxq4a2rvrf3wq0xq1bfw8iy9zqm6jlmbywqzld6g1paib1ka"))

(define rust-rand-xorshift-0.4.0
  (crate-source "rand_xorshift" "0.4.0"
                "0njsn25pis742gb6b89cpq7jp48v9n23a9fvks10yczwks8n4fai"))

(define rust-rayon-1.12.0
  (crate-source "rayon" "1.12.0"
                "0vcj63xgnk72c30vdrak7dhl53snnaqv9x2faf1d94hzg1kb2fgv"))

(define rust-rayon-core-1.13.0
  (crate-source "rayon-core" "1.13.0"
                "14dbr0sq83a6lf1rfjq5xdpk5r6zgzvmzs5j6110vlv2007qpq92"))

(define rust-redox-syscall-0.5.18
  (crate-source "redox_syscall" "0.5.18"
                "0b9n38zsxylql36vybw18if68yc9jczxmbyzdwyhb9sifmag4azd"))

(define rust-redox-users-0.5.2
  (crate-source "redox_users" "0.5.2"
                "1b17q7gf7w8b1vvl53bxna24xl983yn7bd00gfbii74bcg30irm4"))

(define rust-regex-1.12.3
  (crate-source "regex" "1.12.3"
                "0xp2q0x7ybmpa5zlgaz00p8zswcirj9h8nry3rxxsdwi9fhm81z1"))

(define rust-regex-automata-0.4.14
  (crate-source "regex-automata" "0.4.14"
                "13xf7hhn4qmgfh784llcp2kzrvljd13lb2b1ca0mwnf15w9d87bf"))

(define rust-regex-lite-0.1.9
  (crate-source "regex-lite" "0.1.9"
                "0wzr31ysmiy9sw48i36raqbm1iyk2xnq0lp4zbs6fzi47p3k9f6a"))

(define rust-regex-syntax-0.8.10
  (crate-source "regex-syntax" "0.8.10"
                "02jx311ka0daxxc7v45ikzhcl3iydjbbb0mdrpc1xgg8v7c7v2fw"))

(define rust-reqwest-0.12.28
  (crate-source "reqwest" "0.12.28"
                "0iqidijghgqbzl3bjg5hb4zmigwa4r612bgi0yiq0c90b6jkrpgd"))

(define rust-resolv-conf-0.7.6
  (crate-source "resolv-conf" "0.7.6"
                "1ivhckfhn7zksvid506w8dhrs001cix0mbp45l23i3fb90dis1hy"))

(define rust-ring-0.17.14
  (crate-source "ring" "0.17.14"
                "1dw32gv19ccq4hsx3ribhpdzri1vnrlcfqb2vj41xn4l49n9ws54"))

(define rust-ring-compat-0.8.0
  (crate-source "ring-compat" "0.8.0"
                "1m2vvmbg607f55afx75b9kxbyx6b5wqvhhfv2445z08b2np7pknc"))

(define rust-rs-release-0.1.11
  (crate-source "rs-release" "0.1.11"
                "0jy9c8bkbi8vsmgb1wyj9f7k1f1pvqxb433rwcbxr6frwj96h11k"))

(define rust-rtnetlink-0.21.0
  (crate-source "rtnetlink" "0.21.0"
                "112pr9qkg7w7v27y5fp7plj45ab0090c16vzc4vz78hgf57zh6fw"))

(define rust-rustc-hash-2.1.2
  (crate-source "rustc-hash" "2.1.2"
                "1gjdc5bw9982cj176jvgz9rrqf9xvr1q1ddpzywf5qhs7yzhlc4l"))

(define rust-rustc-version-0.4.1
  (crate-source "rustc_version" "0.4.1"
                "14lvdsmr5si5qbqzrajgb6vfn69k0sfygrvfvr2mps26xwi3mjyg"))

(define rust-rustix-0.38.44
  (crate-source "rustix" "0.38.44"
                "0m61v0h15lf5rrnbjhcb9306bgqrhskrqv7i1n0939dsw8dbrdgx"))

(define rust-rustix-1.1.4
  (crate-source "rustix" "1.1.4"
                "14511f9yjqh0ix07xjrjpllah3325774gfwi9zpq72sip5jlbzmn"))

(define rust-rustls-0.23.40
  (crate-source "rustls" "0.23.40"
                "12qnv3ag4wrw7aj8jng74kgrilpjm2b1rfcjaac8h691frccv1pg"))

(define rust-rustls-pki-types-1.14.1
  (crate-source "rustls-pki-types" "1.14.1"
                "1a9pr54y0f3qr97bxpd3ahjldq0gqdld0h799xbnwdzbwxx1k9rh"))

(define rust-rustls-webpki-0.103.13
  (crate-source "rustls-webpki" "0.103.13"
                "0vkm7z9pnxz5qz66p2kmyy2pwx0g4jnsbqk5xzfhs4czcjl2ki31"))

(define rust-rustversion-1.0.22
  (crate-source "rustversion" "1.0.22"
                "0vfl70jhv72scd9rfqgr2n11m5i9l1acnk684m2w83w0zbqdx75k"))

(define rust-rusty-fork-0.3.1
  (crate-source "rusty-fork" "0.3.1"
                "1qkf9rvz2irb1wlbkrhrns8n9hnax48z1lgql5nqyr2fyagzfsyc"))

(define rust-ryu-1.0.23
  (crate-source "ryu" "1.0.23"
                "0zs70sg00l2fb9jwrf6cbkdyscjs53anrvai2hf7npyyfi5blx4p"))

(define rust-ryu-js-0.2.2
  (crate-source "ryu-js" "0.2.2"
                "0zqf0ypy6dl26bz4aigqvrvn6wfqx4iy9mi2i9km6kgdphkgq635"))

(define rust-safelog-0.8.2
  (crate-source "safelog" "0.8.2"
                "0wv5z43b5i3bl80pidw64r1wyg9ixdlcjc10daqb2q9cv3h0gacp"))

(define rust-same-file-1.0.6
  (crate-source "same-file" "1.0.6"
                "00h5j1w87dmhnvbv9l8bic3y7xxsnjmssvifw2ayvgx9mb1ivz4k"))

(define rust-scopeguard-1.2.0
  (crate-source "scopeguard" "1.2.0"
                "0jcz9sd47zlsgcnm1hdw0664krxwb5gczlif4qngj2aif8vky54l"))

(define rust-scroll-0.12.0
  (crate-source "scroll" "0.12.0"
                "19mix9vm4k23jkknpgbi0ylmhpf2hnlpzzrfj9wqcj88lj55kf3a"))

(define rust-scroll-derive-0.12.1
  (crate-source "scroll_derive" "0.12.1"
                "0gb89b1yr8a6jwp4rcm00xqry6ajvmfywsm7bf5f42a686yfm0qp"))

(define rust-sealed-0.6.0
  (crate-source "sealed" "0.6.0"
                "01y1mf4f4j6d2x5307gcvagkkz5jwz2w2jdlf3k5bm93xb2niy92"))

(define rust-seize-0.5.1
  (crate-source "seize" "0.5.1"
                "0885zlin3ma34hhqs7q3lchymi4niyl110x7dvvzb8nkvy3gnmav"))

(define rust-semver-1.0.28
  (crate-source "semver" "1.0.28"
                "1kaimrpy876bcgi8bfj0qqfxk77zm9iz2zhn1hp9hj685z854y4a"))

(define rust-send-wrapper-0.6.0
  (crate-source "send_wrapper" "0.6.0"
                "0wrxzsh9fzgkkkms621ydnz8mj30ilyq299a8cf65jn1y72hw2yd"))

(define rust-sendfd-0.4.4
  (crate-source "sendfd" "0.4.4"
                "0nvldmy7mzpvcsjrpafklxl1pvx912q0dvpk3q6anr5wn7avz0xi"))

(define rust-serde-1.0.228
  (crate-source "serde" "1.0.228"
                "17mf4hhjxv5m90g42wmlbc61hdhlm6j9hwfkpcnd72rpgzm993ls"))

(define rust-serde-core-1.0.228
  (crate-source "serde_core" "1.0.228"
                "1bb7id2xwx8izq50098s5j2sqrrvk31jbbrjqygyan6ask3qbls1"))

(define rust-serde-derive-1.0.228
  (crate-source "serde_derive" "1.0.228"
                "0y8xm7fvmr2kjcd029g9fijpndh8csv5m20g4bd76w8qschg4h6m"))

(define rust-serde-json-1.0.151
  (crate-source "serde_json" "1.0.151"
                "051zww7lvpw147vvwss1ng6w587qyrkzg75fvj08q2dfrmgbahf8"))

(define rust-serde-repr-0.1.20
  (crate-source "serde_repr" "0.1.20"
                "1755gss3f6lwvv23pk7fhnjdkjw7609rcgjlr8vjg6791blf6php"))

(define rust-serde-spanned-0.6.9
  (crate-source "serde_spanned" "0.6.9"
                "18vmxq6qfrm110caszxrzibjhy2s54n1g5w1bshxq9kjmz7y0hdz"))

(define rust-serde-urlencoded-0.7.1
  (crate-source "serde_urlencoded" "0.7.1"
                "1zgklbdaysj3230xivihs30qi5vkhigg323a9m62k8jwf4a1qjfk"))

(define rust-sha1-0.10.6
  (crate-source "sha1" "0.10.6"
                "1fnnxlfg08xhkmwf2ahv634as30l1i3xhlhkvxflmasi5nd85gz3"))

(define rust-sha2-0.10.9
  (crate-source "sha2" "0.10.9"
                "10xjj843v31ghsksd9sl9y12qfc48157j1xpb8v1ml39jy0psl57"))

(define rust-sha256-1.6.0
  (crate-source "sha256" "1.6.0"
                "1xn86nlyq9mr4a8ybfw3z3275rnh58mb83phjfbp1sxxca2zr07q"))

(define rust-sha3-0.10.9
  (crate-source "sha3" "0.10.9"
                "0x1qv415b59x9vw4afr3fh98bcca9z6pg1yg6i05lhax6hl71zbp"))

(define rust-shadowsocks-1.24.0
  (crate-source "shadowsocks" "1.24.0"
                "1r6lr8m4nnkwi0fxygyjn38z3z9x5j2nq6r1iv4z7b2mknzk2a28"))

(define rust-shadowsocks-crypto-0.6.2
  (crate-source "shadowsocks-crypto" "0.6.2"
                "199c5s5h71w41isav41qzfcbm3zgspjbkhy1ncd1qvsq2wyql0rx"))

(define rust-sharded-slab-0.1.7
  (crate-source "sharded-slab" "0.1.7"
                "1xipjr4nqsgw34k7a2cgj9zaasl2ds6jwn89886kww93d32a637l"))

(define rust-shlex-1.3.0
  (crate-source "shlex" "1.3.0"
                "0r1y6bv26c1scpxvhg2cabimrmwgbp4p3wy6syj9n0c4s3q2znhg"))

(define rust-signal-hook-registry-1.4.8
  (crate-source "signal-hook-registry" "1.4.8"
                "06vc7pmnki6lmxar3z31gkyg9cw7py5x9g7px70gy2hil75nkny4"))

(define rust-signature-2.2.0
  (crate-source "signature" "2.2.0"
                "1pi9hd5vqfr3q3k49k37z06p7gs5si0in32qia4mmr1dancr6m3p"))

(define rust-simd-adler32-0.3.9
  (crate-source "simd-adler32" "0.3.9"
                "0532ysdwcvzyp2bwpk8qz0hijplcdwpssr5gy5r7qwqqy5z5qgbh"))

(define rust-simd-cesu8-1.1.1
  (crate-source "simd_cesu8" "1.1.1"
                "0crcbgvyycmazji2vqj9vxn2czdyl3gxmicp4xqdzkc7pdbh3ycl"))

(define rust-simdutf8-0.1.5
  (crate-source "simdutf8" "0.1.5"
                "0vmpf7xaa0dnaikib5jlx6y4dxd3hxqz6l830qb079g7wcsgxag3"))

(define rust-similar-2.7.0
  (crate-source "similar" "2.7.0"
                "1aidids7ymfr96s70232s6962v5g9l4zwhkvcjp4c5hlb6b5vfxv"))

(define rust-siphasher-1.0.2
  (crate-source "siphasher" "1.0.2"
                "13k7cfbpcm8qgj9p2n8dwg9skv9s0hxk5my30j5chy1p4l78bamj"))

(define rust-slab-0.4.12
  (crate-source "slab" "0.4.12"
                "1xcwik6s6zbd3lf51kkrcicdq2j4c1fw0yjdai2apy9467i0sy8c"))

(define rust-smallvec-1.15.1
  (crate-source "smallvec" "1.15.1"
                "00xxdxxpgyq5vjnpljvkmy99xij5rxgh913ii1v16kzynnivgcb7"))

(define rust-smawk-0.3.3
  (crate-source "smawk" "0.3.3"
                "006id1vx7vv7vdnmj0ss5dla34ggymlavv9b5wb4vfws947zpqp8"))

(define rust-smoltcp-0.13.1
  (crate-source "smoltcp" "0.13.1"
                "0pjknypv8lc3lnxq493fqhy5cvgpdnsp0qywkby5x9mvcc2d8wsz"))

(define rust-socket2-0.5.10
  (crate-source "socket2" "0.5.10"
                "0y067ki5q946w91xlz2sb175pnfazizva6fi3kfp639mxnmpc8z2"))

(define rust-socket2-0.6.3
  (crate-source "socket2" "0.6.3"
                "0gkjjcyn69hqhhlh5kl8byk5m0d7hyrp2aqwzbs3d33q208nwxis"))

(define rust-spin-0.10.1
  (crate-source "spin" "0.10.1"
                "1lvxq2sdaissp7dzij94fsbrkxl9mmh2bcw0hr1vr38kncf22fh2"))

(define rust-spki-0.7.3
  (crate-source "spki" "0.7.3"
                "17fj8k5fmx4w9mp27l970clrh5qa7r5sjdvbsln987xhb34dc7nr"))

(define rust-stable-deref-trait-1.2.1
  (crate-source "stable_deref_trait" "1.2.1"
                "15h5h73ppqyhdhx6ywxfj88azmrpml9gl6zp3pwy2malqa6vxqkc"))

(define rust-static-assertions-1.1.0
  (crate-source "static_assertions" "1.1.0"
                "0gsl6xmw10gvn3zs1rv99laj5ig7ylffnh71f9l34js4nr4r7sx2"))

(define rust-strsim-0.11.1
  (crate-source "strsim" "0.11.1"
                "0kzvqlw8hxqb7y598w1s0hxlnmi84sg5vsipp3yg5na5d1rvba3x"))

(define rust-strum-0.27.2
  (crate-source "strum" "0.27.2"
                "1ksb9jssw4bg9kmv9nlgp2jqa4vnsa3y4q9zkppvl952q7vdc8xg"))

(define rust-strum-macros-0.27.2
  (crate-source "strum_macros" "0.27.2"
                "19xwikxma0yi70fxkcy1yxcv0ica8gf3jnh5gj936jza8lwcx5bn"))

(define rust-subtle-2.6.1
  (crate-source "subtle" "2.6.1"
                "14ijxaymghbl1p0wql9cib5zlwiina7kall6w7g89csprkgbvhhk"))

(define rust-surge-ping-0.8.4
  (crate-source "surge-ping" "0.8.4"
                "01dcdk49hn1h4mr7wlckwjzcq6amyyypbmkfvz1i78pbkyf8wj9h"))

(define rust-symlink-0.1.0
  (crate-source "symlink" "0.1.0"
                "02h1i0b81mxb4vns4xrvrfibpcvs7jqqav8p3yilwik8cv73r5x7"))

(define rust-syn-1.0.109
  (crate-source "syn" "1.0.109"
                "0ds2if4600bd59wsv7jjgfkayfzy3hnazs394kz6zdkmna8l3dkj"))

(define rust-syn-2.0.106
  (crate-source "syn" "2.0.106"
                "19mddxp1ia00hfdzimygqmr1jqdvyl86k48427bkci4d08wc9rzd"))

(define rust-syn-3.0.3
  (crate-source "syn" "3.0.3"
                "18srnql3cd39j9q6hf1az02p67rlr1rf6njx9zx4vxj9i3jvmsak"))

(define rust-sync-wrapper-1.0.2
  (crate-source "sync_wrapper" "1.0.2"
                "0qvjyasd6w18mjg5xlaq5jgy84jsjfsvmnn12c13gypxbv75dwhb"))

(define rust-synstructure-0.13.2
  (crate-source "synstructure" "0.13.2"
                "1lh9lx3r3jb18f8sbj29am5hm9jymvbwh6jb1izsnnxgvgrp12kj"))

(define rust-system-configuration-0.7.0
  (crate-source "system-configuration" "0.7.0"
                "12rwilylzc625qnxl30h5kf8wj5ka61zjrwpmb034cd0mc6ksgx1"))

(define rust-system-configuration-sys-0.6.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "system-configuration-sys" "0.6.0"
                "1i5sqrmgy58l4704hibjbl36hclddglh73fb3wx95jnmrq81n7cf"))

(define rust-tagptr-0.2.0
  (crate-source "tagptr" "0.2.0"
                "05r4mwvlsclx1ayj65hpzjv3dn4wpi8j4xm695vydccf9k7r683v"))

(define rust-tempfile-3.27.0
  (crate-source "tempfile" "3.27.0"
                "1gblhnyfjsbg9wjg194n89wrzah7jy3yzgnyzhp56f3v9jd7wj9j"))

(define rust-test-log-0.2.20
  (crate-source "test-log" "0.2.20"
                "1cydyx3hzjrc7n52g34b8gcj6d76sm7xaxphjazzwjha9x3vyiig"))

(define rust-test-log-core-0.2.20
  (crate-source "test-log-core" "0.2.20"
                "0k1b20bybf1m6z4k3sllnmlrbjf0ziw1c0m926ic92xl409x9m1p"))

(define rust-test-log-macros-0.2.20
  (crate-source "test-log-macros" "0.2.20"
                "086kskh5sqha10izys0r9x24ixdw368a8014skzhshqym14r5swv"))

(define rust-textwrap-0.16.2
  (crate-source "textwrap" "0.16.2"
                "0mrhd8q0dnh5hwbwhiv89c6i41yzmhw4clwa592rrp24b9hlfdf1"))

(define rust-thiserror-1.0.69
  (crate-source "thiserror" "1.0.69"
                "0lizjay08agcr5hs9yfzzj6axs53a2rgx070a1dsi3jpkcrzbamn"))

(define rust-thiserror-2.0.19
  (crate-source "thiserror" "2.0.19"
                "1ngwxsjsa64v1n7vb90h2b0i3fqk1piwaf0z6fqdacqfhjc3b909"))

(define rust-thiserror-impl-1.0.69
  (crate-source "thiserror-impl" "1.0.69"
                "1h84fmn2nai41cxbhk6pqf46bxqq1b344v8yz089w1chzi76rvjg"))

(define rust-thiserror-impl-2.0.19
  (crate-source "thiserror-impl" "2.0.19"
                "1ka10pqy1g8zy5al9m8yadg30jp8hx0q80j8awmd8131yw6gxjs3"))

(define rust-thread-local-1.1.9
  (crate-source "thread_local" "1.1.9"
                "1191jvl8d63agnq06pcnarivf63qzgpws5xa33hgc92gjjj4c0pn"))

(define rust-tikv-jemalloc-sys-0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "tikv-jemalloc-sys"
                "0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7"
                "0frahmfl05hppiy1sz9g14qb5jv2q4wr323d83xcx8l6mfrab2nd"))

(define rust-tikv-jemallocator-0.6.1
  (crate-source "tikv-jemallocator" "0.6.1"
                "0fh55m13396lii5wj69qh547fq9n2k7r3cczwrkhaklmgwrb8n83"))

(define rust-time-0.3.47
  (crate-source "time" "0.3.47"
                "0b7g9ly2iabrlgizliz6v5x23yq5d6bpp0mqz6407z1s526d8fvl"))

(define rust-time-core-0.1.8
  (crate-source "time-core" "0.1.8"
                "1jidl426mw48i7hjj4hs9vxgd9lwqq4vyalm4q8d7y4iwz7y353n"))

(define rust-time-macros-0.2.27
  (crate-source "time-macros" "0.2.27"
                "058ja265waq275wxvnfwavbz9r1hd4dgwpfn7a1a9a70l32y8w1f"))

(define rust-tinystr-0.8.2
  (crate-source "tinystr" "0.8.2"
                "0sa8z88axdsf088hgw5p4xcyi6g3w3sgbb6qdp81bph9bk2fkls2"))

(define rust-tinytemplate-1.2.1
  (crate-source "tinytemplate" "1.2.1"
                "1g5n77cqkdh9hy75zdb01adxn45mkh9y40wdr7l68xpz35gnnkdy"))

(define rust-tinyvec-1.11.0
  (crate-source "tinyvec" "1.11.0"
                "1wvycrghzmaysnw34kzwnf0mfx6r75045s24r214wnnjadqfcq9y"))

(define rust-tinyvec-macros-0.1.1
  (crate-source "tinyvec_macros" "0.1.1"
                "081gag86208sc3y6sdkshgw3vysm5d34p431dzw0bshz66ncng0z"))

(define rust-tipsy-0.7.0
  (crate-source "tipsy" "0.7.0"
                "1mq94zs1v08lypyzpnqdn1rmsfrjskhg6vq81pwr73jcjx4qcdgh"))

(define rust-tokio-1.53.1
  (crate-source "tokio" "1.53.1"
                "1v8b3b45pkpbibls75yniqbvx5dlks2708141ljni5mnf6lawb10"))

(define rust-tokio-macros-2.7.0
  (crate-source "tokio-macros" "2.7.0"
                "15m4f37mdafs0gg36sh0rskm1i768lb7zmp8bw67kaxr3avnqniq"))

(define rust-tokio-rustls-0.26.4
  (crate-source "tokio-rustls" "0.26.4"
                "0qggwknz9w4bbsv1z158hlnpkm97j3w8v31586jipn99byaala8p"))

(define rust-tokio-socks-0.5.2
  (crate-source "tokio-socks" "0.5.2"
                "0gq40sgggz21wfpshiq8pryh062vp7m36rrz3c8c2wj60aw70iqd"))

(define rust-tokio-stream-0.1.18
  (crate-source "tokio-stream" "0.1.18"
                "0w3cj33605ab58wqd382gnla5pnd9hnr00xgg333np5bka04knij"))

(define rust-tokio-tfo-0.4.3
  (crate-source "tokio-tfo" "0.4.3"
                "1p1nmn5v4g7xsgs7p6glkbf7q3zwd32fp9sl4fcssn5r7cxjrbg6"))

(define rust-tokio-util-0.6.10
  (crate-source "tokio-util" "0.6.10"
                "01v5zkcxjdd5zaniqxxfl6isvd7y5qfmljpqsdyrfrvd3bh3x51n"))

(define rust-tokio-util-0.7.18
  (crate-source "tokio-util" "0.7.18"
                "1600rd47pylwn7cap1k7s5nvdaa9j7w8kqigzp1qy7mh0p4cxscs"))

(define rust-toml-0.5.11
  (crate-source "toml" "0.5.11"
                "0d2266nx8b3n22c7k24x4428z6di8n83a9n466jm7a2hipfz1xzl"))

(define rust-toml-0.8.23
  (crate-source "toml" "0.8.23"
                "0qnkrq4lm2sdhp3l6cb6f26i8zbnhqb7mhbmksd550wxdfcyn6yw"))

(define rust-toml-datetime-0.6.11
  (crate-source "toml_datetime" "0.6.11"
                "077ix2hb1dcya49hmi1avalwbixmrs75zgzb3b2i7g2gizwdmk92"))

(define rust-toml-datetime-1.1.1+spec-1.1.0
  (crate-source "toml_datetime" "1.1.1+spec-1.1.0"
                "1mws2mkkf46l7inn77azhm0vdwxngv9vsbhbl0ah33p2c9gzcr9i"))

(define rust-toml-edit-0.22.27
  (crate-source "toml_edit" "0.22.27"
                "16l15xm40404asih8vyjvnka9g0xs9i4hfb6ry3ph9g419k8rzj1"))

(define rust-toml-edit-0.25.11+spec-1.1.0
  (crate-source "toml_edit" "0.25.11+spec-1.1.0"
                "0awzffbkx33v9x4h19b5mfrwp3sn4ifr16y58sbk6j6l5v9c8n8b"))

(define rust-toml-parser-1.1.2+spec-1.1.0
  (crate-source "toml_parser" "1.1.2+spec-1.1.0"
                "09kmzc55a0j21whm290wlf5a8b18a0qc87a1s8sncrckc6wfkax2"))

(define rust-toml-write-0.1.2
  (crate-source "toml_write" "0.1.2"
                "008qlhqlqvljp1gpp9rn5cqs74gwvdgbvs92wnpq8y3jlz4zi6ax"))

(define rust-tonic-0.14.6
  (crate-source "tonic" "0.14.6"
                "1vs5ci6z6b9xhfsnx4s8qx6bqi1zzcrxncjp71147a0gqwc5aamc"))

(define rust-tonic-build-0.14.6
  (crate-source "tonic-build" "0.14.6"
                "08h3ddqg2y08hj6fjabjqf18qhl6h0az133c5vvkqaf5ba3n33y6"))

(define rust-tonic-prost-0.14.6
  (crate-source "tonic-prost" "0.14.6"
                "184y40nf0iyzc5rg32ivgd88snv68sqy1kchynn55r1vhml9z12h"))

(define rust-tonic-prost-build-0.14.6
  (crate-source "tonic-prost-build" "0.14.6"
                "09xfzp5b5264p8mw2x6sx9s396ni1r2f2z0rk667ypgpxx1mckk5"))

(define rust-tower-0.5.3
  (crate-source "tower" "0.5.3"
                "1m5i3a2z1sgs8nnz1hgfq2nr4clpdmizlp1d9qsg358ma5iyzrgb"))

(define rust-tower-http-0.6.8
  (crate-source "tower-http" "0.6.8"
                "1y514jwzbyrmrkbaajpwmss4rg0mak82k16d6588w9ncaffmbrnl"))

(define rust-tower-layer-0.3.3
  (crate-source "tower-layer" "0.3.3"
                "03kq92fdzxin51w8iqix06dcfgydyvx7yr6izjq0p626v9n2l70j"))

(define rust-tower-service-0.3.3
  (crate-source "tower-service" "0.3.3"
                "1hzfkvkci33ra94xjx64vv3pp0sq346w06fpkcdwjcid7zhvdycd"))

(define rust-tracing-0.1.44
  (crate-source "tracing" "0.1.44"
                "006ilqkg1lmfdh3xhg3z762izfwmxcvz0w7m4qx2qajbz9i1drv3"))

(define rust-tracing-appender-0.2.5
  (crate-source "tracing-appender" "0.2.5"
                "0g4a6q5s3wafid5lqw1ljzvh1nhk3a4zmb627fxv96dr7qcqc1h5"))

(define rust-tracing-attributes-0.1.31
  (crate-source "tracing-attributes" "0.1.31"
                "1np8d77shfvz0n7camx2bsf1qw0zg331lra0hxb4cdwnxjjwz43l"))

(define rust-tracing-core-0.1.36
  (crate-source "tracing-core" "0.1.36"
                "16mpbz6p8vd6j7sf925k9k8wzvm9vdfsjbynbmaxxyq6v7wwm5yv"))

(define rust-tracing-log-0.2.0
  (crate-source "tracing-log" "0.2.0"
                "1hs77z026k730ij1a9dhahzrl0s073gfa2hm5p0fbl0b80gmz1gf"))

(define rust-tracing-subscriber-0.3.23
  (crate-source "tracing-subscriber" "0.3.23"
                "06fkr0qhggvrs861d7f74pn3i3a10h5jsp4n70jj9ys5b675fzyb"))

(define rust-trait-variant-0.1.2
  (crate-source "trait-variant" "0.1.2"
                "19vpbnbcsxdiznwdw854pd0vya7rm7v7hnl3nh741621603pg5vh"))

(define rust-triggered-0.1.3
  (crate-source "triggered" "0.1.3"
                "0hxb10p6i5i7iy43053lfqbrssrpzrjw1j22x6cy1wqiiaydsgjr"))

(define rust-try-lock-0.2.5
  (crate-source "try-lock" "0.2.5"
                "0jqijrrvm1pyq34zn1jmy2vihd4jcrjlvsh4alkjahhssjnsn8g4"))

(define rust-tun-0.5.5
  (crate-source "tun" "0.5.5"
                "0rps40yrzs1k7jpf204vqc7jj0jr4l7piqjwi7fwgjn6mlimxhnb"))

(define rust-tun-0.8.14
  (crate-source "tun" "0.8.14"
                "1glq3bvb0rhi9nnlfif6vx1cj6l792c1lymsi7ph4pjqii35xdcb"))

(define rust-typed-builder-0.20.1
  (crate-source "typed-builder" "0.20.1"
                "1ixgq9rnffvph1kd5ssd4xnnkcq7rx1k45vb4j7wf9l0l3ik17fd"))

(define rust-typed-builder-0.21.2
  (crate-source "typed-builder" "0.21.2"
                "0zgpk175bykcra5jw6qnsdnsil20hq85b1xfyvwpd5d25kn1my7y"))

(define rust-typed-builder-macro-0.20.1
  (crate-source "typed-builder-macro" "0.20.1"
                "0a6vry4jjl14ikmshqz26x951hpn9j760ycqdmr86sp4q0f7hdiw"))

(define rust-typed-builder-macro-0.21.2
  (crate-source "typed-builder-macro" "0.21.2"
                "060bisai28h8xmrpkicdjs05fdkk07zgv32aq43h88crfz7rxjqy"))

(define rust-typenum-1.20.0
  (crate-source "typenum" "1.20.0"
                "1pj35y6q11d3y55gdl6g1h2dfhmybjming0jdi9bh0bpnqm11kj0"))

(define rust-udp-over-tcp-0.4.0.5c6d8f4
  ;; TODO REVIEW: Define standalone package if this is a workspace.
  (origin
    (method git-fetch)
    (uri (git-reference
          (url "https://github.com/mullvad/udp-over-tcp")
          (commit "5c6d8f44a5aa12ed9bb4ae51dd17e5e22e5ec303")))
    (file-name (git-file-name "rust-udp-over-tcp" "0.4.0.5c6d8f4"))
    (sha256 (base32 "10rml6ailpf6vnic20j667m64gslbabccdb584j3aycic63cgiik"))))

(define rust-uds-windows-1.2.1
  (crate-source "uds_windows" "1.2.1"
                "0vidqwwfgn8wyzvbxiqil787b4wyqjia50zpdbbjqx7n8wlgpxpj"))

(define rust-unarray-0.1.4
  (crate-source "unarray" "0.1.4"
                "154smf048k84prsdgh09nkm2n0w0336v84jd4zikyn6v6jrqbspa"))

(define rust-unicode-ident-1.0.22
  (crate-source "unicode-ident" "1.0.22"
                "1x8xrz17vqi6qmkkcqr8cyf0an76ig7390j9cnqnk47zyv2gf4lk"))

(define rust-unicode-segmentation-1.13.2
  (crate-source "unicode-segmentation" "1.13.2"
                "135a26m4a0wj319gcw28j6a5aqvz00jmgwgmcs6szgxjf942facn"))

(define rust-unicode-xid-0.2.6
  (crate-source "unicode-xid" "0.2.6"
                "0lzqaky89fq0bcrh6jj6bhlz37scfd8c7dsj5dq7y32if56c1hgb"))

(define rust-uniffi-0.31.2
  (crate-source "uniffi" "0.31.2"
                "0zr6f3yp909zy8h33ycm2blc5py690s9vx5i8vd30ab0d1agvvj6"))

(define rust-uniffi-bindgen-0.31.2
  (crate-source "uniffi_bindgen" "0.31.2"
                "0545i3hlwas1fz8bmpair3xgdv2y975xggdjrmji6bnkfnrwk864"))

(define rust-uniffi-core-0.31.2
  (crate-source "uniffi_core" "0.31.2"
                "15ahcr0frkh3vs4l7abpn6q8wijw9c0r4pdyzgv825kh2aqigh7f"))

(define rust-uniffi-internal-macros-0.31.2
  (crate-source "uniffi_internal_macros" "0.31.2"
                "0k5hkivi4rxb6ikil4rj2awpyqf7v425137h1zlcbyzy92dncha6"))

(define rust-uniffi-macros-0.31.2
  (crate-source "uniffi_macros" "0.31.2"
                "0dxp5hldhgs1jkbsbmfrdgsb782vf4agays1yz525phlx1z63f7f"))

(define rust-uniffi-meta-0.31.2
  (crate-source "uniffi_meta" "0.31.2"
                "099adldxm769c6jqxyfajndn0mvfy331bg9854dx40r8r57vkmaq"))

(define rust-uniffi-pipeline-0.31.2
  (crate-source "uniffi_pipeline" "0.31.2"
                "1jlhrqh2pv10dib38sbbv3766088mznrv28m9j8pcmbjxjrkj9q3"))

(define rust-uniffi-udl-0.31.2
  (crate-source "uniffi_udl" "0.31.2"
                "1ikfs0a3cgflvp5i1bzd5gxkg28dmikvly6fx3wimkjj0851s2pw"))

(define rust-universal-hash-0.5.1
  (crate-source "universal-hash" "0.5.1"
                "1sh79x677zkncasa95wz05b36134822w6qxmi1ck05fwi33f47gw"))

(define rust-untrusted-0.9.0
  (crate-source "untrusted" "0.9.0"
                "1ha7ib98vkc538x0z60gfn0fc5whqdd85mb87dvisdcaifi6vjwf"))

(define rust-url-2.5.8
  (crate-source "url" "2.5.8"
                "1v8f7nx3hpr1qh76if0a04sj08k86amsq4h8cvpw6wvk76jahrzz"))

(define rust-utf8-iter-1.0.4
  (crate-source "utf8_iter" "1.0.4"
                "1gmna9flnj8dbyd8ba17zigrp9c4c3zclngf5lnb5yvz1ri41hdn"))

(define rust-utf8parse-0.2.2
  (crate-source "utf8parse" "0.2.2"
                "088807qwjq46azicqwbhlmzwrbkz7l4hpw43sdkdyyk524vdxaq6"))

(define rust-uuid-1.23.1
  (crate-source "uuid" "1.23.1"
                "0xlwg23rmsfl3gx98qsyzpl24pf4bs9wi3mqx5c6i319hyb4mmyx"))

(define rust-valuable-0.1.1
  (crate-source "valuable" "0.1.1"
                "0r9srp55v7g27s5bg7a2m095fzckrcdca5maih6dy9bay6fflwxs"))

(define rust-vec1-1.12.1
  (crate-source "vec1" "1.12.1"
                "08k370srixpnqgvyxqjqvkzig4j9c5kapqzvzsqfys8ghib8pdpa"))

(define rust-version-check-0.9.5
  (crate-source "version_check" "0.9.5"
                "0nhhi4i5x89gm911azqbn7avs9mdacw2i3vcz3cnmz3mv4rqz4hb"))

(define rust-wait-timeout-0.2.1
  (crate-source "wait-timeout" "0.2.1"
                "04azqv9mnfxgvnc8j2wp362xraybakh2dy1nj22gj51rdl93pb09"))

(define rust-walkdir-2.5.0
  (crate-source "walkdir" "2.5.0"
                "0jsy7a710qv8gld5957ybrnc07gavppp963gs32xk4ag8130jy99"))

(define rust-want-0.3.1
  (crate-source "want" "0.3.1"
                "03hbfrnvqqdchb5kgxyavb9jabwza0dmh2vw5kg0dq8rxl57d9xz"))

(define rust-wasi-0.11.1+wasi-snapshot-preview1
  (crate-source "wasi" "0.11.1+wasi-snapshot-preview1"
                "0jx49r7nbkbhyfrfyhz0bm4817yrnxgd3jiwwwfv0zl439jyrwyc"))

(define rust-wasip2-1.0.3+wasi-0.2.9
  (crate-source "wasip2" "1.0.3+wasi-0.2.9"
                "1mi3w855dz99xzjqc4aa8c9q5b6z1y5c963pkk4cvmr6vdr4c1i0"))

(define rust-wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06
  (crate-source "wasip3" "0.4.0+wasi-0.3.0-rc-2026-01-06"
                "19dc8p0y2mfrvgk3qw3c3240nfbylv22mvyxz84dqpgai2zzha2l"))

(define rust-wasm-bindgen-0.2.120
  (crate-source "wasm-bindgen" "0.2.120"
                "1cax9wy1n67sa2m16ia72lsxdrc5pzcv47psxp4p833yp3cvclnz"))

(define rust-wasm-bindgen-futures-0.4.70
  (crate-source "wasm-bindgen-futures" "0.4.70"
                "1130a64yig0p10mk7rnq5l2jpwglbyxpnqg6h0nlqwzcmir4i4xg"))

(define rust-wasm-bindgen-macro-0.2.120
  (crate-source "wasm-bindgen-macro" "0.2.120"
                "00xixpydzjd6y9knwdsrsiff6wi1ddszb1fa9bk25csz94gh9cbq"))

(define rust-wasm-bindgen-macro-support-0.2.120
  (crate-source "wasm-bindgen-macro-support" "0.2.120"
                "0h8v5aphaaq155fzz2d312zrxbka1x6lsvb8mhc8m60n0kr0zkcx"))

(define rust-wasm-bindgen-shared-0.2.120
  (crate-source "wasm-bindgen-shared" "0.2.120"
                "1sjrac4f4j5pgw42mxadq9v42f0bji1a2rcksrbnrwgbh8y7nxa9"))

(define rust-wasm-encoder-0.244.0
  (crate-source "wasm-encoder" "0.244.0"
                "06c35kv4h42vk3k51xjz1x6hn3mqwfswycmr6ziky033zvr6a04r"))

(define rust-wasm-metadata-0.244.0
  (crate-source "wasm-metadata" "0.244.0"
                "02f9dhlnryd2l7zf03whlxai5sv26x4spfibjdvc3g9gd8z3a3mv"))

(define rust-wasmparser-0.244.0
  (crate-source "wasmparser" "0.244.0"
                "1zi821hrlsxfhn39nqpmgzc0wk7ax3dv6vrs5cw6kb0v5v3hgf27"))

(define rust-web-sys-0.3.97
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "web-sys" "0.3.97"
                "00knh8cizgb01bmh362f3f19b11f8zl1y3gj6h47pk95233vmb9f"))

(define rust-web-time-1.1.0
  (crate-source "web-time" "1.1.0"
                "1fx05yqx83dhx628wb70fyy10yjfq1jpl20qfqhdkymi13rq0ras"))

(define rust-webpki-roots-1.0.7
  (crate-source "webpki-roots" "1.0.7"
                "17gblaqmp51znxd2c18c04k8yfnf7s77c04n6hdmzxbcr52fxxaj"))

(define rust-weedle2-5.0.0
  (crate-source "weedle2" "5.0.0"
                "03mf9r8py0za38jh35ww3lgvd0lxky2hhy26z7d8g6h9xhj2r3cr"))

(define rust-which-4.4.2
  (crate-source "which" "4.4.2"
                "1ixzmx3svsv5hbdvd8vdhd3qwvf6ns8jdpif1wmwsy10k90j9fl7"))

(define rust-widestring-1.2.1
  (crate-source "widestring" "1.2.1"
                "0wg4qdbs70xqnlbm8wb0bs4idm2mxk3b6kaqwllsncmb2cqrq1kj"))

(define rust-winapi-0.3.9
  (crate-source "winapi" "0.3.9"
                "06gl025x418lchw1wxj64ycr7gha83m44cjr5sarhynd9xkrm0sw"))

(define rust-winapi-build-0.1.1
  (crate-source "winapi-build" "0.1.1"
                "1g4rqsgjky0a7530qajn2bbfcrl2v0zb39idgdws9b1l7gp5wc9d"))

(define rust-winapi-i686-pc-windows-gnu-0.4.0
  (crate-source "winapi-i686-pc-windows-gnu" "0.4.0"
                "1dmpa6mvcvzz16zg6d5vrfy4bxgg541wxrcip7cnshi06v38ffxc"))

(define rust-winapi-util-0.1.11
  (crate-source "winapi-util" "0.1.11"
                "08hdl7mkll7pz8whg869h58c1r9y7in0w0pk8fm24qc77k0b39y2"))

(define rust-winapi-x86-64-pc-windows-gnu-0.4.0
  (crate-source "winapi-x86_64-pc-windows-gnu" "0.4.0"
                "0gqq64czqb64kskjryj8isp62m2sgvx25yyj3kpc2myh85w24bki"))

(define rust-windows-0.62.2
  (crate-source "windows" "0.62.2"
                "10457l9ihrbw8j79z2v4plyjxkf6xvb5npd0lqwmkh702gpaszsj"))

(define rust-windows-collections-0.3.2
  (crate-source "windows-collections" "0.3.2"
                "0436rjbkqn3j9m2v2lcmwwk0l3n2r57yvqb7fcy4m8d8y5ddkci3"))

(define rust-windows-core-0.62.2
  (crate-source "windows-core" "0.62.2"
                "1swxpv1a8qvn3bkxv8cn663238h2jccq35ff3nsj61jdsca3ms5q"))

(define rust-windows-future-0.3.2
  (crate-source "windows-future" "0.3.2"
                "1jq5qs2dwzf6rl60f8gr49z2mifxsrdh4y4yfdws467ya41gkmp1"))

(define rust-windows-implement-0.60.2
  (crate-source "windows-implement" "0.60.2"
                "1psxhmklzcf3wjs4b8qb42qb6znvc142cb5pa74rsyxm1822wgh5"))

(define rust-windows-interface-0.59.3
  (crate-source "windows-interface" "0.59.3"
                "0n73cwrn4247d0axrk7gjp08p34x1723483jxjxjdfkh4m56qc9z"))

(define rust-windows-link-0.2.1
  (crate-source "windows-link" "0.2.1"
                "1rag186yfr3xx7piv5rg8b6im2dwcf8zldiflvb22xbzwli5507h"))

(define rust-windows-numerics-0.3.1
  (crate-source "windows-numerics" "0.3.1"
                "09hgbg8pf89r4090yyhh9q29ppi7yyxkgmga9ascshy19a240bkf"))

(define rust-windows-registry-0.6.1
  (crate-source "windows-registry" "0.6.1"
                "082p7l615qk8a4g8g15yipc5lghga6cgfhm74wm7zknwzgvjnx82"))

(define rust-windows-result-0.4.1
  (crate-source "windows-result" "0.4.1"
                "1d9yhmrmmfqh56zlj751s5wfm9a2aa7az9rd7nn5027nxa4zm0bp"))

(define rust-windows-service-0.6.0
  (crate-source "windows-service" "0.6.0"
                "1j0kml9wlkylmcx24hqjh1i2qjwx0332z2j6jlnpc4svrdzb77fd"))

(define rust-windows-strings-0.5.1
  (crate-source "windows-strings" "0.5.1"
                "14bhng9jqv4fyl7lqjz3az7vzh8pw0w4am49fsqgcz67d67x0dvq"))

(define rust-windows-sys-0.36.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.36.1"
                "1lmqangv0zg1l46xiq7rfnqwsx8f8m52mqbgg2mrx7x52rd1a17a"))

(define rust-windows-sys-0.45.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.45.0"
                "1l36bcqm4g89pknfp8r9rl1w4bn017q6a8qlx8viv0xjxzjkna3m"))

(define rust-windows-sys-0.52.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.52.0"
                "0gd3v4ji88490zgb6b5mq5zgbvwv7zx1ibn8v3x83rwcdbryaar8"))

(define rust-windows-sys-0.59.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.59.0"
                "0fw5672ziw8b3zpmnbp9pdv1famk74f1l9fcbc3zsrzdg56vqf0y"))

(define rust-windows-sys-0.60.2
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.60.2"
                "1jrbc615ihqnhjhxplr2kw7rasrskv9wj3lr80hgfd42sbj01xgj"))

(define rust-windows-sys-0.61.2
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.61.2"
                "1z7k3y9b6b5h52kid57lvmvm05362zv1v8w0gc7xyv5xphlp44xf"))

(define rust-windows-targets-0.42.2
  (crate-source "windows-targets" "0.42.2"
                "0wfhnib2fisxlx8c507dbmh97kgij4r6kcxdi0f9nk6l1k080lcf"))

(define rust-windows-targets-0.52.6
  (crate-source "windows-targets" "0.52.6"
                "0wwrx625nwlfp7k93r2rra568gad1mwd888h1jwnl0vfg5r4ywlv"))

(define rust-windows-targets-0.53.5
  (crate-source "windows-targets" "0.53.5"
                "1wv9j2gv3l6wj3gkw5j1kr6ymb5q6dfc42yvydjhv3mqa7szjia9"))

(define rust-windows-threading-0.2.1
  (crate-source "windows-threading" "0.2.1"
                "0dsvsy33vxs0153z4n39sqkzx382cjjkrd46rb3z3zfak5dvsj9r"))

(define rust-windows-aarch64-gnullvm-0.42.2
  (crate-source "windows_aarch64_gnullvm" "0.42.2"
                "1y4q0qmvl0lvp7syxvfykafvmwal5hrjb4fmv04bqs0bawc52yjr"))

(define rust-windows-aarch64-gnullvm-0.52.6
  (crate-source "windows_aarch64_gnullvm" "0.52.6"
                "1lrcq38cr2arvmz19v32qaggvj8bh1640mdm9c2fr877h0hn591j"))

(define rust-windows-aarch64-gnullvm-0.53.1
  (crate-source "windows_aarch64_gnullvm" "0.53.1"
                "0lqvdm510mka9w26vmga7hbkmrw9glzc90l4gya5qbxlm1pl3n59"))

(define rust-windows-aarch64-msvc-0.36.1
  (crate-source "windows_aarch64_msvc" "0.36.1"
                "0ixaxs2c37ll2smprzh0xq5p238zn8ylzb3lk1zddqmd77yw7f4v"))

(define rust-windows-aarch64-msvc-0.42.2
  (crate-source "windows_aarch64_msvc" "0.42.2"
                "0hsdikjl5sa1fva5qskpwlxzpc5q9l909fpl1w6yy1hglrj8i3p0"))

(define rust-windows-aarch64-msvc-0.52.6
  (crate-source "windows_aarch64_msvc" "0.52.6"
                "0sfl0nysnz32yyfh773hpi49b1q700ah6y7sacmjbqjjn5xjmv09"))

(define rust-windows-aarch64-msvc-0.53.1
  (crate-source "windows_aarch64_msvc" "0.53.1"
                "01jh2adlwx043rji888b22whx4bm8alrk3khjpik5xn20kl85mxr"))

(define rust-windows-i686-gnu-0.36.1
  (crate-source "windows_i686_gnu" "0.36.1"
                "1dm3svxfzamrv6kklyda9c3qylgwn5nwdps6p0kc9x6s077nq3hq"))

(define rust-windows-i686-gnu-0.42.2
  (crate-source "windows_i686_gnu" "0.42.2"
                "0kx866dfrby88lqs9v1vgmrkk1z6af9lhaghh5maj7d4imyr47f6"))

(define rust-windows-i686-gnu-0.52.6
  (crate-source "windows_i686_gnu" "0.52.6"
                "02zspglbykh1jh9pi7gn8g1f97jh1rrccni9ivmrfbl0mgamm6wf"))

(define rust-windows-i686-gnu-0.53.1
  (crate-source "windows_i686_gnu" "0.53.1"
                "18wkcm82ldyg4figcsidzwbg1pqd49jpm98crfz0j7nqd6h6s3ln"))

(define rust-windows-i686-gnullvm-0.52.6
  (crate-source "windows_i686_gnullvm" "0.52.6"
                "0rpdx1537mw6slcpqa0rm3qixmsb79nbhqy5fsm3q2q9ik9m5vhf"))

(define rust-windows-i686-gnullvm-0.53.1
  (crate-source "windows_i686_gnullvm" "0.53.1"
                "030qaxqc4salz6l4immfb6sykc6gmhyir9wzn2w8mxj8038mjwzs"))

(define rust-windows-i686-msvc-0.36.1
  (crate-source "windows_i686_msvc" "0.36.1"
                "097h2a7wig04wbmpi3rz1akdy4s8gslj5szsx8g2v0dj91qr3rz2"))

(define rust-windows-i686-msvc-0.42.2
  (crate-source "windows_i686_msvc" "0.42.2"
                "0q0h9m2aq1pygc199pa5jgc952qhcnf0zn688454i7v4xjv41n24"))

(define rust-windows-i686-msvc-0.52.6
  (crate-source "windows_i686_msvc" "0.52.6"
                "0rkcqmp4zzmfvrrrx01260q3xkpzi6fzi2x2pgdcdry50ny4h294"))

(define rust-windows-i686-msvc-0.53.1
  (crate-source "windows_i686_msvc" "0.53.1"
                "1hi6scw3mn2pbdl30ji5i4y8vvspb9b66l98kkz350pig58wfyhy"))

(define rust-windows-x86-64-gnu-0.36.1
  (crate-source "windows_x86_64_gnu" "0.36.1"
                "1qfrck3jnihymfrd01s8260d4snql8ks2p8yaabipi3nhwdigkad"))

(define rust-windows-x86-64-gnu-0.42.2
  (crate-source "windows_x86_64_gnu" "0.42.2"
                "0dnbf2xnp3xrvy8v9mgs3var4zq9v9yh9kv79035rdgyp2w15scd"))

(define rust-windows-x86-64-gnu-0.52.6
  (crate-source "windows_x86_64_gnu" "0.52.6"
                "0y0sifqcb56a56mvn7xjgs8g43p33mfqkd8wj1yhrgxzma05qyhl"))

(define rust-windows-x86-64-gnu-0.53.1
  (crate-source "windows_x86_64_gnu" "0.53.1"
                "16d4yiysmfdlsrghndr97y57gh3kljkwhfdbcs05m1jasz6l4f4w"))

(define rust-windows-x86-64-gnullvm-0.42.2
  (crate-source "windows_x86_64_gnullvm" "0.42.2"
                "18wl9r8qbsl475j39zvawlidp1bsbinliwfymr43fibdld31pm16"))

(define rust-windows-x86-64-gnullvm-0.52.6
  (crate-source "windows_x86_64_gnullvm" "0.52.6"
                "03gda7zjx1qh8k9nnlgb7m3w3s1xkysg55hkd1wjch8pqhyv5m94"))

(define rust-windows-x86-64-gnullvm-0.53.1
  (crate-source "windows_x86_64_gnullvm" "0.53.1"
                "1qbspgv4g3q0vygkg8rnql5c6z3caqv38japiynyivh75ng1gyhg"))

(define rust-windows-x86-64-msvc-0.36.1
  (crate-source "windows_x86_64_msvc" "0.36.1"
                "103n3xijm5vr7qxr1dps202ckfnv7njjnnfqmchg8gl5ii5cl4f8"))

(define rust-windows-x86-64-msvc-0.42.2
  (crate-source "windows_x86_64_msvc" "0.42.2"
                "1w5r0q0yzx827d10dpjza2ww0j8iajqhmb54s735hhaj66imvv4s"))

(define rust-windows-x86-64-msvc-0.52.6
  (crate-source "windows_x86_64_msvc" "0.52.6"
                "1v7rb5cibyzx8vak29pdrk8nx9hycsjs4w0jgms08qk49jl6v7sq"))

(define rust-windows-x86-64-msvc-0.53.1
  (crate-source "windows_x86_64_msvc" "0.53.1"
                "0l6npq76vlq4ksn4bwsncpr8508mk0gmznm6wnhjg95d19gzzfyn"))

(define rust-winnow-0.7.15
  (crate-source "winnow" "0.7.15"
                "0i9rkl2rqpbnnxlgs20gmkj3nd0b2k8q55mjmpc2ybb84xwxjyfz"))

(define rust-winnow-1.0.2
  (crate-source "winnow" "1.0.2"
                "1l7xnfvlgy4da6gq5ip2bgcm8i9d0rwzaxg1p88nlw8lxy5p1q9f"))

(define rust-winres-0.1.12
  (crate-source "winres" "0.1.12"
                "0v2gvqnd8iwwvb6fs69nv0mmk1z96430527n0qlfbsarxxhv53dn"))

(define rust-wintun-bindings-0.7.39
  (crate-source "wintun-bindings" "0.7.39"
                "04fr83canybkymm94y4ad0mpalbsh5xvw9pmbkq7llsp4g898i7w"))

(define rust-wit-bindgen-0.51.0
  (crate-source "wit-bindgen" "0.51.0"
                "19fazgch8sq5cvjv3ynhhfh5d5x08jq2pkw8jfb05vbcyqcr496p"))

(define rust-wit-bindgen-0.57.1
  (crate-source "wit-bindgen" "0.57.1"
                "0vjk2jb593ri9k1aq4iqs2si9mrw5q46wxnn78im7hm7hx799gqy"))

(define rust-wit-bindgen-core-0.51.0
  (crate-source "wit-bindgen-core" "0.51.0"
                "1p2jszqsqbx8k7y8nwvxg65wqzxjm048ba5phaq8r9iy9ildwqga"))

(define rust-wit-bindgen-rust-0.51.0
  (crate-source "wit-bindgen-rust" "0.51.0"
                "08bzn5fsvkb9x9wyvyx98qglknj2075xk1n7c5jxv15jykh6didp"))

(define rust-wit-bindgen-rust-macro-0.51.0
  (crate-source "wit-bindgen-rust-macro" "0.51.0"
                "0ymizapzv2id89igxsz2n587y2hlfypf6n8kyp68x976fzyrn3qc"))

(define rust-wit-component-0.244.0
  (crate-source "wit-component" "0.244.0"
                "1clwxgsgdns3zj2fqnrjcp8y5gazwfa1k0sy5cbk0fsmx4hflrlx"))

(define rust-wit-parser-0.244.0
  (crate-source "wit-parser" "0.244.0"
                "0dm7avvdxryxd5b02l0g5h6933z1cw5z0d4wynvq2cywq55srj7c"))

(define rust-wmi-0.18.4
  (crate-source "wmi" "0.18.4"
                "0r4b402x318i4najklxrhbq5rg9apyb68n39cvjh0xd5axfbi0bw"))

(define rust-writeable-0.6.3
  (crate-source "writeable" "0.6.3"
                "1i54d13h9bpap2hf13xcry1s4lxh7ap3923g8f3c0grd7c9fbyhz"))

(define rust-x25519-dalek-2.0.1
  (crate-source "x25519-dalek" "2.0.1"
                "0xyjgqpsa0q6pprakdp58q1hy45rf8wnqqscgzx0gyw13hr6ir67"))

(define rust-yoke-0.8.1
  (crate-source "yoke" "0.8.1"
                "0m29dm0bf5iakxgma0bj6dbmc3b8qi9b1vaw9sa76kdqmz3fbmkj"))

(define rust-yoke-derive-0.8.1
  (crate-source "yoke-derive" "0.8.1"
                "0pbyja133jnng4mrhimzdq4a0y26421g734ybgz8wsgbfhl0andn"))

(define rust-zbus-5.15.0
  (crate-source "zbus" "5.15.0"
                "1haafa6wvq63ljpl1yibnpldbjx5w0i3d68cpv0pz3bhr0avzg63"))

(define rust-zbus-macros-5.15.0
  (crate-source "zbus_macros" "5.15.0"
                "1zqn4lghyabwc85wnkv3ncqva5ki6k7zhcd94p4ahxciml359yji"))

(define rust-zbus-names-4.3.2
  (crate-source "zbus_names" "4.3.2"
                "0bg5c1bq4xdq9xqdkgvxwvl9pa6h61nh2hh1fn8sqkl91gjz6x3h"))

(define rust-zerocopy-0.8.31
  (crate-source "zerocopy" "0.8.31"
                "1hwqn8f0zd8h1a7qz2hxym4iaqyzk8kdxgalllydn2i5p6cfqx7x"))

(define rust-zerocopy-derive-0.8.31
  (crate-source "zerocopy-derive" "0.8.31"
                "0sjw20qqxbax8z8k9ifcmwjjlljjddpm0nmvih9zap7lzl4x5a6q"))

(define rust-zerofrom-0.1.7
  (crate-source "zerofrom" "0.1.7"
                "1py40in4rirc9q8w36q67pld0zk8ssg024xhh0cncxgal7ra3yk9"))

(define rust-zerofrom-derive-0.1.6
  (crate-source "zerofrom-derive" "0.1.6"
                "00l5niw7c1b0lf1vhvajpjmcnbdp2vn96jg4nmkhq2db0rp5s7np"))

(define rust-zeroize-1.8.2
  (crate-source "zeroize" "1.8.2"
                "1l48zxgcv34d7kjskr610zqsm6j2b4fcr2vfh9jm9j1jgvk58wdr"))

(define rust-zeroize-derive-1.4.3
  (crate-source "zeroize_derive" "1.4.3"
                "0bl5vd1lz27p4z336nximg5wrlw5j7jc8fxh7iv6r1wrhhav99c5"))

(define rust-zerotrie-0.2.3
  (crate-source "zerotrie" "0.2.3"
                "0lbqznlqazmrwwzslw0ci7p3pqxykrbfhq29npj0gmb2amxc2n9a"))

(define rust-zerovec-0.11.5
  (crate-source "zerovec" "0.11.5"
                "00m0p47k2g9mkv505hky5xh3r6ps7v8qc0dy4pspg542jj972a3c"))

(define rust-zerovec-derive-0.11.2
  (crate-source "zerovec-derive" "0.11.2"
                "1wsig4h5j7a1scd5hrlnragnazjny9qjc44hancb6p6a76ay7p7a"))

(define rust-zmij-1.0.21
  (crate-source "zmij" "1.0.21"
                "1amb5i6gz7yjb0dnmz5y669674pqmwbj44p4yfxfv2ncgvk8x15q"))

(define rust-zvariant-5.10.1
  (crate-source "zvariant" "5.10.1"
                "1zqlm9zgp2g09xppknrf241rmqzhyycc0mrwcn95xkw7i75hxny4"))

(define rust-zvariant-derive-5.10.1
  (crate-source "zvariant_derive" "5.10.1"
                "166ay9cnmj5ysj72ylsmif6zd2in1sx82x5acgbvxd5ik9irp52v"))

(define rust-zvariant-utils-3.3.1
  (crate-source "zvariant_utils" "3.3.1"
                "14fn22j5ccnpal9p55l5cg8fkb6a6f2z2mnnchqpm87z6dblyikd"))


(define rust-jiff-0.2.22
  (crate-source "jiff" "0.2.22"
                "1hni7qv2j2kbjisw84r7y6gxdb8qx534vw92nmz13nc7gjy496w1"))

(define rust-jiff-static-0.2.22
  (crate-source "jiff-static" "0.2.22"
                "18fljj75vxqvq1v55s074pbbrjy67qg1p2f0cvbmzhzc33dm40j7"))

(define mullvad-crate-inputs
  (list
   (list "rust-jiff-static-0.2.22" rust-jiff-static-0.2.22)
   (list "rust-jiff-0.2.22" rust-jiff-0.2.22)
   (list "rust-adler2-2.0.1" rust-adler2-2.0.1)
   (list "rust-aead-0.5.2" rust-aead-0.5.2)
   (list "rust-aes-0.8.4" rust-aes-0.8.4)
   (list "rust-aes-gcm-0.10.3" rust-aes-gcm-0.10.3)
   (list "rust-aho-corasick-1.1.4" rust-aho-corasick-1.1.4)
   (list "rust-android-system-properties-0.1.5" rust-android-system-properties-0.1.5)
   (list "rust-anes-0.1.6" rust-anes-0.1.6)
   (list "rust-anstream-0.6.21" rust-anstream-0.6.21)
   (list "rust-anstream-1.0.0" rust-anstream-1.0.0)
   (list "rust-anstyle-1.0.14" rust-anstyle-1.0.14)
   (list "rust-anstyle-parse-0.2.7" rust-anstyle-parse-0.2.7)
   (list "rust-anstyle-parse-1.0.0" rust-anstyle-parse-1.0.0)
   (list "rust-anstyle-query-1.1.5" rust-anstyle-query-1.1.5)
   (list "rust-anstyle-wincon-3.0.11" rust-anstyle-wincon-3.0.11)
   (list "rust-anyhow-1.0.103" rust-anyhow-1.0.103)
   (list "rust-arrayref-0.3.9" rust-arrayref-0.3.9)
   (list "rust-arrayvec-0.7.6" rust-arrayvec-0.7.6)
   (list "rust-askama-0.14.0" rust-askama-0.14.0)
   (list "rust-askama-derive-0.14.0" rust-askama-derive-0.14.0)
   (list "rust-askama-parser-0.14.0" rust-askama-parser-0.14.0)
   (list "rust-assert-json-diff-2.0.2" rust-assert-json-diff-2.0.2)
   (list "rust-async-broadcast-0.7.2" rust-async-broadcast-0.7.2)
   (list "rust-async-channel-2.5.0" rust-async-channel-2.5.0)
   (list "rust-async-executor-1.14.0" rust-async-executor-1.14.0)
   (list "rust-async-io-2.6.0" rust-async-io-2.6.0)
   (list "rust-async-lock-3.4.2" rust-async-lock-3.4.2)
   (list "rust-async-process-2.5.0" rust-async-process-2.5.0)
   (list "rust-async-recursion-1.1.1" rust-async-recursion-1.1.1)
   (list "rust-async-signal-0.2.14" rust-async-signal-0.2.14)
   (list "rust-async-task-4.7.1" rust-async-task-4.7.1)
   (list "rust-async-tempfile-0.6.0" rust-async-tempfile-0.6.0)
   (list "rust-async-trait-0.1.89" rust-async-trait-0.1.89)
   (list "rust-atomic-waker-1.1.2" rust-atomic-waker-1.1.2)
   (list "rust-autocfg-1.5.0" rust-autocfg-1.5.0)
   (list "rust-axum-0.8.9" rust-axum-0.8.9)
   (list "rust-axum-core-0.5.6" rust-axum-core-0.5.6)
   (list "rust-base64-0.22.1" rust-base64-0.22.1)
   (list "rust-base64ct-1.8.3" rust-base64ct-1.8.3)
   (list "rust-basic-toml-0.1.10" rust-basic-toml-0.1.10)
   (list "rust-bincode-1.3.3" rust-bincode-1.3.3)
   (list "rust-bit-set-0.8.0" rust-bit-set-0.8.0)
   (list "rust-bit-vec-0.8.0" rust-bit-vec-0.8.0)
   (list "rust-bitfield-struct-0.12.1" rust-bitfield-struct-0.12.1)
   (list "rust-bitflags-1.3.2" rust-bitflags-1.3.2)
   (list "rust-bitflags-2.11.1" rust-bitflags-2.11.1)
   (list "rust-blake2-0.10.6" rust-blake2-0.10.6)
   (list "rust-blake3-1.8.5" rust-blake3-1.8.5)
   (list "rust-block-0.1.6" rust-block-0.1.6)
   (list "rust-block-buffer-0.10.4" rust-block-buffer-0.10.4)
   (list "rust-block2-0.5.1" rust-block2-0.5.1)
   (list "rust-block2-0.6.2" rust-block2-0.6.2)
   (list "rust-blocking-1.6.2" rust-blocking-1.6.2)
   (list "rust-bumpalo-3.20.2" rust-bumpalo-3.20.2)
   (list "rust-byte-string-1.0.0" rust-byte-string-1.0.0)
   (list "rust-byteorder-1.5.0" rust-byteorder-1.5.0)
   (list "rust-byteorder-slice-3.0.0" rust-byteorder-slice-3.0.0)
   (list "rust-bytes-1.12.1" rust-bytes-1.12.1)
   (list "rust-cacao-0.3.2" rust-cacao-0.3.2)
   (list "rust-camellia-0.1.0" rust-camellia-0.1.0)
   (list "rust-camino-1.2.4" rust-camino-1.2.4)
   (list "rust-cargo-platform-0.1.9" rust-cargo-platform-0.1.9)
   (list "rust-cargo-metadata-0.19.2" rust-cargo-metadata-0.19.2)
   (list "rust-cast-0.3.0" rust-cast-0.3.0)
   (list "rust-cbindgen-0.28.0" rust-cbindgen-0.28.0)
   (list "rust-cc-1.2.61" rust-cc-1.2.61)
   (list "rust-cesu8-1.1.0" rust-cesu8-1.1.0)
   (list "rust-cfg-if-1.0.4" rust-cfg-if-1.0.4)
   (list "rust-cfg-aliases-0.2.1" rust-cfg-aliases-0.2.1)
   (list "rust-chacha20-0.9.1" rust-chacha20-0.9.1)
   (list "rust-chacha20-0.10.0" rust-chacha20-0.10.0)
   (list "rust-chacha20poly1305-0.10.1" rust-chacha20poly1305-0.10.1)
   (list "rust-chrono-0.4.44" rust-chrono-0.4.44)
   (list "rust-ciborium-0.2.2" rust-ciborium-0.2.2)
   (list "rust-ciborium-io-0.2.2" rust-ciborium-io-0.2.2)
   (list "rust-ciborium-ll-0.2.2" rust-ciborium-ll-0.2.2)
   (list "rust-cipher-0.4.4" rust-cipher-0.4.4)
   (list "rust-clap-4.5.60" rust-clap-4.5.60)
   (list "rust-clap-builder-4.5.60" rust-clap-builder-4.5.60)
   (list "rust-clap-complete-4.6.3" rust-clap-complete-4.6.3)
   (list "rust-clap-derive-4.5.55" rust-clap-derive-4.5.55)
   (list "rust-clap-lex-1.1.0" rust-clap-lex-1.1.0)
   (list "rust-colorchoice-1.0.5" rust-colorchoice-1.0.5)
   (list "rust-colored-3.1.1" rust-colored-3.1.1)
   (list "rust-combine-4.6.7" rust-combine-4.6.7)
   (list "rust-concurrent-queue-2.5.0" rust-concurrent-queue-2.5.0)
   (list "rust-console-0.16.3" rust-console-0.16.3)
   (list "rust-const-oid-0.9.6" rust-const-oid-0.9.6)
   (list "rust-constant-time-eq-0.4.2" rust-constant-time-eq-0.4.2)
   (list "rust-convert-case-0.10.0" rust-convert-case-0.10.0)
   (list "rust-core-foundation-0.9.4" rust-core-foundation-0.9.4)
   (list "rust-core-foundation-sys-0.8.7" rust-core-foundation-sys-0.8.7)
   (list "rust-core-graphics-0.22.3" rust-core-graphics-0.22.3)
   (list "rust-core-graphics-types-0.1.3" rust-core-graphics-types-0.1.3)
   (list "rust-cpufeatures-0.2.17" rust-cpufeatures-0.2.17)
   (list "rust-cpufeatures-0.3.0" rust-cpufeatures-0.3.0)
   (list "rust-crc32fast-1.5.0" rust-crc32fast-1.5.0)
   (list "rust-criterion-0.7.0" rust-criterion-0.7.0)
   (list "rust-criterion-plot-0.6.0" rust-criterion-plot-0.6.0)
   (list "rust-critical-section-1.2.0" rust-critical-section-1.2.0)
   (list "rust-crossbeam-channel-0.5.15" rust-crossbeam-channel-0.5.15)
   (list "rust-crossbeam-deque-0.8.6" rust-crossbeam-deque-0.8.6)
   (list "rust-crossbeam-epoch-0.9.20" rust-crossbeam-epoch-0.9.20)
   (list "rust-crossbeam-utils-0.8.21" rust-crossbeam-utils-0.8.21)
   (list "rust-crunchy-0.2.4" rust-crunchy-0.2.4)
   (list "rust-crypto-common-0.1.7" rust-crypto-common-0.1.7)
   (list "rust-csv-1.4.0" rust-csv-1.4.0)
   (list "rust-csv-core-0.1.13" rust-csv-core-0.1.13)
   (list "rust-ctr-0.9.2" rust-ctr-0.9.2)
   (list "rust-ctrlc-3.5.2" rust-ctrlc-3.5.2)
   (list "rust-curve25519-dalek-4.1.3" rust-curve25519-dalek-4.1.3)
   (list "rust-curve25519-dalek-derive-0.1.1" rust-curve25519-dalek-derive-0.1.1)
   (list "rust-darling-0.20.11" rust-darling-0.20.11)
   (list "rust-darling-core-0.20.11" rust-darling-core-0.20.11)
   (list "rust-darling-macro-0.20.11" rust-darling-macro-0.20.11)
   (list "rust-data-encoding-2.11.0" rust-data-encoding-2.11.0)
   (list "rust-dbus-0.9.11" rust-dbus-0.9.11)
   (list "rust-defmt-0.3.100" rust-defmt-0.3.100)
   (list "rust-defmt-1.1.1" rust-defmt-1.1.1)
   (list "rust-defmt-macros-1.1.1" rust-defmt-macros-1.1.1)
   (list "rust-defmt-parser-1.0.0" rust-defmt-parser-1.0.0)
   (list "rust-der-0.7.10" rust-der-0.7.10)
   (list "rust-deranged-0.5.8" rust-deranged-0.5.8)
   (list "rust-derive-into-owned-0.2.0" rust-derive-into-owned-0.2.0)
   (list "rust-derive-builder-0.20.2" rust-derive-builder-0.20.2)
   (list "rust-derive-builder-core-0.20.2" rust-derive-builder-core-0.20.2)
   (list "rust-derive-builder-macro-0.20.2" rust-derive-builder-macro-0.20.2)
   (list "rust-derive-more-2.1.1" rust-derive-more-2.1.1)
   (list "rust-derive-more-impl-2.1.1" rust-derive-more-impl-2.1.1)
   (list "rust-digest-0.10.7" rust-digest-0.10.7)
   (list "rust-dirs-6.0.0" rust-dirs-6.0.0)
   (list "rust-dirs-sys-0.5.0" rust-dirs-sys-0.5.0)
   (list "rust-dispatch-0.2.0" rust-dispatch-0.2.0)
   (list "rust-dispatch2-0.3.1" rust-dispatch2-0.3.1)
   (list "rust-displaydoc-0.2.5" rust-displaydoc-0.2.5)
   (list "rust-domain-fronting-0.1.0" rust-domain-fronting-0.1.0)
   (list "rust-dunce-1.0.5" rust-dunce-1.0.5)
   (list "rust-duplicate-2.0.1" rust-duplicate-2.0.1)
   (list "rust-dynosaur-0.3.0" rust-dynosaur-0.3.0)
   (list "rust-dynosaur-derive-0.3.0" rust-dynosaur-derive-0.3.0)
   (list "rust-ed25519-2.2.3" rust-ed25519-2.2.3)
   (list "rust-ed25519-dalek-2.2.0" rust-ed25519-dalek-2.2.0)
   (list "rust-educe-0.4.23" rust-educe-0.4.23)
   (list "rust-either-1.15.0" rust-either-1.15.0)
   (list "rust-encode-unicode-1.0.0" rust-encode-unicode-1.0.0)
   (list "rust-endi-1.1.1" rust-endi-1.1.1)
   (list "rust-enum-map-2.7.3" rust-enum-map-2.7.3)
   (list "rust-enum-map-derive-0.17.0" rust-enum-map-derive-0.17.0)
   (list "rust-enum-ordinalize-3.1.15" rust-enum-ordinalize-3.1.15)
   (list "rust-enumflags2-0.7.12" rust-enumflags2-0.7.12)
   (list "rust-enumflags2-derive-0.7.12" rust-enumflags2-derive-0.7.12)
   (list "rust-env-filter-1.0.1" rust-env-filter-1.0.1)
   (list "rust-env-logger-0.11.10" rust-env-logger-0.11.10)
   (list "rust-equivalent-1.0.2" rust-equivalent-1.0.2)
   (list "rust-err-context-0.1.0" rust-err-context-0.1.0)
   (list "rust-errno-0.2.8" rust-errno-0.2.8)
   (list "rust-errno-0.3.14" rust-errno-0.3.14)
   (list "rust-errno-dragonfly-0.1.2" rust-errno-dragonfly-0.1.2)
   (list "rust-event-listener-5.4.1" rust-event-listener-5.4.1)
   (list "rust-event-listener-strategy-0.5.4" rust-event-listener-strategy-0.5.4)
   (list "rust-eyre-0.6.12" rust-eyre-0.6.12)
   (list "rust-fastrand-2.4.1" rust-fastrand-2.4.1)
   (list "rust-fiat-crypto-0.2.9" rust-fiat-crypto-0.2.9)
   (list "rust-find-msvc-tools-0.1.9" rust-find-msvc-tools-0.1.9)
   (list "rust-fixedbitset-0.5.7" rust-fixedbitset-0.5.7)
   (list "rust-flate2-1.1.9" rust-flate2-1.1.9)
   (list "rust-fluid-let-1.0.0" rust-fluid-let-1.0.0)
   (list "rust-fnv-1.0.7" rust-fnv-1.0.7)
   (list "rust-foldhash-0.1.5" rust-foldhash-0.1.5)
   (list "rust-foreign-types-0.3.2" rust-foreign-types-0.3.2)
   (list "rust-foreign-types-shared-0.1.1" rust-foreign-types-shared-0.1.1)
   (list "rust-form-urlencoded-1.2.2" rust-form-urlencoded-1.2.2)
   (list "rust-fs-err-2.11.0" rust-fs-err-2.11.0)
   (list "rust-fsevent-sys-4.1.0" rust-fsevent-sys-4.1.0)
   (list "rust-futures-0.3.33" rust-futures-0.3.33)
   (list "rust-futures-channel-0.3.33" rust-futures-channel-0.3.33)
   (list "rust-futures-core-0.3.33" rust-futures-core-0.3.33)
   (list "rust-futures-executor-0.3.33" rust-futures-executor-0.3.33)
   (list "rust-futures-io-0.3.33" rust-futures-io-0.3.33)
   (list "rust-futures-lite-2.6.1" rust-futures-lite-2.6.1)
   (list "rust-futures-macro-0.3.33" rust-futures-macro-0.3.33)
   (list "rust-futures-sink-0.3.33" rust-futures-sink-0.3.33)
   (list "rust-futures-task-0.3.33" rust-futures-task-0.3.33)
   (list "rust-futures-util-0.3.33" rust-futures-util-0.3.33)
   (list "rust-generic-array-0.14.7" rust-generic-array-0.14.7)
   (list "rust-getrandom-0.2.17" rust-getrandom-0.2.17)
   (list "rust-getrandom-0.3.4" rust-getrandom-0.3.4)
   (list "rust-getrandom-0.4.2" rust-getrandom-0.4.2)
   (list "rust-ghash-0.5.1" rust-ghash-0.5.1)
   (list "rust-glob-0.3.3" rust-glob-0.3.3)
   (list "rust-goblin-0.8.2" rust-goblin-0.8.2)
   (list "rust-gotatun-0.8.2" rust-gotatun-0.8.2)
   (list "rust-h2-0.4.13" rust-h2-0.4.13)
   (list "rust-h3-0.0.7" rust-h3-0.0.7)
   (list "rust-h3-datagram-0.0.1" rust-h3-datagram-0.0.1)
   (list "rust-h3-quinn-0.0.9" rust-h3-quinn-0.0.9)
   (list "rust-half-2.7.1" rust-half-2.7.1)
   (list "rust-hash32-0.3.1" rust-hash32-0.3.1)
   (list "rust-hashbrown-0.15.5" rust-hashbrown-0.15.5)
   (list "rust-hashbrown-0.17.0" rust-hashbrown-0.17.0)
   (list "rust-heapless-0.9.3" rust-heapless-0.9.3)
   (list "rust-heck-0.4.1" rust-heck-0.4.1)
   (list "rust-heck-0.5.0" rust-heck-0.5.0)
   (list "rust-hermit-abi-0.5.2" rust-hermit-abi-0.5.2)
   (list "rust-hex-0.4.3" rust-hex-0.4.3)
   (list "rust-hickory-net-0.26.1" rust-hickory-net-0.26.1)
   (list "rust-hickory-proto-0.26.1" rust-hickory-proto-0.26.1)
   (list "rust-hickory-resolver-0.26.1" rust-hickory-resolver-0.26.1)
   (list "rust-hickory-server-0.26.1" rust-hickory-server-0.26.1)
   (list "rust-hkdf-0.12.4" rust-hkdf-0.12.4)
   (list "rust-hmac-0.12.1" rust-hmac-0.12.1)
   (list "rust-home-0.5.12" rust-home-0.5.12)
   (list "rust-htmlize-1.1.0" rust-htmlize-1.1.0)
   (list "rust-http-1.4.0" rust-http-1.4.0)
   (list "rust-http-body-1.0.1" rust-http-body-1.0.1)
   (list "rust-http-body-util-0.1.3" rust-http-body-util-0.1.3)
   (list "rust-httparse-1.10.1" rust-httparse-1.10.1)
   (list "rust-httpdate-1.0.3" rust-httpdate-1.0.3)
   (list "rust-hybrid-array-0.2.3" rust-hybrid-array-0.2.3)
   (list "rust-hyper-1.9.0" rust-hyper-1.9.0)
   (list "rust-hyper-rustls-0.27.9" rust-hyper-rustls-0.27.9)
   (list "rust-hyper-timeout-0.5.2" rust-hyper-timeout-0.5.2)
   (list "rust-hyper-util-0.1.20" rust-hyper-util-0.1.20)
   (list "rust-iana-time-zone-0.1.65" rust-iana-time-zone-0.1.65)
   (list "rust-iana-time-zone-haiku-0.1.2" rust-iana-time-zone-haiku-0.1.2)
   (list "rust-icu-collections-2.1.1" rust-icu-collections-2.1.1)
   (list "rust-icu-locale-core-2.1.1" rust-icu-locale-core-2.1.1)
   (list "rust-icu-normalizer-2.1.1" rust-icu-normalizer-2.1.1)
   (list "rust-icu-normalizer-data-2.1.1" rust-icu-normalizer-data-2.1.1)
   (list "rust-icu-properties-2.1.2" rust-icu-properties-2.1.2)
   (list "rust-icu-properties-data-2.1.2" rust-icu-properties-data-2.1.2)
   (list "rust-icu-provider-2.1.1" rust-icu-provider-2.1.1)
   (list "rust-id-arena-2.3.0" rust-id-arena-2.3.0)
   (list "rust-ident-case-1.0.1" rust-ident-case-1.0.1)
   (list "rust-idna-1.1.0" rust-idna-1.1.0)
   (list "rust-idna-adapter-1.2.1" rust-idna-adapter-1.2.1)
   (list "rust-indenter-0.3.4" rust-indenter-0.3.4)
   (list "rust-indexmap-2.14.0" rust-indexmap-2.14.0)
   (list "rust-inotify-0.10.2" rust-inotify-0.10.2)
   (list "rust-inotify-0.11.1" rust-inotify-0.11.1)
   (list "rust-inotify-sys-0.1.5" rust-inotify-sys-0.1.5)
   (list "rust-inout-0.1.4" rust-inout-0.1.4)
   (list "rust-insta-1.47.2" rust-insta-1.47.2)
   (list "rust-internet-checksum-0.2.1" rust-internet-checksum-0.2.1)
   (list "rust-ioctl-sys-0.6.0" rust-ioctl-sys-0.6.0)
   (list "rust-ioctl-sys-0.8.0" rust-ioctl-sys-0.8.0)
   (list "rust-ip-network-0.4.1" rust-ip-network-0.4.1)
   (list "rust-ip-network-table-0.2.0" rust-ip-network-table-0.2.0)
   (list "rust-ip-network-table-deps-treebitmap-0.5.0" rust-ip-network-table-deps-treebitmap-0.5.0)
   (list "rust-ipconfig-0.3.4" rust-ipconfig-0.3.4)
   (list "rust-ipnet-2.12.0" rust-ipnet-2.12.0)
   (list "rust-ipnetwork-0.21.1" rust-ipnetwork-0.21.1)
   (list "rust-iri-string-0.7.12" rust-iri-string-0.7.12)
   (list "rust-is-terminal-polyfill-1.70.2" rust-is-terminal-polyfill-1.70.2)
   (list "rust-itertools-0.13.0" rust-itertools-0.13.0)
   (list "rust-itertools-0.14.0" rust-itertools-0.14.0)
   (list "rust-itoa-1.0.18" rust-itoa-1.0.18)
   (list "rust-jni-0.19.0" rust-jni-0.19.0)
   (list "rust-jni-0.22.4" rust-jni-0.22.4)
   (list "rust-jni-macros-0.22.4" rust-jni-macros-0.22.4)
   (list "rust-jni-sys-0.3.1" rust-jni-sys-0.3.1)
   (list "rust-jni-sys-0.4.1" rust-jni-sys-0.4.1)
   (list "rust-jni-sys-macros-0.4.1" rust-jni-sys-macros-0.4.1)
   (list "rust-jnix-0.5.3" rust-jnix-0.5.3)
   (list "rust-jnix-macros-0.4.1" rust-jnix-macros-0.4.1)
   (list "rust-jobserver-0.1.34" rust-jobserver-0.1.34)
   (list "rust-js-sys-0.3.97" rust-js-sys-0.3.97)
   (list "rust-json-canon-0.1.3" rust-json-canon-0.1.3)
   (list "rust-keccak-0.1.6" rust-keccak-0.1.6)
   (list "rust-kem-0.3.0-pre.0" rust-kem-0.3.0-pre.0)
   (list "rust-kqueue-1.1.1" rust-kqueue-1.1.1)
   (list "rust-kqueue-sys-1.0.4" rust-kqueue-sys-1.0.4)
   (list "rust-lazy-static-1.5.0" rust-lazy-static-1.5.0)
   (list "rust-leb128fmt-0.1.0" rust-leb128fmt-0.1.0)
   (list "rust-libc-0.2.189" rust-libc-0.2.189)
   (list "rust-libdbus-sys-0.2.7" rust-libdbus-sys-0.2.7)
   (list "rust-libloading-0.8.9" rust-libloading-0.8.9)
   (list "rust-libloading-0.9.0" rust-libloading-0.9.0)
   (list "rust-libm-0.2.16" rust-libm-0.2.16)
   (list "rust-libredox-0.1.16" rust-libredox-0.1.16)
   (list "rust-linkme-0.3.36" rust-linkme-0.3.36)
   (list "rust-linkme-impl-0.3.36" rust-linkme-impl-0.3.36)
   (list "rust-linux-raw-sys-0.4.15" rust-linux-raw-sys-0.4.15)
   (list "rust-linux-raw-sys-0.12.1" rust-linux-raw-sys-0.12.1)
   (list "rust-litemap-0.8.2" rust-litemap-0.8.2)
   (list "rust-lock-api-0.4.14" rust-lock-api-0.4.14)
   (list "rust-log-0.4.33" rust-log-0.4.33)
   (list "rust-log-panics-2.1.0" rust-log-panics-2.1.0)
   (list "rust-lru-slab-0.1.2" rust-lru-slab-0.1.2)
   (list "rust-malloc-buf-0.0.6" rust-malloc-buf-0.0.6)
   (list "rust-managed-0.8.0" rust-managed-0.8.0)
   (list "rust-matchers-0.2.0" rust-matchers-0.2.0)
   (list "rust-matchit-0.8.4" rust-matchit-0.8.4)
   (list "rust-maybenot-2.2.2" rust-maybenot-2.2.2)
   (list "rust-md-5-0.10.6" rust-md-5-0.10.6)
   (list "rust-memchr-2.8.0" rust-memchr-2.8.0)
   (list "rust-memoffset-0.6.5" rust-memoffset-0.6.5)
   (list "rust-memoffset-0.9.1" rust-memoffset-0.9.1)
   (list "rust-mime-0.3.17" rust-mime-0.3.17)
   (list "rust-minimal-lexical-0.2.1" rust-minimal-lexical-0.2.1)
   (list "rust-miniz-oxide-0.8.9" rust-miniz-oxide-0.8.9)
   (list "rust-mio-1.2.0" rust-mio-1.2.0)
   (list "rust-ml-kem-0.2.3" rust-ml-kem-0.2.3)
   (list "rust-mnl-0.3.1" rust-mnl-0.3.1)
   (list "rust-mnl-sys-0.2.2" rust-mnl-sys-0.2.2)
   (list "rust-mockito-1.7.2" rust-mockito-1.7.2)
   (list "rust-moka-0.12.15" rust-moka-0.12.15)
   (list "rust-multimap-0.10.1" rust-multimap-0.10.1)
   (list "rust-native-windows-gui-1.0.13" rust-native-windows-gui-1.0.13)
   (list "rust-natord-1.0.9" rust-natord-1.0.9)
   (list "rust-ndk-context-0.1.1" rust-ndk-context-0.1.1)
   (list "rust-ndk-sys-0.5.0+25.2.9519653" rust-ndk-sys-0.5.0+25.2.9519653)
   (list "rust-neon-1.1.1" rust-neon-1.1.1)
   (list "rust-neon-macros-1.1.1" rust-neon-macros-1.1.1)
   (list "rust-netlink-packet-core-0.8.1" rust-netlink-packet-core-0.8.1)
   (list "rust-netlink-packet-route-0.30.0" rust-netlink-packet-route-0.30.0)
   (list "rust-netlink-proto-0.12.0" rust-netlink-proto-0.12.0)
   (list "rust-netlink-sys-0.8.8" rust-netlink-sys-0.8.8)
   (list "rust-nftnl-0.9.2" rust-nftnl-0.9.2)
   (list "rust-nftnl-sys-0.6.4" rust-nftnl-sys-0.6.4)
   (list "rust-nix-0.30.1" rust-nix-0.30.1)
   (list "rust-nix-0.31.3" rust-nix-0.31.3)
   (list "rust-no-std-net-0.6.0" rust-no-std-net-0.6.0)
   (list "rust-nom-7.1.3" rust-nom-7.1.3)
   (list "rust-notify-8.2.0" rust-notify-8.2.0)
   (list "rust-notify-types-2.1.0" rust-notify-types-2.1.0)
   (list "rust-nu-ansi-term-0.50.3" rust-nu-ansi-term-0.50.3)
   (list "rust-num-bigint-0.4.6" rust-num-bigint-0.4.6)
   (list "rust-num-conv-0.2.1" rust-num-conv-0.2.1)
   (list "rust-num-integer-0.1.46" rust-num-integer-0.1.46)
   (list "rust-num-traits-0.2.19" rust-num-traits-0.2.19)
   (list "rust-objc-0.2.7" rust-objc-0.2.7)
   (list "rust-objc-sys-0.3.5" rust-objc-sys-0.3.5)
   (list "rust-objc2-0.5.2" rust-objc2-0.5.2)
   (list "rust-objc2-0.6.4" rust-objc2-0.6.4)
   (list "rust-objc2-app-kit-0.2.2" rust-objc2-app-kit-0.2.2)
   (list "rust-objc2-cloud-kit-0.3.2" rust-objc2-cloud-kit-0.3.2)
   (list "rust-objc2-core-data-0.2.2" rust-objc2-core-data-0.2.2)
   (list "rust-objc2-core-data-0.3.2" rust-objc2-core-data-0.3.2)
   (list "rust-objc2-core-foundation-0.3.2" rust-objc2-core-foundation-0.3.2)
   (list "rust-objc2-core-graphics-0.3.2" rust-objc2-core-graphics-0.3.2)
   (list "rust-objc2-core-image-0.2.2" rust-objc2-core-image-0.2.2)
   (list "rust-objc2-core-image-0.3.2" rust-objc2-core-image-0.3.2)
   (list "rust-objc2-core-location-0.3.2" rust-objc2-core-location-0.3.2)
   (list "rust-objc2-core-text-0.3.2" rust-objc2-core-text-0.3.2)
   (list "rust-objc2-encode-4.1.0" rust-objc2-encode-4.1.0)
   (list "rust-objc2-foundation-0.2.2" rust-objc2-foundation-0.2.2)
   (list "rust-objc2-foundation-0.3.2" rust-objc2-foundation-0.3.2)
   (list "rust-objc2-io-surface-0.3.2" rust-objc2-io-surface-0.3.2)
   (list "rust-objc2-metal-0.2.2" rust-objc2-metal-0.2.2)
   (list "rust-objc2-quartz-core-0.2.2" rust-objc2-quartz-core-0.2.2)
   (list "rust-objc2-quartz-core-0.3.2" rust-objc2-quartz-core-0.3.2)
   (list "rust-objc2-security-0.3.2" rust-objc2-security-0.3.2)
   (list "rust-objc2-service-management-0.3.2" rust-objc2-service-management-0.3.2)
   (list "rust-objc2-ui-kit-0.3.2" rust-objc2-ui-kit-0.3.2)
   (list "rust-objc2-user-notifications-0.3.2" rust-objc2-user-notifications-0.3.2)
   (list "rust-objc-id-0.1.1" rust-objc-id-0.1.1)
   (list "rust-once-cell-1.21.4" rust-once-cell-1.21.4)
   (list "rust-once-cell-polyfill-1.70.2" rust-once-cell-polyfill-1.70.2)
   (list "rust-oorandom-11.1.5" rust-oorandom-11.1.5)
   (list "rust-opaque-debug-0.3.1" rust-opaque-debug-0.3.1)
   (list "rust-option-ext-0.2.0" rust-option-ext-0.2.0)
   (list "rust-ordered-stream-0.2.0" rust-ordered-stream-0.2.0)
   (list "rust-os-info-3.14.0" rust-os-info-3.14.0)
   (list "rust-papaya-0.2.4" rust-papaya-0.2.4)
   (list "rust-paranoid-android-0.2.2" rust-paranoid-android-0.2.2)
   (list "rust-parking-2.2.1" rust-parking-2.2.1)
   (list "rust-parking-lot-0.12.5" rust-parking-lot-0.12.5)
   (list "rust-parking-lot-core-0.9.12" rust-parking-lot-core-0.9.12)
   (list "rust-paste-1.0.15" rust-paste-1.0.15)
   (list "rust-pastey-0.1.1" rust-pastey-0.1.1)
   (list "rust-pcap-2.4.0" rust-pcap-2.4.0)
   (list "rust-pcap-file-2.0.0" rust-pcap-file-2.0.0)
   (list "rust-percent-encoding-2.3.2" rust-percent-encoding-2.3.2)
   (list "rust-petgraph-0.8.3" rust-petgraph-0.8.3)
   (list "rust-pfctl-0.7.0" rust-pfctl-0.7.0)
   (list "rust-phf-0.13.1" rust-phf-0.13.1)
   (list "rust-phf-codegen-0.13.1" rust-phf-codegen-0.13.1)
   (list "rust-phf-generator-0.13.1" rust-phf-generator-0.13.1)
   (list "rust-phf-shared-0.13.1" rust-phf-shared-0.13.1)
   (list "rust-pin-project-1.1.11" rust-pin-project-1.1.11)
   (list "rust-pin-project-internal-1.1.11" rust-pin-project-internal-1.1.11)
   (list "rust-pin-project-lite-0.2.17" rust-pin-project-lite-0.2.17)
   (list "rust-piper-0.2.5" rust-piper-0.2.5)
   (list "rust-pkcs8-0.10.2" rust-pkcs8-0.10.2)
   (list "rust-pkg-config-0.3.33" rust-pkg-config-0.3.33)
   (list "rust-plain-0.2.3" rust-plain-0.2.3)
   (list "rust-plotters-0.3.7" rust-plotters-0.3.7)
   (list "rust-plotters-backend-0.3.7" rust-plotters-backend-0.3.7)
   (list "rust-plotters-svg-0.3.7" rust-plotters-svg-0.3.7)
   (list "rust-pnet-base-0.34.0" rust-pnet-base-0.34.0)
   (list "rust-pnet-base-0.35.0" rust-pnet-base-0.35.0)
   (list "rust-pnet-macros-0.34.0" rust-pnet-macros-0.34.0)
   (list "rust-pnet-macros-0.35.0" rust-pnet-macros-0.35.0)
   (list "rust-pnet-macros-support-0.34.0" rust-pnet-macros-support-0.34.0)
   (list "rust-pnet-macros-support-0.35.0" rust-pnet-macros-support-0.35.0)
   (list "rust-pnet-packet-0.34.0" rust-pnet-packet-0.34.0)
   (list "rust-pnet-packet-0.35.0" rust-pnet-packet-0.35.0)
   (list "rust-polling-3.11.0" rust-polling-3.11.0)
   (list "rust-poly1305-0.8.0" rust-poly1305-0.8.0)
   (list "rust-polyval-0.6.2" rust-polyval-0.6.2)
   (list "rust-portable-atomic-1.13.1" rust-portable-atomic-1.13.1)
   (list "rust-potential-utf-0.1.4" rust-potential-utf-0.1.4)
   (list "rust-powerfmt-0.2.0" rust-powerfmt-0.2.0)
   (list "rust-ppv-lite86-0.2.21" rust-ppv-lite86-0.2.21)
   (list "rust-pqcrypto-hqc-0.2.2" rust-pqcrypto-hqc-0.2.2)
   (list "rust-pqcrypto-internals-0.2.11" rust-pqcrypto-internals-0.2.11)
   (list "rust-pqcrypto-traits-0.3.5" rust-pqcrypto-traits-0.3.5)
   (list "rust-prefix-trie-0.8.3" rust-prefix-trie-0.8.3)
   (list "rust-prettyplease-0.2.37" rust-prettyplease-0.2.37)
   (list "rust-proc-macro-crate-3.5.0" rust-proc-macro-crate-3.5.0)
   (list "rust-proc-macro2-1.0.103" rust-proc-macro2-1.0.103)
   (list "rust-proptest-1.11.0" rust-proptest-1.11.0)
   (list "rust-prost-0.14.3" rust-prost-0.14.3)
   (list "rust-prost-build-0.14.3" rust-prost-build-0.14.3)
   (list "rust-prost-derive-0.14.3" rust-prost-derive-0.14.3)
   (list "rust-prost-types-0.14.3" rust-prost-types-0.14.3)
   (list "rust-quick-error-1.2.3" rust-quick-error-1.2.3)
   (list "rust-quick-xml-0.41.0" rust-quick-xml-0.41.0)
   (list "rust-quinn-0.11.9" rust-quinn-0.11.9)
   (list "rust-quinn-proto-0.11.15" rust-quinn-proto-0.11.15)
   (list "rust-quinn-udp-0.5.14" rust-quinn-udp-0.5.14)
   (list "rust-quote-1.0.40" rust-quote-1.0.40)
   (list "rust-r-efi-5.3.0" rust-r-efi-5.3.0)
   (list "rust-r-efi-6.0.0" rust-r-efi-6.0.0)
   (list "rust-rand-0.9.4" rust-rand-0.9.4)
   (list "rust-rand-0.10.1" rust-rand-0.10.1)
   (list "rust-rand-chacha-0.9.0" rust-rand-chacha-0.9.0)
   (list "rust-rand-core-0.6.4" rust-rand-core-0.6.4)
   (list "rust-rand-core-0.9.5" rust-rand-core-0.9.5)
   (list "rust-rand-core-0.10.1" rust-rand-core-0.10.1)
   (list "rust-rand-distr-0.5.1" rust-rand-distr-0.5.1)
   (list "rust-rand-xorshift-0.4.0" rust-rand-xorshift-0.4.0)
   (list "rust-rayon-1.12.0" rust-rayon-1.12.0)
   (list "rust-rayon-core-1.13.0" rust-rayon-core-1.13.0)
   (list "rust-redox-syscall-0.5.18" rust-redox-syscall-0.5.18)
   (list "rust-redox-users-0.5.2" rust-redox-users-0.5.2)
   (list "rust-regex-1.12.3" rust-regex-1.12.3)
   (list "rust-regex-automata-0.4.14" rust-regex-automata-0.4.14)
   (list "rust-regex-lite-0.1.9" rust-regex-lite-0.1.9)
   (list "rust-regex-syntax-0.8.10" rust-regex-syntax-0.8.10)
   (list "rust-reqwest-0.12.28" rust-reqwest-0.12.28)
   (list "rust-resolv-conf-0.7.6" rust-resolv-conf-0.7.6)
   (list "rust-ring-0.17.14" rust-ring-0.17.14)
   (list "rust-ring-compat-0.8.0" rust-ring-compat-0.8.0)
   (list "rust-rs-release-0.1.11" rust-rs-release-0.1.11)
   (list "rust-rtnetlink-0.21.0" rust-rtnetlink-0.21.0)
   (list "rust-rustc-hash-2.1.2" rust-rustc-hash-2.1.2)
   (list "rust-rustc-version-0.4.1" rust-rustc-version-0.4.1)
   (list "rust-rustix-0.38.44" rust-rustix-0.38.44)
   (list "rust-rustix-1.1.4" rust-rustix-1.1.4)
   (list "rust-rustls-0.23.40" rust-rustls-0.23.40)
   (list "rust-rustls-pki-types-1.14.1" rust-rustls-pki-types-1.14.1)
   (list "rust-rustls-webpki-0.103.13" rust-rustls-webpki-0.103.13)
   (list "rust-rustversion-1.0.22" rust-rustversion-1.0.22)
   (list "rust-rusty-fork-0.3.1" rust-rusty-fork-0.3.1)
   (list "rust-ryu-1.0.23" rust-ryu-1.0.23)
   (list "rust-ryu-js-0.2.2" rust-ryu-js-0.2.2)
   (list "rust-safelog-0.8.2" rust-safelog-0.8.2)
   (list "rust-same-file-1.0.6" rust-same-file-1.0.6)
   (list "rust-scopeguard-1.2.0" rust-scopeguard-1.2.0)
   (list "rust-scroll-0.12.0" rust-scroll-0.12.0)
   (list "rust-scroll-derive-0.12.1" rust-scroll-derive-0.12.1)
   (list "rust-sealed-0.6.0" rust-sealed-0.6.0)
   (list "rust-seize-0.5.1" rust-seize-0.5.1)
   (list "rust-semver-1.0.28" rust-semver-1.0.28)
   (list "rust-send-wrapper-0.6.0" rust-send-wrapper-0.6.0)
   (list "rust-sendfd-0.4.4" rust-sendfd-0.4.4)
   (list "rust-serde-1.0.228" rust-serde-1.0.228)
   (list "rust-serde-core-1.0.228" rust-serde-core-1.0.228)
   (list "rust-serde-derive-1.0.228" rust-serde-derive-1.0.228)
   (list "rust-serde-json-1.0.151" rust-serde-json-1.0.151)
   (list "rust-serde-repr-0.1.20" rust-serde-repr-0.1.20)
   (list "rust-serde-spanned-0.6.9" rust-serde-spanned-0.6.9)
   (list "rust-serde-urlencoded-0.7.1" rust-serde-urlencoded-0.7.1)
   (list "rust-sha1-0.10.6" rust-sha1-0.10.6)
   (list "rust-sha2-0.10.9" rust-sha2-0.10.9)
   (list "rust-sha256-1.6.0" rust-sha256-1.6.0)
   (list "rust-sha3-0.10.9" rust-sha3-0.10.9)
   (list "rust-shadowsocks-1.24.0" rust-shadowsocks-1.24.0)
   (list "rust-shadowsocks-crypto-0.6.2" rust-shadowsocks-crypto-0.6.2)
   (list "rust-sharded-slab-0.1.7" rust-sharded-slab-0.1.7)
   (list "rust-shlex-1.3.0" rust-shlex-1.3.0)
   (list "rust-signal-hook-registry-1.4.8" rust-signal-hook-registry-1.4.8)
   (list "rust-signature-2.2.0" rust-signature-2.2.0)
   (list "rust-simd-adler32-0.3.9" rust-simd-adler32-0.3.9)
   (list "rust-simd-cesu8-1.1.1" rust-simd-cesu8-1.1.1)
   (list "rust-simdutf8-0.1.5" rust-simdutf8-0.1.5)
   (list "rust-similar-2.7.0" rust-similar-2.7.0)
   (list "rust-siphasher-1.0.2" rust-siphasher-1.0.2)
   (list "rust-slab-0.4.12" rust-slab-0.4.12)
   (list "rust-smallvec-1.15.1" rust-smallvec-1.15.1)
   (list "rust-smawk-0.3.3" rust-smawk-0.3.3)
   (list "rust-smoltcp-0.13.1" rust-smoltcp-0.13.1)
   (list "rust-socket2-0.5.10" rust-socket2-0.5.10)
   (list "rust-socket2-0.6.3" rust-socket2-0.6.3)
   (list "rust-spin-0.10.1" rust-spin-0.10.1)
   (list "rust-spki-0.7.3" rust-spki-0.7.3)
   (list "rust-stable-deref-trait-1.2.1" rust-stable-deref-trait-1.2.1)
   (list "rust-static-assertions-1.1.0" rust-static-assertions-1.1.0)
   (list "rust-strsim-0.11.1" rust-strsim-0.11.1)
   (list "rust-strum-0.27.2" rust-strum-0.27.2)
   (list "rust-strum-macros-0.27.2" rust-strum-macros-0.27.2)
   (list "rust-subtle-2.6.1" rust-subtle-2.6.1)
   (list "rust-surge-ping-0.8.4" rust-surge-ping-0.8.4)
   (list "rust-symlink-0.1.0" rust-symlink-0.1.0)
   (list "rust-syn-1.0.109" rust-syn-1.0.109)
   (list "rust-syn-2.0.106" rust-syn-2.0.106)
   (list "rust-syn-3.0.3" rust-syn-3.0.3)
   (list "rust-sync-wrapper-1.0.2" rust-sync-wrapper-1.0.2)
   (list "rust-synstructure-0.13.2" rust-synstructure-0.13.2)
   (list "rust-system-configuration-0.7.0" rust-system-configuration-0.7.0)
   (list "rust-system-configuration-sys-0.6.0" rust-system-configuration-sys-0.6.0)
   (list "rust-tagptr-0.2.0" rust-tagptr-0.2.0)
   (list "rust-tempfile-3.27.0" rust-tempfile-3.27.0)
   (list "rust-test-log-0.2.20" rust-test-log-0.2.20)
   (list "rust-test-log-core-0.2.20" rust-test-log-core-0.2.20)
   (list "rust-test-log-macros-0.2.20" rust-test-log-macros-0.2.20)
   (list "rust-textwrap-0.16.2" rust-textwrap-0.16.2)
   (list "rust-thiserror-1.0.69" rust-thiserror-1.0.69)
   (list "rust-thiserror-2.0.19" rust-thiserror-2.0.19)
   (list "rust-thiserror-impl-1.0.69" rust-thiserror-impl-1.0.69)
   (list "rust-thiserror-impl-2.0.19" rust-thiserror-impl-2.0.19)
   (list "rust-thread-local-1.1.9" rust-thread-local-1.1.9)
   (list "rust-tikv-jemalloc-sys-0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7" rust-tikv-jemalloc-sys-0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7)
   (list "rust-tikv-jemallocator-0.6.1" rust-tikv-jemallocator-0.6.1)
   (list "rust-time-0.3.47" rust-time-0.3.47)
   (list "rust-time-core-0.1.8" rust-time-core-0.1.8)
   (list "rust-time-macros-0.2.27" rust-time-macros-0.2.27)
   (list "rust-tinystr-0.8.2" rust-tinystr-0.8.2)
   (list "rust-tinytemplate-1.2.1" rust-tinytemplate-1.2.1)
   (list "rust-tinyvec-1.11.0" rust-tinyvec-1.11.0)
   (list "rust-tinyvec-macros-0.1.1" rust-tinyvec-macros-0.1.1)
   (list "rust-tipsy-0.7.0" rust-tipsy-0.7.0)
   (list "rust-tokio-1.53.1" rust-tokio-1.53.1)
   (list "rust-tokio-macros-2.7.0" rust-tokio-macros-2.7.0)
   (list "rust-tokio-rustls-0.26.4" rust-tokio-rustls-0.26.4)
   (list "rust-tokio-socks-0.5.2" rust-tokio-socks-0.5.2)
   (list "rust-tokio-stream-0.1.18" rust-tokio-stream-0.1.18)
   (list "rust-tokio-tfo-0.4.3" rust-tokio-tfo-0.4.3)
   (list "rust-tokio-util-0.6.10" rust-tokio-util-0.6.10)
   (list "rust-tokio-util-0.7.18" rust-tokio-util-0.7.18)
   (list "rust-toml-0.5.11" rust-toml-0.5.11)
   (list "rust-toml-0.8.23" rust-toml-0.8.23)
   (list "rust-toml-datetime-0.6.11" rust-toml-datetime-0.6.11)
   (list "rust-toml-datetime-1.1.1+spec-1.1.0" rust-toml-datetime-1.1.1+spec-1.1.0)
   (list "rust-toml-edit-0.22.27" rust-toml-edit-0.22.27)
   (list "rust-toml-edit-0.25.11+spec-1.1.0" rust-toml-edit-0.25.11+spec-1.1.0)
   (list "rust-toml-parser-1.1.2+spec-1.1.0" rust-toml-parser-1.1.2+spec-1.1.0)
   (list "rust-toml-write-0.1.2" rust-toml-write-0.1.2)
   (list "rust-tonic-0.14.6" rust-tonic-0.14.6)
   (list "rust-tonic-build-0.14.6" rust-tonic-build-0.14.6)
   (list "rust-tonic-prost-0.14.6" rust-tonic-prost-0.14.6)
   (list "rust-tonic-prost-build-0.14.6" rust-tonic-prost-build-0.14.6)
   (list "rust-tower-0.5.3" rust-tower-0.5.3)
   (list "rust-tower-http-0.6.8" rust-tower-http-0.6.8)
   (list "rust-tower-layer-0.3.3" rust-tower-layer-0.3.3)
   (list "rust-tower-service-0.3.3" rust-tower-service-0.3.3)
   (list "rust-tracing-0.1.44" rust-tracing-0.1.44)
   (list "rust-tracing-appender-0.2.5" rust-tracing-appender-0.2.5)
   (list "rust-tracing-attributes-0.1.31" rust-tracing-attributes-0.1.31)
   (list "rust-tracing-core-0.1.36" rust-tracing-core-0.1.36)
   (list "rust-tracing-log-0.2.0" rust-tracing-log-0.2.0)
   (list "rust-tracing-subscriber-0.3.23" rust-tracing-subscriber-0.3.23)
   (list "rust-trait-variant-0.1.2" rust-trait-variant-0.1.2)
   (list "rust-triggered-0.1.3" rust-triggered-0.1.3)
   (list "rust-try-lock-0.2.5" rust-try-lock-0.2.5)
   (list "rust-tun-0.5.5" rust-tun-0.5.5)
   (list "rust-tun-0.8.14" rust-tun-0.8.14)
   (list "rust-typed-builder-0.20.1" rust-typed-builder-0.20.1)
   (list "rust-typed-builder-0.21.2" rust-typed-builder-0.21.2)
   (list "rust-typed-builder-macro-0.20.1" rust-typed-builder-macro-0.20.1)
   (list "rust-typed-builder-macro-0.21.2" rust-typed-builder-macro-0.21.2)
   (list "rust-typenum-1.20.0" rust-typenum-1.20.0)
   (list "rust-udp-over-tcp-0.4.0.5c6d8f4" rust-udp-over-tcp-0.4.0.5c6d8f4)
   (list "rust-uds-windows-1.2.1" rust-uds-windows-1.2.1)
   (list "rust-unarray-0.1.4" rust-unarray-0.1.4)
   (list "rust-unicode-ident-1.0.22" rust-unicode-ident-1.0.22)
   (list "rust-unicode-segmentation-1.13.2" rust-unicode-segmentation-1.13.2)
   (list "rust-unicode-xid-0.2.6" rust-unicode-xid-0.2.6)
   (list "rust-uniffi-0.31.2" rust-uniffi-0.31.2)
   (list "rust-uniffi-bindgen-0.31.2" rust-uniffi-bindgen-0.31.2)
   (list "rust-uniffi-core-0.31.2" rust-uniffi-core-0.31.2)
   (list "rust-uniffi-internal-macros-0.31.2" rust-uniffi-internal-macros-0.31.2)
   (list "rust-uniffi-macros-0.31.2" rust-uniffi-macros-0.31.2)
   (list "rust-uniffi-meta-0.31.2" rust-uniffi-meta-0.31.2)
   (list "rust-uniffi-pipeline-0.31.2" rust-uniffi-pipeline-0.31.2)
   (list "rust-uniffi-udl-0.31.2" rust-uniffi-udl-0.31.2)
   (list "rust-universal-hash-0.5.1" rust-universal-hash-0.5.1)
   (list "rust-untrusted-0.9.0" rust-untrusted-0.9.0)
   (list "rust-url-2.5.8" rust-url-2.5.8)
   (list "rust-utf8-iter-1.0.4" rust-utf8-iter-1.0.4)
   (list "rust-utf8parse-0.2.2" rust-utf8parse-0.2.2)
   (list "rust-uuid-1.23.1" rust-uuid-1.23.1)
   (list "rust-valuable-0.1.1" rust-valuable-0.1.1)
   (list "rust-vec1-1.12.1" rust-vec1-1.12.1)
   (list "rust-version-check-0.9.5" rust-version-check-0.9.5)
   (list "rust-wait-timeout-0.2.1" rust-wait-timeout-0.2.1)
   (list "rust-walkdir-2.5.0" rust-walkdir-2.5.0)
   (list "rust-want-0.3.1" rust-want-0.3.1)
   (list "rust-wasi-0.11.1+wasi-snapshot-preview1" rust-wasi-0.11.1+wasi-snapshot-preview1)
   (list "rust-wasip2-1.0.3+wasi-0.2.9" rust-wasip2-1.0.3+wasi-0.2.9)
   (list "rust-wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06" rust-wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06)
   (list "rust-wasm-bindgen-0.2.120" rust-wasm-bindgen-0.2.120)
   (list "rust-wasm-bindgen-futures-0.4.70" rust-wasm-bindgen-futures-0.4.70)
   (list "rust-wasm-bindgen-macro-0.2.120" rust-wasm-bindgen-macro-0.2.120)
   (list "rust-wasm-bindgen-macro-support-0.2.120" rust-wasm-bindgen-macro-support-0.2.120)
   (list "rust-wasm-bindgen-shared-0.2.120" rust-wasm-bindgen-shared-0.2.120)
   (list "rust-wasm-encoder-0.244.0" rust-wasm-encoder-0.244.0)
   (list "rust-wasm-metadata-0.244.0" rust-wasm-metadata-0.244.0)
   (list "rust-wasmparser-0.244.0" rust-wasmparser-0.244.0)
   (list "rust-web-sys-0.3.97" rust-web-sys-0.3.97)
   (list "rust-web-time-1.1.0" rust-web-time-1.1.0)
   (list "rust-webpki-roots-1.0.7" rust-webpki-roots-1.0.7)
   (list "rust-weedle2-5.0.0" rust-weedle2-5.0.0)
   (list "rust-which-4.4.2" rust-which-4.4.2)
   (list "rust-widestring-1.2.1" rust-widestring-1.2.1)
   (list "rust-winapi-0.3.9" rust-winapi-0.3.9)
   (list "rust-winapi-build-0.1.1" rust-winapi-build-0.1.1)
   (list "rust-winapi-i686-pc-windows-gnu-0.4.0" rust-winapi-i686-pc-windows-gnu-0.4.0)
   (list "rust-winapi-util-0.1.11" rust-winapi-util-0.1.11)
   (list "rust-winapi-x86-64-pc-windows-gnu-0.4.0" rust-winapi-x86-64-pc-windows-gnu-0.4.0)
   (list "rust-windows-0.62.2" rust-windows-0.62.2)
   (list "rust-windows-collections-0.3.2" rust-windows-collections-0.3.2)
   (list "rust-windows-core-0.62.2" rust-windows-core-0.62.2)
   (list "rust-windows-future-0.3.2" rust-windows-future-0.3.2)
   (list "rust-windows-implement-0.60.2" rust-windows-implement-0.60.2)
   (list "rust-windows-interface-0.59.3" rust-windows-interface-0.59.3)
   (list "rust-windows-link-0.2.1" rust-windows-link-0.2.1)
   (list "rust-windows-numerics-0.3.1" rust-windows-numerics-0.3.1)
   (list "rust-windows-registry-0.6.1" rust-windows-registry-0.6.1)
   (list "rust-windows-result-0.4.1" rust-windows-result-0.4.1)
   (list "rust-windows-service-0.6.0" rust-windows-service-0.6.0)
   (list "rust-windows-strings-0.5.1" rust-windows-strings-0.5.1)
   (list "rust-windows-sys-0.36.1" rust-windows-sys-0.36.1)
   (list "rust-windows-sys-0.45.0" rust-windows-sys-0.45.0)
   (list "rust-windows-sys-0.52.0" rust-windows-sys-0.52.0)
   (list "rust-windows-sys-0.59.0" rust-windows-sys-0.59.0)
   (list "rust-windows-sys-0.60.2" rust-windows-sys-0.60.2)
   (list "rust-windows-sys-0.61.2" rust-windows-sys-0.61.2)
   (list "rust-windows-targets-0.42.2" rust-windows-targets-0.42.2)
   (list "rust-windows-targets-0.52.6" rust-windows-targets-0.52.6)
   (list "rust-windows-targets-0.53.5" rust-windows-targets-0.53.5)
   (list "rust-windows-threading-0.2.1" rust-windows-threading-0.2.1)
   (list "rust-windows-aarch64-gnullvm-0.42.2" rust-windows-aarch64-gnullvm-0.42.2)
   (list "rust-windows-aarch64-gnullvm-0.52.6" rust-windows-aarch64-gnullvm-0.52.6)
   (list "rust-windows-aarch64-gnullvm-0.53.1" rust-windows-aarch64-gnullvm-0.53.1)
   (list "rust-windows-aarch64-msvc-0.36.1" rust-windows-aarch64-msvc-0.36.1)
   (list "rust-windows-aarch64-msvc-0.42.2" rust-windows-aarch64-msvc-0.42.2)
   (list "rust-windows-aarch64-msvc-0.52.6" rust-windows-aarch64-msvc-0.52.6)
   (list "rust-windows-aarch64-msvc-0.53.1" rust-windows-aarch64-msvc-0.53.1)
   (list "rust-windows-i686-gnu-0.36.1" rust-windows-i686-gnu-0.36.1)
   (list "rust-windows-i686-gnu-0.42.2" rust-windows-i686-gnu-0.42.2)
   (list "rust-windows-i686-gnu-0.52.6" rust-windows-i686-gnu-0.52.6)
   (list "rust-windows-i686-gnu-0.53.1" rust-windows-i686-gnu-0.53.1)
   (list "rust-windows-i686-gnullvm-0.52.6" rust-windows-i686-gnullvm-0.52.6)
   (list "rust-windows-i686-gnullvm-0.53.1" rust-windows-i686-gnullvm-0.53.1)
   (list "rust-windows-i686-msvc-0.36.1" rust-windows-i686-msvc-0.36.1)
   (list "rust-windows-i686-msvc-0.42.2" rust-windows-i686-msvc-0.42.2)
   (list "rust-windows-i686-msvc-0.52.6" rust-windows-i686-msvc-0.52.6)
   (list "rust-windows-i686-msvc-0.53.1" rust-windows-i686-msvc-0.53.1)
   (list "rust-windows-x86-64-gnu-0.36.1" rust-windows-x86-64-gnu-0.36.1)
   (list "rust-windows-x86-64-gnu-0.42.2" rust-windows-x86-64-gnu-0.42.2)
   (list "rust-windows-x86-64-gnu-0.52.6" rust-windows-x86-64-gnu-0.52.6)
   (list "rust-windows-x86-64-gnu-0.53.1" rust-windows-x86-64-gnu-0.53.1)
   (list "rust-windows-x86-64-gnullvm-0.42.2" rust-windows-x86-64-gnullvm-0.42.2)
   (list "rust-windows-x86-64-gnullvm-0.52.6" rust-windows-x86-64-gnullvm-0.52.6)
   (list "rust-windows-x86-64-gnullvm-0.53.1" rust-windows-x86-64-gnullvm-0.53.1)
   (list "rust-windows-x86-64-msvc-0.36.1" rust-windows-x86-64-msvc-0.36.1)
   (list "rust-windows-x86-64-msvc-0.42.2" rust-windows-x86-64-msvc-0.42.2)
   (list "rust-windows-x86-64-msvc-0.52.6" rust-windows-x86-64-msvc-0.52.6)
   (list "rust-windows-x86-64-msvc-0.53.1" rust-windows-x86-64-msvc-0.53.1)
   (list "rust-winnow-0.7.15" rust-winnow-0.7.15)
   (list "rust-winnow-1.0.2" rust-winnow-1.0.2)
   (list "rust-winres-0.1.12" rust-winres-0.1.12)
   (list "rust-wintun-bindings-0.7.39" rust-wintun-bindings-0.7.39)
   (list "rust-wit-bindgen-0.51.0" rust-wit-bindgen-0.51.0)
   (list "rust-wit-bindgen-0.57.1" rust-wit-bindgen-0.57.1)
   (list "rust-wit-bindgen-core-0.51.0" rust-wit-bindgen-core-0.51.0)
   (list "rust-wit-bindgen-rust-0.51.0" rust-wit-bindgen-rust-0.51.0)
   (list "rust-wit-bindgen-rust-macro-0.51.0" rust-wit-bindgen-rust-macro-0.51.0)
   (list "rust-wit-component-0.244.0" rust-wit-component-0.244.0)
   (list "rust-wit-parser-0.244.0" rust-wit-parser-0.244.0)
   (list "rust-wmi-0.18.4" rust-wmi-0.18.4)
   (list "rust-writeable-0.6.3" rust-writeable-0.6.3)
   (list "rust-x25519-dalek-2.0.1" rust-x25519-dalek-2.0.1)
   (list "rust-yoke-0.8.1" rust-yoke-0.8.1)
   (list "rust-yoke-derive-0.8.1" rust-yoke-derive-0.8.1)
   (list "rust-zbus-5.15.0" rust-zbus-5.15.0)
   (list "rust-zbus-macros-5.15.0" rust-zbus-macros-5.15.0)
   (list "rust-zbus-names-4.3.2" rust-zbus-names-4.3.2)
   (list "rust-zerocopy-0.8.31" rust-zerocopy-0.8.31)
   (list "rust-zerocopy-derive-0.8.31" rust-zerocopy-derive-0.8.31)
   (list "rust-zerofrom-0.1.7" rust-zerofrom-0.1.7)
   (list "rust-zerofrom-derive-0.1.6" rust-zerofrom-derive-0.1.6)
   (list "rust-zeroize-1.8.2" rust-zeroize-1.8.2)
   (list "rust-zeroize-derive-1.4.3" rust-zeroize-derive-1.4.3)
   (list "rust-zerotrie-0.2.3" rust-zerotrie-0.2.3)
   (list "rust-zerovec-0.11.5" rust-zerovec-0.11.5)
   (list "rust-zerovec-derive-0.11.2" rust-zerovec-derive-0.11.2)
   (list "rust-zmij-1.0.21" rust-zmij-1.0.21)
   (list "rust-zvariant-5.10.1" rust-zvariant-5.10.1)
   (list "rust-zvariant-derive-5.10.1" rust-zvariant-derive-5.10.1)
   (list "rust-zvariant-utils-3.3.1" rust-zvariant-utils-3.3.1)
   ))
