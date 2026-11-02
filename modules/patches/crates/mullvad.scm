;;; -*- mode: scheme; -*-
;;
;;; Crate origins for mullvad-vpn 2026.1, generated from upstream Cargo.lock.
;;; Regenerate with tools/update-mullvad-crates.sh -- do not edit by hand.
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

(define rust-addr2line-0.25.1
  (crate-source "addr2line" "0.25.1"
                "0jwb96gv17vdr29hbzi0ha5q6jkpgjyn7rjlg5nis65k41rk0p8v"))

(define rust-adler2-2.0.0
  (crate-source "adler2" "2.0.0"
                "09r6drylvgy8vv8k20lnbvwq8gp09h7smfn6h1rxsy15pgh629si"))

(define rust-aead-0.5.2
  (crate-source "aead" "0.5.2"
                "1c32aviraqag7926xcb9sybdm36v5vh9gnxpn4pxdwjc50zl28ni"))

(define rust-aes-0.8.4
  (crate-source "aes" "0.8.4"
                "1853796anlwp4kqim0s6wm1srl4ib621nm0cl2h3c8klsjkgfsdi"))

(define rust-aes-gcm-0.10.3
  (crate-source "aes-gcm" "0.10.3"
                "1lgaqgg1gh9crg435509lqdhajg1m2vgma6f7fdj1qa2yyh10443"))

(define rust-aho-corasick-1.1.3
  (crate-source "aho-corasick" "1.1.3"
                "05mrpkvdgp5d20y2p989f187ry9diliijgwrs254fs9s1m1x6q4f"))

(define rust-android-tzdata-0.1.1
  (crate-source "android-tzdata" "0.1.1"
                "1w7ynjxrfs97xg3qlcdns4kgfpwcdv824g611fq32cag4cdr96g9"))

(define rust-android-system-properties-0.1.5
  (crate-source "android_system_properties" "0.1.5"
                "04b3wrz12837j7mdczqd95b732gw5q7q66cv4yn4646lvccp57l1"))

(define rust-anes-0.1.6
  (crate-source "anes" "0.1.6"
                "16bj1ww1xkwzbckk32j2pnbn5vk6wgsl3q4p3j9551xbcarwnijb"))

(define rust-anstream-0.6.13
  (crate-source "anstream" "0.6.13"
                "1yv2idkyf9mp9xwc684v0ywqiy86lwc9gvllwdishl7y6czx0syr"))

(define rust-anstyle-1.0.6
  (crate-source "anstyle" "1.0.6"
                "1g1ngvxrz9d6xsymxzzzg581jzyz1sn8d0jpjcwxks07cff2c0c9"))

(define rust-anstyle-parse-0.2.3
  (crate-source "anstyle-parse" "0.2.3"
                "134jhzrz89labrdwxxnjxqjdg06qvaflj1wkfnmyapwyldfwcnn7"))

(define rust-anstyle-query-1.0.2
  (crate-source "anstyle-query" "1.0.2"
                "0j3na4b1nma39g4x7cwvj009awxckjf3z2vkwhldgka44hqj72g2"))

(define rust-anstyle-wincon-3.0.2
  (crate-source "anstyle-wincon" "3.0.2"
                "19v0fv400bmp4niqpzxnhg83vz12mmqv7l2l8vi80qcdxj0lpm8w"))

(define rust-anyhow-1.0.82
  (crate-source "anyhow" "1.0.82"
                "06952ih07mhfnim7r1mmwkj1k0ag66d7z9psw2dnlvvfydx86f7m"))

(define rust-arc-swap-1.7.1
  (crate-source "arc-swap" "1.7.1"
                "0mrl9a9r9p9bln74q6aszvf22q1ijiw089jkrmabfqkbj31zixv9"))

(define rust-arrayref-0.3.7
  (crate-source "arrayref" "0.3.7"
                "0ia5ndyxqkzdymqr4ls53jdmajf09adjimg5kvw65kkprg930jbb"))

(define rust-arrayvec-0.7.6
  (crate-source "arrayvec" "0.7.6"
                "0l1fz4ccgv6pm609rif37sl5nv5k6lbzi7kkppgzqzh1vwix20kw"))

(define rust-assert-json-diff-2.0.2
  (crate-source "assert-json-diff" "2.0.2"
                "04mg3w0rh3schpla51l18362hsirl23q93aisws2irrj32wg5r27"))

(define rust-async-channel-2.3.1
  (crate-source "async-channel" "2.3.1"
                "0skvwxj6ysfc6d7bhczz9a2550260g62bm5gl0nmjxxyn007id49"))

(define rust-async-task-4.7.1
  (crate-source "async-task" "4.7.1"
                "1pp3avr4ri2nbh7s6y9ws0397nkx1zymmcr14sq761ljarh3axcb"))

(define rust-async-tempfile-0.6.0
  (crate-source "async-tempfile" "0.6.0"
                "1rvmx43vgm32bfrjzdmsvi763813h9a1z7y7mw4m20d86jc0vfdc"))

(define rust-async-trait-0.1.88
  (crate-source "async-trait" "0.1.88"
                "1dgxvz7g75cmz6vqqz0mri4xazc6a8xfj1db6r9fxz29lzyd6fg5"))

(define rust-atomic-waker-1.1.2
  (crate-source "atomic-waker" "1.1.2"
                "1h5av1lw56m0jf0fd3bchxq8a30xv0b4wv8s4zkp4s0i7mfvs18m"))

(define rust-autocfg-1.2.0
  (crate-source "autocfg" "1.2.0"
                "102c77is3pii4rsqfsc5vrbk6qabjy0yqc0gwqzmjjb9fp3spzgi"))

(define rust-axum-0.8.4
  (crate-source "axum" "0.8.4"
                "1d99kb3vcjnhbgrf6hysllf25hzagw7m1i1nidjpgsaa30n8c7h2"))

(define rust-axum-core-0.5.2
  (crate-source "axum-core" "0.5.2"
                "19kwzksb4hwr3qfbrhjbqf83z6fjyng14wrkzck6fj1g8784qik8"))

(define rust-backtrace-0.3.76
  (crate-source "backtrace" "0.3.76"
                "1mibx75x4jf6wz7qjifynld3hpw3vq6sy3d3c9y5s88sg59ihlxv"))

(define rust-base64-0.13.1
  (crate-source "base64" "0.13.1"
                "1s494mqmzjb766fy1kqlccgfg2sdcjb6hzbvzqv2jw65fdi5h6wy"))

(define rust-base64-0.22.1
  (crate-source "base64" "0.22.1"
                "1imqzgh7bxcikp5vx3shqvw9j09g9ly0xr0jma0q66i52r7jbcvj"))

(define rust-base64ct-1.6.0
  (crate-source "base64ct" "1.6.0"
                "0nvdba4jb8aikv60az40x2w1y96sjdq8z3yp09rwzmkhiwv1lg4c"))

(define rust-bincode-1.3.3
  (crate-source "bincode" "1.3.3"
                "1bfw3mnwzx5g1465kiqllp5n4r10qrqy88kdlp3jfwnq2ya5xx5i"))

(define rust-bit-set-0.8.0
  (crate-source "bit-set" "0.8.0"
                "18riaa10s6n59n39vix0cr7l2dgwdhcpbcm97x1xbyfp1q47x008"))

(define rust-bit-vec-0.8.0
  (crate-source "bit-vec" "0.8.0"
                "1xxa1s2cj291r7k1whbxq840jxvmdsq9xgh7bvrxl46m80fllxjy"))

(define rust-bitfield-struct-0.11.0
  (crate-source "bitfield-struct" "0.11.0"
                "1y0n6rwzp7h76n5asqzmf9xsqa2gff8dhkxd0l5q0ginf2ah3jnk"))

(define rust-bitflags-1.3.2
  (crate-source "bitflags" "1.3.2"
                "12ki6w8gn1ldq7yz9y680llwk5gmrhrzszaa17g1sbrw2r2qvwxy"))

(define rust-bitflags-2.9.0
  (crate-source "bitflags" "2.9.0"
                "1gb5w7pxnmx8l2bjz1i6rkbwbm2167k294rhy6cl1y3vbc8i90jw"))

(define rust-blake2-0.10.6
  (crate-source "blake2" "0.10.6"
                "1zlf7w7gql12v61d9jcbbswa3dw8qxsjglylsiljp9f9b3a2ll26"))

(define rust-blake3-1.5.1
  (crate-source "blake3" "1.5.1"
                "0lpgw3gl564wqwf98v9jsa29lp6nv7w7nn1cvw6w75s5cz9sdk1h"))

(define rust-block-0.1.6
  (crate-source "block" "0.1.6"
                "16k9jgll25pzsq14f244q22cdv0zb4bqacldg3kx6h89d7piz30d"))

(define rust-block-buffer-0.10.4
  (crate-source "block-buffer" "0.10.4"
                "0w9sa2ypmrsqqvc20nhwr75wbb5cjr4kkyhpjm1z1lv2kdicfy1h"))

(define rust-block2-0.5.1
  (crate-source "block2" "0.5.1"
                "0pyiha5his2grzqr3mynmq244laql2j20992i59asp0gy7mjw4rc"))

(define rust-block2-0.6.1
  (crate-source "block2" "0.6.1"
                "1wnwha7wjjqiamj9abq5l45fyzdxna2k2la0rp9w2hravc5jy39l"))

(define rust-blocking-1.6.2
  (crate-source "blocking" "1.6.2"
                "08bz3f9agqlp3102snkvsll6wc9ag7x5m1xy45ak2rv9pq18sgz8"))

(define rust-bumpalo-3.16.0
  (crate-source "bumpalo" "3.16.0"
                "0b015qb4knwanbdlp1x48pkb4pm57b8gidbhhhxr900q2wb6fabr"))

(define rust-byte-string-1.0.0
  (crate-source "byte_string" "1.0.0"
                "1vdll2i5gdx98d3wqbrq8c2l61jqqhzlri7d3hskm35a0mxdxahi"))

(define rust-byteorder-1.5.0
  (crate-source "byteorder" "1.5.0"
                "0jzncxyf404mwqdbspihyzpkndfgda450l0893pz5xj685cg5l0z"))

(define rust-byteorder-slice-3.0.0
  (crate-source "byteorder_slice" "3.0.0"
                "141i06ka1kj04jn8q7pqbxhylc5r64hj9x7qif79ay3k70q4wa8b"))

(define rust-bytes-1.11.1
  (crate-source "bytes" "1.11.1"
                "0czwlhbq8z29wq0ia87yass2mzy1y0jcasjb8ghriiybnwrqfx0y"))

(define rust-c2rust-bitfields-0.21.0
  (crate-source "c2rust-bitfields" "0.21.0"
                "1ysc5v0rf7irkf6v397zihl0l0rxzzraiyglwcca1qcxgy8m1vnw"))

(define rust-c2rust-bitfields-derive-0.21.0
  (crate-source "c2rust-bitfields-derive" "0.21.0"
                "0pbibcp24bx5is5nr49k21zxbp88xvmi5hdrcp9wq0l2g5vp4i9v"))

(define rust-cacao-0.3.2
  (crate-source "cacao" "0.3.2"
                "0yiyjihk78glvmpkmibqw1cpgxbaql2ikl06qy7smr3jhsaz0ljr"))

(define rust-camellia-0.1.0
  (crate-source "camellia" "0.1.0"
                "0c6f61rf0gzq7x9d2qmp0330pb397aldwdpmwqybbwly9rby4r1j"))

(define rust-cast-0.3.0
  (crate-source "cast" "0.3.0"
                "1dbyngbyz2qkk0jn2sxil8vrz3rnpcj142y184p9l4nbl9radcip"))

(define rust-cbindgen-0.28.0
  (crate-source "cbindgen" "0.28.0"
                "1zyiaifg6mcd4wwhhbxk8adzhph6qz4wxzgagvg3ijp95j58dpga"))

(define rust-cc-1.2.16
  (crate-source "cc" "1.2.16"
                "131bhgafc1i86vvjipkj0kwzz0hlpwrkl8mdbmzyq2g69calqwdy"))

(define rust-cesu8-1.1.0
  (crate-source "cesu8" "1.1.0"
                "0g6q58wa7khxrxcxgnqyi9s1z2cjywwwd3hzr5c55wskhx6s0hvd"))

(define rust-cfg-if-1.0.4
  (crate-source "cfg-if" "1.0.4"
                "008q28ajc546z5p2hcwdnckmg0hia7rnx52fni04bwqkzyrghc4k"))

(define rust-cfg-aliases-0.1.1
  (crate-source "cfg_aliases" "0.1.1"
                "17p821nc6jm830vzl2lmwz60g3a30hcm33nk6l257i1rjdqw85px"))

(define rust-cfg-aliases-0.2.1
  (crate-source "cfg_aliases" "0.2.1"
                "092pxdc1dbgjb6qvh83gk56rkic2n2ybm4yvy76cgynmzi3zwfk1"))

(define rust-chacha20-0.9.1
  (crate-source "chacha20" "0.9.1"
                "0678wipx6kghp71hpzhl2qvx80q7caz3vm8vsvd07b1fpms3yqf3"))

(define rust-chacha20poly1305-0.10.1
  (crate-source "chacha20poly1305" "0.10.1"
                "0dfwq9ag7x7lnd0znafpcn8h7k4nfr9gkzm0w7sc1lcj451pkk8h"))

(define rust-chrono-0.4.39
  (crate-source "chrono" "0.4.39"
                "09g8nf409lb184kl9j4s85k0kn8wzgjkp5ls9zid50b886fwqdky"))

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

(define rust-clap-4.5.4
  (crate-source "clap" "4.5.4"
                "1828wm9qws5gh2xnimnvmp2vria6d6hsxnqmhnm84dwjcxm0dg4h"))

(define rust-clap-builder-4.5.2
  (crate-source "clap_builder" "4.5.2"
                "1d7p4hph4fyhaphkf0v5zv0kq4lz25a9jq2f901yrq3afqp9w4mf"))

(define rust-clap-complete-4.5.2
  (crate-source "clap_complete" "4.5.2"
                "0pi7hdjrw853qhqcpi3ky9azh03k6js8jbmhcl0v2f5z4m1m0yfx"))

(define rust-clap-derive-4.5.4
  (crate-source "clap_derive" "4.5.4"
                "0r2gs2p10pb435w52xzsgz2mmx5qd3qfkmk29y4mbz9ph11k30aj"))

(define rust-clap-lex-0.7.0
  (crate-source "clap_lex" "0.7.0"
                "1kh1sckgq71kay2rrr149pl9gbsrvyccsq6xm5xpnq0cxnyqzk4q"))

(define rust-colorchoice-1.0.0
  (crate-source "colorchoice" "1.0.0"
                "1ix7w85kwvyybwi2jdkl3yva2r2bvdcc3ka2grjfzfgrapqimgxc"))

(define rust-colored-2.2.0
  (crate-source "colored" "2.2.0"
                "0g6s7j2qayjd7i3sivmwiawfdg8c8ldy0g2kl4vwk1yk16hjaxqi"))

(define rust-combine-4.6.7
  (crate-source "combine" "4.6.7"
                "1z8rh8wp59gf8k23ar010phgs0wgf5i8cx4fg01gwcnzfn5k0nms"))

(define rust-concurrent-queue-2.5.0
  (crate-source "concurrent-queue" "2.5.0"
                "0wrr3mzq2ijdkxwndhf79k952cp4zkz35ray8hvsxl96xrx1k82c"))

(define rust-console-0.15.11
  (crate-source "console" "0.15.11"
                "1n5gmsjk6isbnw6qss043377kln20lfwlmdk3vswpwpr21dwnk05"))

(define rust-const-oid-0.9.6
  (crate-source "const-oid" "0.9.6"
                "1y0jnqaq7p2wvspnx7qj76m7hjcqpz73qzvr9l2p9n2s51vr6if2"))

(define rust-constant-time-eq-0.3.0
  (crate-source "constant_time_eq" "0.3.0"
                "1hl0y8frzlhpr58rh8rlg4bm53ax09ikj2i5fk7gpyphvhq4s57p"))

(define rust-constant-time-eq-0.4.2
  (crate-source "constant_time_eq" "0.4.2"
                "16zamq60dq80k3rqlzh9j9cpjhishmh924lnwbplgrnmkkvfylix"))

(define rust-core-foundation-0.9.4
  (crate-source "core-foundation" "0.9.4"
                "13zvbbj07yk3b61b8fhwfzhy35535a583irf23vlcg59j7h9bqci"))

(define rust-core-foundation-sys-0.8.6
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "core-foundation-sys" "0.8.6"
                "13w6sdf06r0hn7bx2b45zxsg1mm2phz34jikm6xc5qrbr6djpsh6"))

(define rust-core-graphics-0.22.3
  (crate-source "core-graphics" "0.22.3"
                "1yz4xzbz36vbmlra0viazzlicp8kap1ldgshsp5nzz4g7fmvp095"))

(define rust-core-graphics-types-0.1.3
  (crate-source "core-graphics-types" "0.1.3"
                "1bxg8nxc8fk4kxnqyanhf36wq0zrjr552c58qy6733zn2ihhwfa5"))

(define rust-cpufeatures-0.2.12
  (crate-source "cpufeatures" "0.2.12"
                "012m7rrak4girqlii3jnqwrr73gv1i980q4wra5yyyhvzwk5xzjk"))

(define rust-crc32fast-1.4.0
  (crate-source "crc32fast" "1.4.0"
                "1ahy259ypc955l5ak24hdlgllb6vm6y2pvwr6qrlyisbg255m1dk"))

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

(define rust-crossbeam-epoch-0.9.18
  (crate-source "crossbeam-epoch" "0.9.18"
                "03j2np8llwf376m3fxqx859mgp9f83hj1w34153c7a9c7i5ar0jv"))

(define rust-crossbeam-utils-0.8.19
  (crate-source "crossbeam-utils" "0.8.19"
                "0iakrb1b8fjqrag7wphl94d10irhbh2fw1g444xslsywqyn3p3i4"))

(define rust-crunchy-0.2.4
  (crate-source "crunchy" "0.2.4"
                "1mbp5navim2qr3x48lyvadqblcxc1dm0lqr0swrkkwy2qblvw3s6"))

(define rust-crypto-common-0.1.6
  (crate-source "crypto-common" "0.1.6"
                "1cvby95a6xg7kxdz5ln3rl9xh66nz66w46mm3g56ri1z5x815yqv"))

(define rust-csv-1.3.1
  (crate-source "csv" "1.3.1"
                "1bzxgbbhy27flcyafxbj7f1hbn7b8wac04ijfgj34ry9m61lip5c"))

(define rust-csv-core-0.1.12
  (crate-source "csv-core" "0.1.12"
                "0gfrjjlfagarhyclxrqv6b14iaxgvgc8kmwwdvw08racvaqg60kx"))

(define rust-ctr-0.9.2
  (crate-source "ctr" "0.9.2"
                "0d88b73waamgpfjdml78icxz45d95q7vi2aqa604b0visqdfws83"))

(define rust-ctrlc-3.4.4
  (crate-source "ctrlc" "3.4.4"
                "0iak582cfv3jcprd9apsy6q9glsx7n4ahiv518wcc6yw6yp6a937"))

(define rust-curve25519-dalek-4.1.3
  (crate-source "curve25519-dalek" "4.1.3"
                "1gmjb9dsknrr8lypmhkyjd67p1arb8mbfamlwxm7vph38my8pywp"))

(define rust-curve25519-dalek-derive-0.1.1
  (crate-source "curve25519-dalek-derive" "0.1.1"
                "1cry71xxrr0mcy5my3fb502cwfxy6822k4pm19cwrilrg7hq4s7l"))

(define rust-darling-0.20.10
  (crate-source "darling" "0.20.10"
                "1299h2z88qn71mizhh05j26yr3ik0wnqmw11ijds89l8i9nbhqvg"))

(define rust-darling-core-0.20.10
  (crate-source "darling_core" "0.20.10"
                "1rgr9nci61ahnim93yh3xy6fkfayh7sk4447hahawah3m1hkh4wm"))

(define rust-darling-macro-0.20.10
  (crate-source "darling_macro" "0.20.10"
                "01kq3ibbn47czijj39h3vxyw0c2ksd0jvc097smcrk7n2jjs4dnk"))

(define rust-data-encoding-2.5.0
  (crate-source "data-encoding" "2.5.0"
                "1rcbnwfmfxhlshzbn3r7srm3azqha3mn33yxyqxkzz2wpqcjm5ky"))

(define rust-dbus-0.9.7
  (crate-source "dbus" "0.9.7"
                "06vdv4aarjs4w6byg9nqajr67c8qvlhk3153ic2i65pvp63ikchv"))

(define rust-der-0.7.9
  (crate-source "der" "0.7.9"
                "1h4vzjfa1lczxdf8avfj9qlwh1qianqlxdy1g5rn762qnvkzhnzm"))

(define rust-deranged-0.5.5
  (crate-source "deranged" "0.5.5"
                "11z5939gv2klp1r1lgrp4w5fnlkj18jqqf0h9zxmia3vkrjwpv7c"))

(define rust-derive-into-owned-0.2.0
  (crate-source "derive-into-owned" "0.2.0"
                "08y9qkiyqgm4sjcnl1xnm4f3ffb3pi4g8f46daqaf69q3vc9979c"))

(define rust-derive-builder-0.20.0
  (crate-source "derive_builder" "0.20.0"
                "1mzz0njgbrzlhj97md03df5knfcp5svw1ifn2rcqlqii0g5val03"))

(define rust-derive-builder-core-0.20.0
  (crate-source "derive_builder_core" "0.20.0"
                "078bralcmzwy3vi0w1rc65a3v4kk6jgccsir5mrm34c3gxwdm36l"))

(define rust-derive-builder-macro-0.20.0
  (crate-source "derive_builder_macro" "0.20.0"
                "0yq9hnyayys16rzmiwjd6gfx1ysph7c9zh94w76cw9rg4jw6hs10"))

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

(define rust-dispatch2-0.3.0
  (crate-source "dispatch2" "0.3.0"
                "1v1ak9w0s8z1g13x4mj2y5im9wmck0i2vf8f8wc9l1n6lqi9z849"))

(define rust-displaydoc-0.2.5
  (crate-source "displaydoc" "0.2.5"
                "1q0alair462j21iiqwrr21iabkfnb13d6x5w95lkdg21q2xrqdlp"))

(define rust-dunce-1.0.5
  (crate-source "dunce" "1.0.5"
                "04y8wwv3vvcqaqmqzssi6k0ii9gs6fpz96j5w9nky2ccsl23axwj"))

(define rust-duplicate-2.0.0
  (crate-source "duplicate" "2.0.0"
                "1cb7334vx9l6nlvn7cgly0j035l7dq7fwxbxwwrqn8jf05grpbwp"))

(define rust-dynosaur-0.2.0
  (crate-source "dynosaur" "0.2.0"
                "142qysk2f29i5nn4wl5zqxq6j00apg06pcbbw3narx1d5nsjqyr7"))

(define rust-dynosaur-derive-0.2.0
  (crate-source "dynosaur_derive" "0.2.0"
                "1ls9n43hzv5crwfixylpcf7r90rfxwwbqrf1fwfc1a1r71qh4hbs"))

(define rust-ed25519-2.2.3
  (crate-source "ed25519" "2.2.3"
                "0lydzdf26zbn82g7xfczcac9d7mzm3qgx934ijjrd5hjpjx32m8i"))

(define rust-ed25519-dalek-2.1.1
  (crate-source "ed25519-dalek" "2.1.1"
                "0w88cafwglg9hjizldbmlza0ns3hls81zk1bcih3m5m3h67algaa"))

(define rust-either-1.15.0
  (crate-source "either" "1.15.0"
                "069p1fknsmzn9llaizh77kip0pqmcwpdsykv2x30xpjyija5gis8"))

(define rust-encode-unicode-1.0.0
  (crate-source "encode_unicode" "1.0.0"
                "1h5j7j7byi289by63s3w4a8b3g6l5ccdrws7a67nn07vdxj77ail"))

(define rust-enum-as-inner-0.6.0
  (crate-source "enum-as-inner" "0.6.0"
                "0sjl5z0ycicpxg88qnn57m6sxi3ny9fl7b7vz0pb61bcjsvcpz2z"))

(define rust-enum-map-2.7.3
  (crate-source "enum-map" "2.7.3"
                "1sgjgl4mmz93jdkfdsmapc3dmaq8gddagw9s0fd501w2vyzz6rk8"))

(define rust-enum-map-derive-0.17.0
  (crate-source "enum-map-derive" "0.17.0"
                "1sv4mb343rsz4lc3rh7cyn0pdhf7fk18k1dgq8kfn5i5x7gwz0pj"))

(define rust-env-filter-0.1.3
  (crate-source "env_filter" "0.1.3"
                "1l4p6f845cylripc3zkxa0lklk8rn2q86fqm522p6l2cknjhavhq"))

(define rust-env-logger-0.11.7
  (crate-source "env_logger" "0.11.7"
                "15q67lg5rdq73fk9sh5l2ja1wcpbik74p7afv32zmd0gj9x6swf3"))

(define rust-equivalent-1.0.1
  (crate-source "equivalent" "1.0.1"
                "1malmx5f4lkfvqasz319lq6gb3ddg19yzf9s8cykfsgzdmyq0hsl"))

(define rust-err-context-0.1.0
  (crate-source "err-context" "0.1.0"
                "17n80zklsw187zvlgyv50320bmzg0iagal5zydzr4kinn4iav6j4"))

(define rust-errno-0.2.8
  (crate-source "errno" "0.2.8"
                "18cnqgk8r6lq1n5cfy3bryiyz9zkqr10dxj49sa3fkzfamih8fgn"))

(define rust-errno-0.3.8
  (crate-source "errno" "0.3.8"
                "0ia28ylfsp36i27g1qih875cyyy4by2grf80ki8vhgh6vinf8n52"))

(define rust-errno-dragonfly-0.1.2
  (crate-source "errno-dragonfly" "0.1.2"
                "1grrmcm6q8512hkq5yzch3yv8wafflc2apbmsaabiyk44yqz2s5a"))

(define rust-event-listener-5.4.0
  (crate-source "event-listener" "5.4.0"
                "1bii2gn3vaa33s0gr2zph7cagiq0ppcfxcxabs24ri9z9kgar4il"))

(define rust-event-listener-strategy-0.5.3
  (crate-source "event-listener-strategy" "0.5.3"
                "1ch5gf6knllyq12jkb5zdfag573dh44307q4pwwi2g37sc6lwgiw"))

(define rust-eyre-0.6.12
  (crate-source "eyre" "0.6.12"
                "1v1a3vb9gs5zkwp4jzkcfnpg0gvyp4ifydzx37f4qy14kzcibnbw"))

(define rust-fastrand-2.0.2
  (crate-source "fastrand" "2.0.2"
                "111rlv1988jkfiymr41zf1mhyr5mwy68mwcnrjim5j7l3idxd2v5"))

(define rust-fiat-crypto-0.2.8
  (crate-source "fiat-crypto" "0.2.8"
                "07p0gaynz13i9vr1133gix1nzapzh6bjq37478p42crvb5akqy9q"))

(define rust-filetime-0.2.23
  (crate-source "filetime" "0.2.23"
                "1za0sbq7fqidk8aaq9v7m9ms0sv8mmi49g6p5cphpan819q4gr0y"))

(define rust-fixedbitset-0.4.2
  (crate-source "fixedbitset" "0.4.2"
                "101v41amgv5n9h4hcghvrbfk5vrncx1jwm35rn5szv4rk55i7rqc"))

(define rust-flate2-1.1.2
  (crate-source "flate2" "1.1.2"
                "07abz7v50lkdr5fjw8zaw2v8gm2vbppc0f7nqm8x3v3gb6wpsgaa"))

(define rust-fnv-1.0.7
  (crate-source "fnv" "1.0.7"
                "1hc2mcqha06aibcaza94vbi81j6pr9a1bbxrxjfhc91zin8yr7iz"))

(define rust-foreign-types-0.3.2
  (crate-source "foreign-types" "0.3.2"
                "1cgk0vyd7r45cj769jym4a6s7vwshvd0z4bqrb92q1fwibmkkwzn"))

(define rust-foreign-types-shared-0.1.1
  (crate-source "foreign-types-shared" "0.1.1"
                "0jxgzd04ra4imjv8jgkmdq59kj8fsz6w4zxsbmlai34h26225c00"))

(define rust-form-urlencoded-1.2.1
  (crate-source "form_urlencoded" "1.2.1"
                "0milh8x7nl4f450s3ddhg57a3flcv6yq8hlkyk6fyr3mcb128dp1"))

(define rust-fsevent-sys-4.1.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "fsevent-sys" "4.1.0"
                "1liz67v8b0gcs8r31vxkvm2jzgl9p14i78yfqx81c8sdv817mvkn"))

(define rust-futures-0.3.31
  (crate-source "futures" "0.3.31"
                "0xh8ddbkm9jy8kc5gbvjp9a4b6rqqxvc8471yb2qaz5wm2qhgg35"))

(define rust-futures-channel-0.3.31
  (crate-source "futures-channel" "0.3.31"
                "040vpqpqlbk099razq8lyn74m0f161zd0rp36hciqrwcg2zibzrd"))

(define rust-futures-core-0.3.31
  (crate-source "futures-core" "0.3.31"
                "0gk6yrxgi5ihfanm2y431jadrll00n5ifhnpx090c2f2q1cr1wh5"))

(define rust-futures-executor-0.3.31
  (crate-source "futures-executor" "0.3.31"
                "17vcci6mdfzx4gbk0wx64chr2f13wwwpvyf3xd5fb1gmjzcx2a0y"))

(define rust-futures-io-0.3.31
  (crate-source "futures-io" "0.3.31"
                "1ikmw1yfbgvsychmsihdkwa8a1knank2d9a8dk01mbjar9w1np4y"))

(define rust-futures-lite-2.6.0
  (crate-source "futures-lite" "2.6.0"
                "0cmmgszlmkwsac9pyw5rfjakmshgx4wmzmlyn6mmjs0jav4axvgm"))

(define rust-futures-macro-0.3.31
  (crate-source "futures-macro" "0.3.31"
                "0l1n7kqzwwmgiznn0ywdc5i24z72zvh9q1dwps54mimppi7f6bhn"))

(define rust-futures-sink-0.3.31
  (crate-source "futures-sink" "0.3.31"
                "1xyly6naq6aqm52d5rh236snm08kw8zadydwqz8bip70s6vzlxg5"))

(define rust-futures-task-0.3.31
  (crate-source "futures-task" "0.3.31"
                "124rv4n90f5xwfsm9qw6y99755y021cmi5dhzh253s920z77s3zr"))

(define rust-futures-util-0.3.31
  (crate-source "futures-util" "0.3.31"
                "10aa1ar8bgkgbr4wzxlidkqkcxf77gffyj8j7768h831pcaq784z"))

(define rust-generator-0.8.7
  (crate-source "generator" "0.8.7"
                "18p5rjx7vbcz6jw6c6qdzpl2wkhr5mfcqdc60g0skqp372jq6lb0"))

(define rust-generic-array-0.14.7
  (crate-source "generic-array" "0.14.7"
                "16lyyrzrljfq424c3n8kfwkqihlimmsg5nhshbbp48np3yjrqr45"))

(define rust-getrandom-0.2.14
  (crate-source "getrandom" "0.2.14"
                "0v18s6lpkvil6dkdfb86l84mwpqbpw6928qp0n0hj4dhxh32xcll"))

(define rust-getrandom-0.3.2
  (crate-source "getrandom" "0.3.2"
                "1w2mlixa1989v7czr68iji7h67yra2pbg3s480wsqjza1r2sizkk"))

(define rust-ghash-0.5.1
  (crate-source "ghash" "0.5.1"
                "1wbg4vdgzwhkpkclz1g6bs4r5x984w5gnlsj4q5wnafb5hva9n7h"))

(define rust-gimli-0.32.3
  (crate-source "gimli" "0.32.3"
                "1iqk5xznimn5bfa8jy4h7pa1dv3c624hzgd2dkz8mpgkiswvjag6"))

(define rust-glob-0.3.2
  (crate-source "glob" "0.3.2"
                "1cm2w34b5w45fxr522h5b0fv1bxchfswcj560m3pnjbia7asvld8"))

(define rust-gotatun-0.2.0
  (crate-source "gotatun" "0.2.0"
                "01h7hbdwid8v5vwwv100a1l7c0ldcgvxm09wiwp6cv3mgw26p87q"))

(define rust-h2-0.4.4
  (crate-source "h2" "0.4.4"
                "0sc0ymhiqp4hbz39d405cjbga77wnz2pprbgyc498xs58hlwfvl1"))

(define rust-h3-0.0.7
  (crate-source "h3" "0.0.7"
                "1lxhjrdb8z0xhd9r79fbd9kr1x22s49djsnidqc6z9i89yd0byvx"))

(define rust-h3-datagram-0.0.1
  (crate-source "h3-datagram" "0.0.1"
                "077sd3572m62hz59w761lbkzni0g5pgw0z6rd92kmx8g1v05ih4q"))

(define rust-h3-quinn-0.0.9
  (crate-source "h3-quinn" "0.0.9"
                "1gvgqsvbd9ww0di7rv768kbnbj4r62xbgc6bwg48y6clmqc26j3d"))

(define rust-half-2.6.0
  (crate-source "half" "2.6.0"
                "1j83v0xaqvrw50ppn0g33zig0zsbdi7xiqbzgn7sd5al57nrd4a5"))

(define rust-hashbrown-0.14.3
  (crate-source "hashbrown" "0.14.3"
                "012nywlg0lj9kwanh69my5x67vjlfmzfi9a0rq4qvis2j8fil3r9"))

(define rust-heck-0.4.1
  (crate-source "heck" "0.4.1"
                "1a7mqsnycv5z4z5vnv1k34548jzmc0ajic7c1j8jsaspnhw5ql4m"))

(define rust-heck-0.5.0
  (crate-source "heck" "0.5.0"
                "1sjmpsdl8czyh9ywl3qcsfsq9a307dg4ni2vnlwgnzzqhc4y0113"))

(define rust-hermit-abi-0.3.9
  (crate-source "hermit-abi" "0.3.9"
                "092hxjbjnq5fmz66grd9plxd0sh6ssg5fhgwwwqbrzgzkjwdycfj"))

(define rust-hex-0.4.3
  (crate-source "hex" "0.4.3"
                "0w1a4davm1lgzpamwnba907aysmlrnygbqmfis2mqjx5m552a93z"))

(define rust-hickory-proto-0.25.2
  (crate-source "hickory-proto" "0.25.2"
                "00k5dk572p0bsrnvsqv1yi8mwfpgwyj7q8bgiacri083q1bgx9pq"))

(define rust-hickory-resolver-0.25.2
  (crate-source "hickory-resolver" "0.25.2"
                "0ypqxipl0dmggv442qn1xxh11lsjr65219wmmg949yqbkflsjqnw"))

(define rust-hickory-server-0.25.2
  (crate-source "hickory-server" "0.25.2"
                "11957gm9ab0gxgma0xm2idlc4azxici1i23bwi7cfhdr27l5ygnm"))

(define rust-hkdf-0.12.4
  (crate-source "hkdf" "0.12.4"
                "1xxxzcarz151p1b858yn5skmhyrvn8fs4ivx5km3i1kjmnr8wpvv"))

(define rust-hmac-0.12.1
  (crate-source "hmac" "0.12.1"
                "0pmbr069sfg76z7wsssfk5ddcqd9ncp79fyz6zcm6yn115yc6jbc"))

(define rust-home-0.5.9
  (crate-source "home" "0.5.9"
                "19grxyg35rqfd802pcc9ys1q3lafzlcjcv2pl2s5q8xpyr5kblg3"))

(define rust-hostname-0.3.1
  (crate-source "hostname" "0.3.1"
                "0rz8yf70cvzl3nry71m4bz9w6x4j9kdz3qng6pnwhk2h20z1qwrw"))

(define rust-htmlize-1.0.6
  (crate-source "htmlize" "1.0.6"
                "0d8r9r0mlhnpyl8kxbhrw60l4h1467g24j1fk2h0pqlv4ggc0iyk"))

(define rust-http-1.1.0
  (crate-source "http" "1.1.0"
                "0n426lmcxas6h75c2cp25m933pswlrfjz10v91vc62vib2sdvf91"))

(define rust-http-body-1.0.0
  (crate-source "http-body" "1.0.0"
                "0hyn8n3iadrbwq8y0p1rl1275s4nm49bllw5wji29g4aa3dqbb0w"))

(define rust-http-body-util-0.1.2
  (crate-source "http-body-util" "0.1.2"
                "0kslwazg4400qnc2azkrgqqci0fppv12waicnsy5d8hncvbjjd3r"))

(define rust-httparse-1.9.4
  (crate-source "httparse" "1.9.4"
                "1nc2s1pziq5ncl39xm7ybdhpnw5xsm505smqirr0py2v2550pk0g"))

(define rust-httpdate-1.0.3
  (crate-source "httpdate" "1.0.3"
                "1aa9rd2sac0zhjqh24c9xvir96g188zldkx0hr6dnnlx5904cfyz"))

(define rust-hybrid-array-0.2.0-rc.11
  (crate-source "hybrid-array" "0.2.0-rc.11"
                "0c70snbbmfhgq3y9q0bfzhbd7a3v2kqispwiyymfbjjl0xdix955"))

(define rust-hyper-1.8.1
  (crate-source "hyper" "1.8.1"
                "04cxr8j5y86bhxxlyqb8xkxjskpajk7cxwfzzk4v3my3a3rd9cia"))

(define rust-hyper-rustls-0.27.5
  (crate-source "hyper-rustls" "0.27.5"
                "1cjr3yf3x5mr3194llsfibacl6j7n2dknii2dwjha4ysyf1ia69d"))

(define rust-hyper-timeout-0.5.1
  (crate-source "hyper-timeout" "0.5.1"
                "14rpyv9zz0ncadn9qgmnjz0hiqk3nav7hglkk1a6yfy8wmhsj0rj"))

(define rust-hyper-util-0.1.16
  (crate-source "hyper-util" "0.1.16"
                "0pmw8gqkqjnsdrxdy5wd5q8z1gh7caxqk2an7b4s53byghkhb6wd"))

(define rust-iana-time-zone-0.1.60
  (crate-source "iana-time-zone" "0.1.60"
                "0hdid5xz3jznm04lysjm3vi93h3c523w0hcc3xba47jl3ddbpzz7"))

(define rust-iana-time-zone-haiku-0.1.2
  (crate-source "iana-time-zone-haiku" "0.1.2"
                "17r6jmj31chn7xs9698r122mapq85mfnv98bb4pg6spm0si2f67k"))

(define rust-icu-collections-1.5.0
  (crate-source "icu_collections" "1.5.0"
                "09j5kskirl59mvqc8kabhy7005yyy7dp88jw9f6f3gkf419a8byv"))

(define rust-icu-locid-1.5.0
  (crate-source "icu_locid" "1.5.0"
                "0dznvd1c5b02iilqm044q4hvar0sqibq1z46prqwjzwif61vpb0k"))

(define rust-icu-locid-transform-1.5.0
  (crate-source "icu_locid_transform" "1.5.0"
                "0kmmi1kmj9yph6mdgkc7v3wz6995v7ly3n80vbg0zr78bp1iml81"))

(define rust-icu-locid-transform-data-1.5.0
  (crate-source "icu_locid_transform_data" "1.5.0"
                "0vkgjixm0wzp2n3v5mw4j89ly05bg3lx96jpdggbwlpqi0rzzj7x"))

(define rust-icu-normalizer-1.5.0
  (crate-source "icu_normalizer" "1.5.0"
                "0kx8qryp8ma8fw1vijbgbnf7zz9f2j4d14rw36fmjs7cl86kxkhr"))

(define rust-icu-normalizer-data-1.5.0
  (crate-source "icu_normalizer_data" "1.5.0"
                "05lmk0zf0q7nzjnj5kbmsigj3qgr0rwicnn5pqi9n7krmbvzpjpq"))

(define rust-icu-properties-1.5.1
  (crate-source "icu_properties" "1.5.1"
                "1xgf584rx10xc1p7zjr78k0n4zn3g23rrg6v2ln31ingcq3h5mlk"))

(define rust-icu-properties-data-1.5.0
  (crate-source "icu_properties_data" "1.5.0"
                "0scms7pd5a7yxx9hfl167f5qdf44as6r3bd8myhlngnxqgxyza37"))

(define rust-icu-provider-1.5.0
  (crate-source "icu_provider" "1.5.0"
                "1nb8vvgw8dv2inqklvk05fs0qxzkw8xrg2n9vgid6y7gm3423m3f"))

(define rust-icu-provider-macros-1.5.0
  (crate-source "icu_provider_macros" "1.5.0"
                "1mjs0w7fcm2lcqmbakhninzrjwqs485lkps4hz0cv3k36y9rxj0y"))

(define rust-ident-case-1.0.1
  (crate-source "ident_case" "1.0.1"
                "0fac21q6pwns8gh1hz3nbq15j8fi441ncl6w4vlnd1cmc55kiq5r"))

(define rust-idna-1.0.3
  (crate-source "idna" "1.0.3"
                "0zlajvm2k3wy0ay8plr07w22hxkkmrxkffa6ah57ac6nci984vv8"))

(define rust-idna-adapter-1.2.0
  (crate-source "idna_adapter" "1.2.0"
                "0wggnkiivaj5lw0g0384ql2d7zk4ppkn3b1ry4n0ncjpr7qivjns"))

(define rust-indenter-0.3.3
  (crate-source "indenter" "0.3.3"
                "10y6i6y4ls7xsfsc1r3p5j2hhbxhaqnk5zzk8aj52b14v05ba8yf"))

(define rust-indexmap-2.2.6
  (crate-source "indexmap" "2.2.6"
                "09hgwi2ig0wyj5rjziia76zmhgfj95k0jb4ic3iiawm4vlavg3qn"))

(define rust-inotify-0.10.2
  (crate-source "inotify" "0.10.2"
                "1k2m6a95827yspax1icmwiz4szr7c01w3dnn2b2bil4hfvcnilgx"))

(define rust-inotify-0.11.0
  (crate-source "inotify" "0.11.0"
                "1wq8m657rl085cg59p38sc5y62xy9yhhpvxbkd7n1awi4zzwqzgk"))

(define rust-inotify-sys-0.1.5
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "inotify-sys" "0.1.5"
                "1syhjgvkram88my04kv03s0zwa66mdwa5v7ddja3pzwvx2sh4p70"))

(define rust-inout-0.1.3
  (crate-source "inout" "0.1.3"
                "1xf9gf09nc7y1a261xlfqsf66yn6mb81ahlzzyyd1934sr9hbhd0"))

(define rust-insta-1.42.1
  (crate-source "insta" "1.42.1"
                "11law2fzalj7pb5sy044xr2spzyzv8rnq5ay6rmqk4qdwcjv3hbi"))

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

(define rust-ipconfig-0.3.2
  (crate-source "ipconfig" "0.3.2"
                "0zwr0x3jnqmjdqqbzhb0nid011qyhcyfdfqv32cdw85pjqpvk3dm"))

(define rust-ipnet-2.9.0
  (crate-source "ipnet" "2.9.0"
                "1hzrcysgwf0knf83ahb3535hrkw63mil88iqc6kjaryfblrqylcg"))

(define rust-ipnetwork-0.21.1
  (crate-source "ipnetwork" "0.21.1"
                "0qqpyjfma524v734nw4xri38xwj524z8q3k29bji6kfmmyyhldyg"))

(define rust-iri-string-0.7.8
  (crate-source "iri-string" "0.7.8"
                "1cl0wfq97wq4s1p4dl0ix5cfgsc5fn7l22ljgw9ab9x1qglypifv"))

(define rust-itertools-0.13.0
  (crate-source "itertools" "0.13.0"
                "11hiy3qzl643zcigknclh446qb9zlg4dpdzfkjaa9q9fqpgyfgj1"))

(define rust-itertools-0.14.0
  (crate-source "itertools" "0.14.0"
                "118j6l1vs2mx65dqhwyssbrxpawa90886m3mzafdvyip41w2q69b"))

(define rust-itoa-1.0.11
  (crate-source "itoa" "1.0.11"
                "0nv9cqjwzr3q58qz84dcz63ggc54yhf1yqar1m858m1kfd4g3wa9"))

(define rust-jni-0.19.0
  (crate-source "jni" "0.19.0"
                "1v0pn0i1wb8zp4wns4l8hz9689hqsplv7iba7hylaznvwg11ipy6"))

(define rust-jni-sys-0.3.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "jni-sys" "0.3.0"
                "0c01zb9ygvwg9wdx2fii2d39myzprnpqqhy7yizxvjqp5p04pbwf"))

(define rust-jnix-0.5.3
  (crate-source "jnix" "0.5.3"
                "12k7ayxmgfczq6i9ydsy9xbxghbazh73p390204cpgxgnzqn1i33"))

(define rust-jnix-macros-0.4.1
  (crate-source "jnix-macros" "0.4.1"
                "1y7zp9rps4iv27zripljlkcq2vzw3z9w129l7z1qiblpdpz4sbq0"))

(define rust-jobserver-0.1.32
  (crate-source "jobserver" "0.1.32"
                "1l2k50qmj84x9mn39ivjz76alqmx72jhm12rw33zx9xnpv5xpla8"))

(define rust-js-sys-0.3.77
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "js-sys" "0.3.77"
                "13x2qcky5l22z4xgivi59xhjjx4kxir1zg7gcj0f1ijzd4yg7yhw"))

(define rust-json-canon-0.1.3
  (crate-source "json-canon" "0.1.3"
                "1nqfzidgikjfdxd851cpxn3yyclf82ai44qdrhddcixxl99y2yj4"))

(define rust-keccak-0.1.5
  (crate-source "keccak" "0.1.5"
                "0m06swsyd58hvb1z17q6picdwywprf1yf1s6l491zi8r26dazhpc"))

(define rust-kem-0.3.0-pre.0
  (crate-source "kem" "0.3.0-pre.0"
                "17r3vy8pmij1wqrps53lmvdzxfnhyzn6v5kz3aq6gnrp0d3lb1ib"))

(define rust-kqueue-1.0.8
  (crate-source "kqueue" "1.0.8"
                "033x2knkbv8d3jy6i9r32jcgsq6zm3g97zh5la43amkv3g5g2ivl"))

(define rust-kqueue-sys-1.0.4
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "kqueue-sys" "1.0.4"
                "12w3wi90y4kwis4k9g6fp0kqjdmc6l00j16g8mgbhac7vbzjb5pd"))

(define rust-lazy-static-1.4.0
  (crate-source "lazy_static" "1.4.0"
                "0in6ikhw8mgl33wjv6q6xfrb5b9jr16q8ygjy803fay4zcisvaz2"))

(define rust-libc-0.2.172
  (crate-source "libc" "0.2.172"
                "1ykz4skj7gac14znljm5clbnrhini38jkq3d60jggx3y5w2ayl6p"))

(define rust-libdbus-sys-0.2.5
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "libdbus-sys" "0.2.5"
                "0wjw93q6ckrn8qdrxzdi02f0ma9g7nnlpgkrkcll1mjhnw95a206"))

(define rust-libloading-0.8.3
  (crate-source "libloading" "0.8.3"
                "06awqx9glr3i7mcs6csscr8d6dbd9rrk6yglilmdmsmhns7ijahc"))

(define rust-libloading-0.9.0
  (crate-source "libloading" "0.9.0"
                "0q4bvhp4kqy2v3bw4cn2bmyq73hskqd1ansa9125gfq5x0ns4k3m"))

(define rust-libm-0.2.8
  (crate-source "libm" "0.2.8"
                "0n4hk1rs8pzw8hdfmwn96c4568s93kfxqgcqswr7sajd2diaihjf"))

(define rust-libredox-0.1.3
  (crate-source "libredox" "0.1.3"
                "139602gzgs0k91zb7dvgj1qh4ynb8g1lbxsswdim18hcb6ykgzy0"))

(define rust-linked-hash-map-0.5.6
  (crate-source "linked-hash-map" "0.5.6"
                "03vpgw7x507g524nx5i1jf5dl8k3kv0fzg8v3ip6qqwbpkqww5q7"))

(define rust-linux-raw-sys-0.4.13
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "linux-raw-sys" "0.4.13"
                "172k2c6422gsc914ig8rh99mb9yc7siw6ikc3d9xw1k7vx0s3k81"))

(define rust-litemap-0.7.3
  (crate-source "litemap" "0.7.3"
                "0157lf44c3s2piqiwpppnynzzpv1rxyddl2z9l089hpwsjwb0g34"))

(define rust-lock-api-0.4.11
  (crate-source "lock_api" "0.4.11"
                "0iggx0h4jx63xm35861106af3jkxq06fpqhpkhgw0axi2n38y5iw"))

(define rust-log-0.4.29
  (crate-source "log" "0.4.29"
                "15q8j9c8g5zpkcw0hnd6cf2z7fxqnvsjh3rw5mv5q10r83i34l2y"))

(define rust-log-panics-2.1.0
  (crate-source "log-panics" "2.1.0"
                "0pxcq9f4jmcs2l9lgs6hj2w3ba80zzsj4zgnxi81h70r8s2xvyb8"))

(define rust-loom-0.7.2
  (crate-source "loom" "0.7.2"
                "1jpszf9qxv8ydpsm2h9vcyvxvyxcfkhmmfbylzd4gfbc0k40v7j1"))

(define rust-lru-slab-0.1.2
  (crate-source "lru-slab" "0.1.2"
                "0m2139k466qj3bnpk66bwivgcx3z88qkxvlzk70vd65jq373jaqi"))

(define rust-malloc-buf-0.0.6
  (crate-source "malloc_buf" "0.0.6"
                "1jqr77j89pwszv51fmnknzvd53i1nkmcr8rjrvcxhm4dx1zr1fv2"))

(define rust-match-cfg-0.1.0
  (crate-source "match_cfg" "0.1.0"
                "1r5j3zqc3qr8ybcx95bk8q57mkizmgmffj5lmicd4i8d9riyigpz"))

(define rust-matchers-0.2.0
  (crate-source "matchers" "0.2.0"
                "1sasssspdj2vwcwmbq3ra18d3qniapkimfcbr47zmx6750m5llni"))

(define rust-matchit-0.8.4
  (crate-source "matchit" "0.8.4"
                "1hzl48fwq1cn5dvshfly6vzkzqhfihya65zpj7nz7lfx82mgzqa7"))

(define rust-maybenot-2.2.2
  (crate-source "maybenot" "2.2.2"
                "1j1n91drps7xk86f4wr87s440njmhh548sm6bkmyyhgl8kb1wws4"))

(define rust-maybenot-ffi-2.2.2
  (crate-source "maybenot-ffi" "2.2.2"
                "03gvwi2npz9c0x44lrx4xzpm6s66x15x5kn7sgx48s24vav849kb"))

(define rust-md-5-0.10.6
  (crate-source "md-5" "0.10.6"
                "1kvq5rnpm4fzwmyv5nmnxygdhhb2369888a06gdc9pxyrzh7x7nq"))

(define rust-memchr-2.7.2
  (crate-source "memchr" "2.7.2"
                "07bcqxb0vx4ji0648ny5xsicjnpma95x1n07v7mi7jrhsz2l11kc"))

(define rust-memoffset-0.6.5
  (crate-source "memoffset" "0.6.5"
                "1kkrzll58a3ayn5zdyy9i1f1v3mx0xgl29x0chq614zazba638ss"))

(define rust-memoffset-0.9.1
  (crate-source "memoffset" "0.9.1"
                "12i17wh9a9plx869g7j4whf62xw68k5zd4k0k5nh6ys5mszid028"))

(define rust-mime-0.3.17
  (crate-source "mime" "0.3.17"
                "16hkibgvb9klh0w0jk5crr5xv90l3wlf77ggymzjmvl1818vnxv8"))

(define rust-miniz-oxide-0.8.9
  (crate-source "miniz_oxide" "0.8.9"
                "05k3pdg8bjjzayq3rf0qhpirq9k37pxnasfn4arbs17phqn6m9qz"))

(define rust-mio-1.0.2
  (crate-source "mio" "1.0.2"
                "1v1cnnn44awxbcfm4zlavwgkvbyg7gp5zzjm8mqf1apkrwflvq40"))

(define rust-ml-kem-0.2.1
  (crate-source "ml-kem" "0.2.1"
                "16i3pb1lxp5f008krhnyh3ry7jb8pgwx0jcg27rmdjv9r3hgxglp"))

(define rust-mnl-0.3.0
  (crate-source "mnl" "0.3.0"
                "1yvi1w3z3hwv38khddwkxwp1vskb2kz0gxy9qg2vgqzrd5m62fjx"))

(define rust-mnl-sys-0.2.2
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "mnl-sys" "0.2.2"
                "0k0d3qfhiixxnvshf2xw1a036mgdxjnyg3nyrbrm7v8jmw3wdwx0"))

(define rust-mockito-1.6.1
  (crate-source "mockito" "1.6.1"
                "1qjfkipaccvays58a9vzdnb9lhrh24i1mkkb3sfsyvm3d78xcb35"))

(define rust-moka-0.12.10
  (crate-source "moka" "0.12.10"
                "09h9ww66vxrkizma99n7ib2fm91crkw4msp650j2i94lr911ccm9"))

(define rust-multimap-0.10.0
  (crate-source "multimap" "0.10.0"
                "00vs2frqdhrr8iqx4y3fbq73ax5l12837fvbjrpi729d85alrz6y"))

(define rust-native-windows-gui-1.0.13
  (crate-source "native-windows-gui" "1.0.13"
                "0m44lbslzvs04i4rgcphld23qlwf9zzlzmspgimyp3gnd6k06w2g"))

(define rust-natord-1.0.9
  (crate-source "natord" "1.0.9"
                "0z75spwag3ch20841pvfwhh3892i2z2sli4pzp1jgizbipdrd39h"))

(define rust-ndk-sys-0.5.0+25.2.9519653
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "ndk-sys" "0.5.0+25.2.9519653"
                "14bnxww0f17xl8pyn6j5kpkl98snjl9lin8i7qv4zzb0vmlnf6cc"))

(define rust-neon-1.0.0
  (crate-source "neon" "1.0.0"
                "1p0k7hxlm9hykk7qx7ba6881zv31x4rhwyw477f8f72188148xbx"))

(define rust-neon-macros-1.0.0
  (crate-source "neon-macros" "1.0.0"
                "12z3kqb325cn0xs73qlrjmfnmxqfm054hpypg9zf8imng7g3z0f6"))

(define rust-netlink-packet-core-0.8.0
  (crate-source "netlink-packet-core" "0.8.0"
                "07p3dj301ilw5ahbpiq5pyjvc2awrq0fkqgma9raz34mw2gphpbl"))

(define rust-netlink-packet-route-0.25.1
  (crate-source "netlink-packet-route" "0.25.1"
                "1vxmlym5rx40rd8kas9b3hqzd0238jybbam5gyfs3qlvhfvgbhiy"))

(define rust-netlink-proto-0.12.0
  (crate-source "netlink-proto" "0.12.0"
                "0a11h4jvzbzzdcvrgpcpy23w74x67jj6x2fpxr3hwhqiw4716pdn"))

(define rust-netlink-sys-0.8.7
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "netlink-sys" "0.8.7"
                "08xxx1ng7fxkvqrh81y95hni5mnir1ksg5xzj4vbj32rf2m07j8n"))

(define rust-nftnl-0.9.1
  (crate-source "nftnl" "0.9.1"
                "16sxwzlz8f5nmgjmy824svdc7zsdhim1cp1s5sfxqx8nwc2gjc55"))

(define rust-nftnl-sys-0.6.4
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "nftnl-sys" "0.6.4"
                "1979gxhdjzaiwinr42m5a295a6jy896n6m6l9y56mshyr2s2iyng"))

(define rust-nix-0.23.2
  (crate-source "nix" "0.23.2"
                "0p5kxhm5d8lry0szqbsllpcb5i3z7lg1dkglw0ni2l011b090dwg"))

(define rust-nix-0.28.0
  (crate-source "nix" "0.28.0"
                "1r0rylax4ycx3iqakwjvaa178jrrwiiwghcw95ndzy72zk25c8db"))

(define rust-nix-0.29.0
  (crate-source "nix" "0.29.0"
                "0ikvn7s9r2lrfdm3mx1h7nbfjvcc6s9vxdzw7j5xfkd2qdnp9qki"))

(define rust-nix-0.30.1
  (crate-source "nix" "0.30.1"
                "1dixahq9hk191g0c2ydc0h1ppxj0xw536y6rl63vlnp06lx3ylkl"))

(define rust-no-std-net-0.6.0
  (crate-source "no-std-net" "0.6.0"
                "0ravflgyh0q2142gjdz9iav5yqci3ga7gbnk4mmfcnqkrq54lya3"))

(define rust-notify-8.0.0
  (crate-source "notify" "8.0.0"
                "0hz9ab68gsbkidms6kgl4v7capfqjyl40vpfdarcfsnnnc1q9vig"))

(define rust-notify-types-2.0.0
  (crate-source "notify-types" "2.0.0"
                "0pcjm3wnvb7pvzw6mn89csv64ip0xhx857kr8jic5vddi6ljc22y"))

(define rust-nu-ansi-term-0.50.1
  (crate-source "nu-ansi-term" "0.50.1"
                "16a3isvbxx8pa3lk71h3cq2fsx2d17zzq42j4mhpxy81gl2qx8nl"))

(define rust-num-conv-0.2.0
  (crate-source "num-conv" "0.2.0"
                "0l4hj7lp8zbb9am4j3p7vlcv47y9bbazinvnxx9zjhiwkibyr5yg"))

(define rust-num-traits-0.2.18
  (crate-source "num-traits" "0.2.18"
                "0yjib8p2p9kzmaz48xwhs69w5dh1wipph9jgnillzd2x33jz03fs"))

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

(define rust-objc2-0.6.2
  (crate-source "objc2" "0.6.2"
                "1g3qa1vxp6nlh4wllll921z299d3s1is31m1ccasd8pklxxka7sn"))

(define rust-objc2-app-kit-0.2.2
  (crate-source "objc2-app-kit" "0.2.2"
                "1zqyi5l1bm26j1bgmac9783ah36m5kcrxlqp5carglnpwgcrms74"))

(define rust-objc2-core-data-0.2.2
  (crate-source "objc2-core-data" "0.2.2"
                "1vvk8zjylfjjj04dzawydmqqz5ajvdkhf22cnb07ihbiw14vyzv1"))

(define rust-objc2-core-foundation-0.3.1
  (crate-source "objc2-core-foundation" "0.3.1"
                "0rn19d70mwxyv74kx7aqm5in6x320vavq9v0vrm81vbg9a4w440w"))

(define rust-objc2-core-image-0.2.2
  (crate-source "objc2-core-image" "0.2.2"
                "102csfb82zi2sbzliwsfd589ckz0gysf7y6434c9zj97lmihj9jm"))

(define rust-objc2-encode-4.1.0
  (crate-source "objc2-encode" "4.1.0"
                "0cqckp4cpf68mxyc2zgnazj8klv0z395nsgbafa61cjgsyyan9gg"))

(define rust-objc2-foundation-0.2.2
  (crate-source "objc2-foundation" "0.2.2"
                "1a6mi77jsig7950vmx9ydvsxaighzdiglk5d229k569pvajkirhf"))

(define rust-objc2-foundation-0.3.1
  (crate-source "objc2-foundation" "0.3.1"
                "0g5hl47dxzabs7wndcg6kz3q137v9hwfay1jd2da1q9gglj3224h"))

(define rust-objc2-metal-0.2.2
  (crate-source "objc2-metal" "0.2.2"
                "1mmdga66qpxrcfq3gxxhysfx3zg1hpx4z886liv3j0pnfq9bl36x"))

(define rust-objc2-quartz-core-0.2.2
  (crate-source "objc2-quartz-core" "0.2.2"
                "0ynw8819c36l11rim8n0yzk0fskbzrgaqayscyqi8swhzxxywaz4"))

(define rust-objc2-security-0.3.1
  (crate-source "objc2-security" "0.3.1"
                "0i0sfdwjfynwvf5vpbfqpdsabh3fp96v7p244v20hsxn7bpy1y71"))

(define rust-objc2-service-management-0.3.1
  (crate-source "objc2-service-management" "0.3.1"
                "1ghjhbm0bws9701kys61zppg4c67x2f1vhmkfa2x0i0hb066bjk2"))

(define rust-objc-id-0.1.1
  (crate-source "objc_id" "0.1.1"
                "0fq71hnp2sdblaighjc82yrac3adfmqzhpr11irhvdfp9gdlsbf9"))

(define rust-object-0.37.3
  (crate-source "object" "0.37.3"
                "1zikiy9xhk6lfx1dn2gn2pxbnfpmlkn0byd7ib1n720x0cgj0xpz"))

(define rust-once-cell-1.20.3
  (crate-source "once_cell" "1.20.3"
                "0bp6rgrsri1vfdcahsimk08zdiilv14ppgcnpbiw8hqyp2j64m4l"))

(define rust-oorandom-11.1.5
  (crate-source "oorandom" "11.1.5"
                "07mlf13z453fq01qff38big1lh83j8l6aaglf63ksqzzqxc0yyfn"))

(define rust-opaque-debug-0.3.1
  (crate-source "opaque-debug" "0.3.1"
                "10b3w0kydz5jf1ydyli5nv10gdfp97xh79bgz327d273bs46b3f0"))

(define rust-option-ext-0.2.0
  (crate-source "option-ext" "0.2.0"
                "0zbf7cx8ib99frnlanpyikm1bx8qn8x602sw1n7bg6p9x94lyx04"))

(define rust-os-info-3.9.2
  (crate-source "os_info" "3.9.2"
                "12zl51iws71ary70282kxbqfaizwd71ivv38xr0mg34rrk420rbf"))

(define rust-paranoid-android-0.2.2
  (crate-source "paranoid-android" "0.2.2"
                "1p5a1jn373r67j4zgxr2f3qq5gjpfrkm8wkfipil66rp7pb9a5qh"))

(define rust-parking-2.2.1
  (crate-source "parking" "2.2.1"
                "1fnfgmzkfpjd69v4j9x737b1k8pnn054bvzcn5dm3pkgq595d3gk"))

(define rust-parking-lot-0.12.1
  (crate-source "parking_lot" "0.12.1"
                "13r2xk7mnxfc5g0g6dkdxqdqad99j7s7z8zhzz4npw5r0g0v4hip"))

(define rust-parking-lot-core-0.9.9
  (crate-source "parking_lot_core" "0.9.9"
                "13h0imw1aq86wj28gxkblhkzx6z1gk8q18n0v76qmmj6cliajhjc"))

(define rust-pastey-0.1.1
  (crate-source "pastey" "0.1.1"
                "1v389jkifv757903flrrps67dvc6q6giwlyx3xi33hcfjmgjxyrm"))

(define rust-pcap-2.1.0
  (crate-source "pcap" "2.1.0"
                "0m70fv39ssnxj79hpapkcq77j173smc2p36m6b7girz576a36kgy"))

(define rust-pcap-file-2.0.0
  (crate-source "pcap-file" "2.0.0"
                "1cni4pljw1hbk160sk5al2d2rlcr2x84hv5p6ygqy1bvflwz3h8z"))

(define rust-percent-encoding-2.3.1
  (crate-source "percent-encoding" "2.3.1"
                "0gi8wgx0dcy8rnv1kywdv98lwcx67hz0a0zwpib5v2i08r88y573"))

(define rust-petgraph-0.6.4
  (crate-source "petgraph" "0.6.4"
                "1ac6wfq5f5pzcv0nvzzfgjbwg2kwslpnzsw5wcmxlscfcb9azlz1"))

(define rust-pfctl-0.7.0
  (crate-source "pfctl" "0.7.0"
                "1aan6ia6d1lim6d1xzlk6np4xmv9rxagyz2igyjvvdjq6w3jqkcl"))

(define rust-phf-0.11.2
  (crate-source "phf" "0.11.2"
                "1p03rsw66l7naqhpgr1a34r9yzi1gv9jh16g3fsk6wrwyfwdiqmd"))

(define rust-phf-codegen-0.11.2
  (crate-source "phf_codegen" "0.11.2"
                "0nia6h4qfwaypvfch3pnq1nd2qj64dif4a6kai3b7rjrsf49dlz8"))

(define rust-phf-generator-0.11.2
  (crate-source "phf_generator" "0.11.2"
                "1c14pjyxbcpwkdgw109f7581cc5fa3fnkzdq1ikvx7mdq9jcrr28"))

(define rust-phf-shared-0.11.2
  (crate-source "phf_shared" "0.11.2"
                "0azphb0a330ypqx3qvyffal5saqnks0xvl8rj73jlk3qxxgbkz4h"))

(define rust-pin-project-1.1.5
  (crate-source "pin-project" "1.1.5"
                "1cxl146x0q7lawp0m1826wsgj8mmmfs6ja8q7m6f7ff5j6vl7gxn"))

(define rust-pin-project-internal-1.1.5
  (crate-source "pin-project-internal" "1.1.5"
                "0r9r4ivwiyqf45sv6b30l1dx282lxaax2f6gl84jwa3q590s8f1g"))

(define rust-pin-project-lite-0.2.14
  (crate-source "pin-project-lite" "0.2.14"
                "00nx3f04agwjlsmd3mc5rx5haibj2v8q9b52b0kwn63wcv4nz9mx"))

(define rust-pin-utils-0.1.0
  (crate-source "pin-utils" "0.1.0"
                "117ir7vslsl2z1a7qzhws4pd01cg2d3338c47swjyvqv2n60v1wb"))

(define rust-piper-0.2.4
  (crate-source "piper" "0.2.4"
                "0rn0mjjm0cwagdkay77wgmz3sqf8fqmv9d9czm79mvr2yj8c9j4n"))

(define rust-pkcs8-0.10.2
  (crate-source "pkcs8" "0.10.2"
                "1dx7w21gvn07azszgqd3ryjhyphsrjrmq5mmz1fbxkj5g0vv4l7r"))

(define rust-pkg-config-0.3.30
  (crate-source "pkg-config" "0.3.30"
                "1v07557dj1sa0aly9c90wsygc0i8xv5vnmyv0g94lpkvj8qb4cfj"))

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

(define rust-poly1305-0.8.0
  (crate-source "poly1305" "0.8.0"
                "1grs77skh7d8vi61ji44i8gpzs3r9x7vay50i6cg8baxfa8bsnc1"))

(define rust-polyval-0.6.2
  (crate-source "polyval" "0.6.2"
                "09gs56vm36ls6pyxgh06gw2875z2x77r8b2km8q28fql0q6yc7wx"))

(define rust-portable-atomic-1.11.0
  (crate-source "portable-atomic" "1.11.0"
                "0glb2wngflvfmg789qbf6dbnwcf6ai212fs7n0lf1c66rd49n3im"))

(define rust-powerfmt-0.2.0
  (crate-source "powerfmt" "0.2.0"
                "14ckj2xdpkhv3h6l5sdmb9f1d57z8hbfpdldjc2vl5givq2y77j3"))

(define rust-ppv-lite86-0.2.17
  (crate-source "ppv-lite86" "0.2.17"
                "1pp6g52aw970adv3x2310n7glqnji96z0a9wiamzw89ibf0ayh2v"))

(define rust-pqcrypto-hqc-0.2.1
  (crate-source "pqcrypto-hqc" "0.2.1"
                "14b6as11fmz9xc49xk0klpdcw9z8k31sgrk4xqrq3hrsbqzdhfnc"))

(define rust-pqcrypto-internals-0.2.10
  (crate-source "pqcrypto-internals" "0.2.10"
                "08nzi6llk7c2qll8qlfgmhfwbgvbndy7g58wg1gy1zrg62g8wh2z"))

(define rust-pqcrypto-traits-0.3.5
  (crate-source "pqcrypto-traits" "0.3.5"
                "1fsigdrjrwkyc00da0y2z1n626lnak268wfjsxl9xvafcp3m3s4l"))

(define rust-prefix-trie-0.7.0
  (crate-source "prefix-trie" "0.7.0"
                "080xl1cmm3gdgbx38jbmrbj2dkngm10r07j5dg3ndpgi4my4rkw5"))

(define rust-prettyplease-0.2.19
  (crate-source "prettyplease" "0.2.19"
                "0l35djp14h2jbw7984vcabvqwl26szldl1zxbygv8hjg5q7wzhjs"))

(define rust-proc-macro2-1.0.94
  (crate-source "proc-macro2" "1.0.94"
                "114wxb56gdj9vy44q0ll3l2x9niqzcbyqikydmlb5f3h5rsp26d3"))

(define rust-proptest-1.9.0
  (crate-source "proptest" "1.9.0"
                "0h4cprpwir4dkxfamj1iz6qx3cp38gp552rln1ma3l1b7928krmy"))

(define rust-prost-0.13.3
  (crate-source "prost" "0.13.3"
                "0gx1kbvgnws59ggv1mda15bc00f6hlxp24s9k1zyhz841vcqf13v"))

(define rust-prost-build-0.13.3
  (crate-source "prost-build" "0.13.3"
                "05dyk9fzyl05p2chjb88kj7qbxxvadc469k9060qdw45j2qih4qc"))

(define rust-prost-derive-0.13.3
  (crate-source "prost-derive" "0.13.3"
                "1i9wh2q5rly0lwsmxq5svwyk4adcb5j31gyhwjj682az1n2jymg9"))

(define rust-prost-types-0.13.3
  (crate-source "prost-types" "0.13.3"
                "0w6n122pi7fsfvnwfcm9mil7q1105kg62yxrpn6znck2786slna7"))

(define rust-quick-error-1.2.3
  (crate-source "quick-error" "1.2.3"
                "1q6za3v78hsspisc197bg3g7rpc989qycy8ypr8ap8igv10ikl51"))

(define rust-quick-xml-0.27.1
  (crate-source "quick-xml" "0.27.1"
                "0hacs71afvppq6d7x6b8d4liv0rcqhsf9mrcyrb8lxnxazq57h7z"))

(define rust-quinn-0.11.8
  (crate-source "quinn" "0.11.8"
                "1j02h87nfxww5mjcw4vjcnx8b70q0yinnc8xvjv82ryskii18qk2"))

(define rust-quinn-proto-0.11.12
  (crate-source "quinn-proto" "0.11.12"
                "0bj2yyrf1mrg2bcj19ipsspvrj5sq0di0pz5maw5pj31j4x89ps9"))

(define rust-quinn-udp-0.5.12
  (crate-source "quinn-udp" "0.5.12"
                "0hm89bv7mm383lv2c8z5r9512pdgp1q26lsmazicajgrj6cm4kpf"))

(define rust-quote-1.0.39
  (crate-source "quote" "1.0.39"
                "00a8q2w3aacil4aqnndyv73k0x4lj55kp487k66nbq89x5693wf1"))

(define rust-r-efi-5.2.0
  (crate-source "r-efi" "5.2.0"
                "1ig93jvpqyi87nc5kb6dri49p56q7r7qxrn8kfizmqkfj5nmyxkl"))

(define rust-rand-0.8.5
  (crate-source "rand" "0.8.5"
                "013l6931nn7gkc23jz5mm3qdhf93jjf0fg64nz2lp4i51qd8vbrl"))

(define rust-rand-0.9.2
  (crate-source "rand" "0.9.2"
                "1lah73ainvrgl7brcxx0pwhpnqa3sm3qaj672034jz8i0q7pgckd"))

(define rust-rand-chacha-0.3.1
  (crate-source "rand_chacha" "0.3.1"
                "123x2adin558xbhvqb8w4f6syjsdkmqff8cxwhmjacpsl1ihmhg6"))

(define rust-rand-chacha-0.9.0
  (crate-source "rand_chacha" "0.9.0"
                "1jr5ygix7r60pz0s1cv3ms1f6pd1i9pcdmnxzzhjc3zn3mgjn0nk"))

(define rust-rand-core-0.6.4
  (crate-source "rand_core" "0.6.4"
                "0b4j2v4cb5krak1pv6kakv4sz6xcwbrmy2zckc32hsigbrwy82zc"))

(define rust-rand-core-0.9.3
  (crate-source "rand_core" "0.9.3"
                "0f3xhf16yks5ic6kmgxcpv1ngdhp48mmfy4ag82i1wnwh8ws3ncr"))

(define rust-rand-distr-0.5.1
  (crate-source "rand_distr" "0.5.1"
                "0qvlzxq4a2rvrf3wq0xq1bfw8iy9zqm6jlmbywqzld6g1paib1ka"))

(define rust-rand-xorshift-0.4.0
  (crate-source "rand_xorshift" "0.4.0"
                "0njsn25pis742gb6b89cpq7jp48v9n23a9fvks10yczwks8n4fai"))

(define rust-rayon-1.11.0
  (crate-source "rayon" "1.11.0"
                "13x5fxb7rn4j2yw0cr26n7782jkc7rjzmdkg42qxk3xz0p8033rn"))

(define rust-rayon-core-1.13.0
  (crate-source "rayon-core" "1.13.0"
                "14dbr0sq83a6lf1rfjq5xdpk5r6zgzvmzs5j6110vlv2007qpq92"))

(define rust-redox-syscall-0.4.1
  (crate-source "redox_syscall" "0.4.1"
                "1aiifyz5dnybfvkk4cdab9p2kmphag1yad6iknc7aszlxxldf8j7"))

(define rust-redox-users-0.5.2
  (crate-source "redox_users" "0.5.2"
                "1b17q7gf7w8b1vvl53bxna24xl983yn7bd00gfbii74bcg30irm4"))

(define rust-regex-1.10.4
  (crate-source "regex" "1.10.4"
                "0k5sb0h2mkwf51ab0gvv3x38jp1q7wgxf63abfbhi0wwvvgxn5y1"))

(define rust-regex-automata-0.4.6
  (crate-source "regex-automata" "0.4.6"
                "1spaq7y4im7s56d1gxa2hi4hzf6dwswb1bv8xyavzya7k25kpf46"))

(define rust-regex-lite-0.1.6
  (crate-source "regex-lite" "0.1.6"
                "0almvx3z75f611pdcd9mslh7zxg76zh3shifql4ndch6mn3rb92k"))

(define rust-regex-syntax-0.8.3
  (crate-source "regex-syntax" "0.8.3"
                "0mhzkm1pkqg6y53xv056qciazlg47pq0czqs94cn302ckvi49bdd"))

(define rust-reqwest-0.12.23
  (crate-source "reqwest" "0.12.23"
                "1svw1k0jx17cmlwhixwqfv3bgpjapciw7klkghnd9cljh16g6afl"))

(define rust-resolv-conf-0.7.0
  (crate-source "resolv-conf" "0.7.0"
                "005sk8r1php2g41yn7fdf1sn8cafyaqm6jxia42h2v88saa47r2j"))

(define rust-ring-0.17.13
  (crate-source "ring" "0.17.13"
                "1vjhhlmpqqd9lc53ffjj1yk203188n2km27g3myvssm15a1mvb3h"))

(define rust-ring-compat-0.8.0
  (crate-source "ring-compat" "0.8.0"
                "1m2vvmbg607f55afx75b9kxbyx6b5wqvhhfv2445z08b2np7pknc"))

(define rust-rs-release-0.1.9
  (crate-source "rs-release" "0.1.9"
                "0yhi7i8xxmc8kpkd5b4dimqa788iww4b1k2w9b0jzya52wwvmvr1"))

(define rust-rtnetlink-0.18.1
  (crate-source "rtnetlink" "0.18.1"
                "1dsb4r87k2k607apccqr5gqaj4ykvb35xr3q645lvhv49jm1bz88"))

(define rust-rustc-demangle-0.1.26
  (crate-source "rustc-demangle" "0.1.26"
                "1kja3nb0yhlm4j2p1hl8d7sjmn2g9fa1s4pj0qma5kj2lcndkxsn"))

(define rust-rustc-hash-2.1.0
  (crate-source "rustc-hash" "2.1.0"
                "15yln6fmqlbg0k35r748h8g9xsd637ri23xihq81jb03ncwq1yy7"))

(define rust-rustc-version-0.4.0
  (crate-source "rustc_version" "0.4.0"
                "0rpk9rcdk405xhbmgclsh4pai0svn49x35aggl4nhbkd4a2zb85z"))

(define rust-rustix-0.38.34
  (crate-source "rustix" "0.38.34"
                "03vkqa2ism7q56rkifyy8mns0wwqrk70f4i4fd53r97p8b05xp3h"))

(define rust-rustls-0.23.35
  (crate-source "rustls" "0.23.35"
                "13xxk2qqchibd7pr0laqq6pzayx9xm4rb45d8rz68kvxday58gsk"))

(define rust-rustls-pki-types-1.13.1
  (crate-source "rustls-pki-types" "1.13.1"
                "134hjrwxzrkiag11psaml4gv75f4a9m307cc8rr05fjlbyfhz33h"))

(define rust-rustls-webpki-0.103.8
  (crate-source "rustls-webpki" "0.103.8"
                "0lpymb84bi5d2pm017n39nbiaa5cd046hgz06ir29ql6a8pzmz9g"))

(define rust-rustversion-1.0.15
  (crate-source "rustversion" "1.0.15"
                "0iyy66mldq0z7h6n2zm6fw2bndw04pifhv5s7xda8xzj668nzbw0"))

(define rust-rusty-fork-0.3.0
  (crate-source "rusty-fork" "0.3.0"
                "0kxwq5c480gg6q0j3bg4zzyfh2kwmc3v2ba94jw8ncjc8mpcqgfb"))

(define rust-ryu-1.0.17
  (crate-source "ryu" "1.0.17"
                "188vrsh3zlnl5xl7lw0rp2sc0knpx8yaqpwvr648b6h12v4rfrp8"))

(define rust-ryu-js-0.2.2
  (crate-source "ryu-js" "0.2.2"
                "0zqf0ypy6dl26bz4aigqvrvn6wfqx4iy9mi2i9km6kgdphkgq635"))

(define rust-same-file-1.0.6
  (crate-source "same-file" "1.0.6"
                "00h5j1w87dmhnvbv9l8bic3y7xxsnjmssvifw2ayvgx9mb1ivz4k"))

(define rust-scoped-tls-1.0.1
  (crate-source "scoped-tls" "1.0.1"
                "15524h04mafihcvfpgxd8f4bgc3k95aclz8grjkg9a0rxcvn9kz1"))

(define rust-scopeguard-1.2.0
  (crate-source "scopeguard" "1.2.0"
                "0jcz9sd47zlsgcnm1hdw0664krxwb5gczlif4qngj2aif8vky54l"))

(define rust-sealed-0.6.0
  (crate-source "sealed" "0.6.0"
                "01y1mf4f4j6d2x5307gcvagkkz5jwz2w2jdlf3k5bm93xb2niy92"))

(define rust-semver-1.0.22
  (crate-source "semver" "1.0.22"
                "1jir6q2ps4s5v52bqxpvwj35p0m0ahl5pf62ppwksbv5kvk3zm4j"))

(define rust-send-wrapper-0.6.0
  (crate-source "send_wrapper" "0.6.0"
                "0wrxzsh9fzgkkkms621ydnz8mj30ilyq299a8cf65jn1y72hw2yd"))

(define rust-sendfd-0.4.3
  (crate-source "sendfd" "0.4.3"
                "160pf2dp5r8smjc6ssk6jf9k93vc280wk8i362xi6zi6zjw72jv0"))

(define rust-serde-1.0.228
  (crate-source "serde" "1.0.228"
                "17mf4hhjxv5m90g42wmlbc61hdhlm6j9hwfkpcnd72rpgzm993ls"))

(define rust-serde-core-1.0.228
  (crate-source "serde_core" "1.0.228"
                "1bb7id2xwx8izq50098s5j2sqrrvk31jbbrjqygyan6ask3qbls1"))

(define rust-serde-derive-1.0.228
  (crate-source "serde_derive" "1.0.228"
                "0y8xm7fvmr2kjcd029g9fijpndh8csv5m20g4bd76w8qschg4h6m"))

(define rust-serde-json-1.0.138
  (crate-source "serde_json" "1.0.138"
                "0j99hyp2plvdcyrfzdz0875d0dm04q5ngsd7dr5fk1x7glp1jd6l"))

(define rust-serde-spanned-0.6.8
  (crate-source "serde_spanned" "0.6.8"
                "1q89g70azwi4ybilz5jb8prfpa575165lmrffd49vmcf76qpqq47"))

(define rust-serde-urlencoded-0.7.1
  (crate-source "serde_urlencoded" "0.7.1"
                "1zgklbdaysj3230xivihs30qi5vkhigg323a9m62k8jwf4a1qjfk"))

(define rust-sha1-0.10.6
  (crate-source "sha1" "0.10.6"
                "1fnnxlfg08xhkmwf2ahv634as30l1i3xhlhkvxflmasi5nd85gz3"))

(define rust-sha2-0.10.8
  (crate-source "sha2" "0.10.8"
                "1j1x78zk9il95w9iv46dh9wm73r6xrgj32y6lzzw7bxws9dbfgbr"))

(define rust-sha256-1.5.0
  (crate-source "sha256" "1.5.0"
                "1c35j1z4inpz7fwa6vy0xf3arffz5mykyj8nlc50g8sgj5m8y9qq"))

(define rust-sha3-0.10.8
  (crate-source "sha3" "0.10.8"
                "0q5s3qlwnk8d5j34jya98j1v2p3009wdmnqdza3yydwgi8kjv1vm"))

(define rust-shadowsocks-1.23.2
  (crate-source "shadowsocks" "1.23.2"
                "0g7ljy9805yrrpapwzjj93fwlrwcz8amkk9nhxj8avndyc19z73g"))

(define rust-shadowsocks-crypto-0.6.2
  (crate-source "shadowsocks-crypto" "0.6.2"
                "199c5s5h71w41isav41qzfcbm3zgspjbkhy1ncd1qvsq2wyql0rx"))

(define rust-sharded-slab-0.1.7
  (crate-source "sharded-slab" "0.1.7"
                "1xipjr4nqsgw34k7a2cgj9zaasl2ds6jwn89886kww93d32a637l"))

(define rust-shlex-1.3.0
  (crate-source "shlex" "1.3.0"
                "0r1y6bv26c1scpxvhg2cabimrmwgbp4p3wy6syj9n0c4s3q2znhg"))

(define rust-signal-hook-registry-1.4.2
  (crate-source "signal-hook-registry" "1.4.2"
                "1cb5akgq8ajnd5spyn587srvs4n26ryq0p78nswffwhv46sf1sd9"))

(define rust-signature-2.2.0
  (crate-source "signature" "2.2.0"
                "1pi9hd5vqfr3q3k49k37z06p7gs5si0in32qia4mmr1dancr6m3p"))

(define rust-similar-2.6.0
  (crate-source "similar" "2.6.0"
                "0vk89dx2mmjp81pmszsa1s3mpzvbiy4krvfbq3s3mc3k27wd9q8x"))

(define rust-simple-signal-1.1.1
  (crate-source "simple-signal" "1.1.1"
                "12r82dpipdkkfmslp04pd3b2fpr9h4zxjfs8axynchncmm2dmxsk"))

(define rust-siphasher-0.3.11
  (crate-source "siphasher" "0.3.11"
                "03axamhmwsrmh0psdw3gf7c0zc4fyl5yjxfifz9qfka6yhkqid9q"))

(define rust-slab-0.4.9
  (crate-source "slab" "0.4.9"
                "0rxvsgir0qw5lkycrqgb1cxsvxzjv9bmx73bk5y42svnzfba94lg"))

(define rust-smallvec-1.13.2
  (crate-source "smallvec" "1.13.2"
                "0rsw5samawl3wsw6glrsb127rx6sh89a8wyikicw6dkdcjd1lpiw"))

(define rust-socket2-0.5.8
  (crate-source "socket2" "0.5.8"
                "1s7vjmb5gzp3iaqi94rh9r63k9cj00kjgbfn7gn60kmnk6fjcw69"))

(define rust-socket2-0.6.0
  (crate-source "socket2" "0.6.0"
                "01qqdzfnr0bvdwq6wl56c9c4m2cvbxn43dfpcv8gjx208sph8d93"))

(define rust-spin-0.10.0
  (crate-source "spin" "0.10.0"
                "14g5sdsjf4wk2ys5dq8ivkq4rz57gphab2gcdzar5hnrk35lrznm"))

(define rust-spki-0.7.3
  (crate-source "spki" "0.7.3"
                "17fj8k5fmx4w9mp27l970clrh5qa7r5sjdvbsln987xhb34dc7nr"))

(define rust-stable-deref-trait-1.2.0
  (crate-source "stable_deref_trait" "1.2.0"
                "1lxjr8q2n534b2lhkxd6l6wcddzjvnksi58zv11f9y0jjmr15wd8"))

(define rust-strsim-0.11.1
  (crate-source "strsim" "0.11.1"
                "0kzvqlw8hxqb7y598w1s0hxlnmi84sg5vsipp3yg5na5d1rvba3x"))

(define rust-strum-0.27.2
  (crate-source "strum" "0.27.2"
                "1ksb9jssw4bg9kmv9nlgp2jqa4vnsa3y4q9zkppvl952q7vdc8xg"))

(define rust-strum-macros-0.27.2
  (crate-source "strum_macros" "0.27.2"
                "19xwikxma0yi70fxkcy1yxcv0ica8gf3jnh5gj936jza8lwcx5bn"))

(define rust-subtle-2.5.0
  (crate-source "subtle" "2.5.0"
                "1g2yjs7gffgmdvkkq0wrrh0pxds3q0dv6dhkw9cdpbib656xdkc1"))

(define rust-surge-ping-0.8.1
  (crate-source "surge-ping" "0.8.1"
                "0xyfmxwskiq3pq7sazvj147yzvck5fpqiw735hfk2nvw9k79bgzg"))

(define rust-syn-1.0.109
  (crate-source "syn" "1.0.109"
                "0ds2if4600bd59wsv7jjgfkayfzy3hnazs394kz6zdkmna8l3dkj"))

(define rust-syn-2.0.108
  (crate-source "syn" "2.0.108"
                "05z908svb0yw5wzrlv27l2i8j1d8l16hd5r8bjh809146myr2n6s"))

(define rust-syn-mid-0.6.0
  (crate-source "syn-mid" "0.6.0"
                "0jg0phwwy2nnm7crg26825klsa8k5pyr3klxn3gs676x12xkbp5m"))

(define rust-sync-wrapper-1.0.1
  (crate-source "sync_wrapper" "1.0.1"
                "150k6lwvr4nl237ngsz8fj5j78k712m4bggrfyjsidllraz5l1m7"))

(define rust-synstructure-0.13.1
  (crate-source "synstructure" "0.13.1"
                "0wc9f002ia2zqcbj0q2id5x6n7g1zjqba7qkg2mr0qvvmdk7dby8"))

(define rust-system-configuration-0.5.1
  (crate-source "system-configuration" "0.5.1"
                "1rz0r30xn7fiyqay2dvzfy56cvaa3km74hnbz2d72p97bkf3lfms"))

(define rust-system-configuration-sys-0.5.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "system-configuration-sys" "0.5.0"
                "1jckxvdr37bay3i9v52izgy52dg690x5xfg3hd394sv2xf4b2px7"))

(define rust-tagptr-0.2.0
  (crate-source "tagptr" "0.2.0"
                "05r4mwvlsclx1ayj65hpzjv3dn4wpi8j4xm695vydccf9k7r683v"))

(define rust-tempfile-3.10.1
  (crate-source "tempfile" "3.10.1"
                "1wdzz35ri168jn9al4s1g2rnsrr5ci91khgarc2rvpb3nappzdw5"))

(define rust-test-log-0.2.17
  (crate-source "test-log" "0.2.17"
                "03ydax0mamyhn5n6x0l8d2kz76fly7jv3xmnwmk12611sa1n1x77"))

(define rust-test-log-macros-0.2.17
  (crate-source "test-log-macros" "0.2.17"
                "0gsmmdsi8aqgxbr16n78sf1m6x5s29gfvlk0n7d0yg5mdly0r3c8"))

(define rust-thiserror-1.0.59
  (crate-source "thiserror" "1.0.59"
                "1ai39ga7d50jny5zzqv1zzgmc81mfb65asmfqfgz4ygzig86l4ph"))

(define rust-thiserror-2.0.17
  (crate-source "thiserror" "2.0.17"
                "1j2gixhm2c3s6g96vd0b01v0i0qz1101vfmw0032mdqj1z58fdgn"))

(define rust-thiserror-impl-1.0.59
  (crate-source "thiserror-impl" "1.0.59"
                "0rlb2jvpxx5xkpk52yh6gixlw0d5dx5343k8yddlr2smblxl3kfi"))

(define rust-thiserror-impl-2.0.17
  (crate-source "thiserror-impl" "2.0.17"
                "04y92yjwg1a4piwk9nayzjfs07sps8c4vq9jnsfq9qvxrn75rw9z"))

(define rust-thread-local-1.1.8
  (crate-source "thread_local" "1.1.8"
                "173i5lyjh011gsimk21np9jn8al18rxsrkjli20a7b8ks2xgk7lb"))

(define rust-time-0.3.47
  (crate-source "time" "0.3.47"
                "0b7g9ly2iabrlgizliz6v5x23yq5d6bpp0mqz6407z1s526d8fvl"))

(define rust-time-core-0.1.8
  (crate-source "time-core" "0.1.8"
                "1jidl426mw48i7hjj4hs9vxgd9lwqq4vyalm4q8d7y4iwz7y353n"))

(define rust-time-macros-0.2.27
  (crate-source "time-macros" "0.2.27"
                "058ja265waq275wxvnfwavbz9r1hd4dgwpfn7a1a9a70l32y8w1f"))

(define rust-tinystr-0.7.6
  (crate-source "tinystr" "0.7.6"
                "0bxqaw7z8r2kzngxlzlgvld1r6jbnwyylyvyjbv1q71rvgaga5wi"))

(define rust-tinytemplate-1.2.1
  (crate-source "tinytemplate" "1.2.1"
                "1g5n77cqkdh9hy75zdb01adxn45mkh9y40wdr7l68xpz35gnnkdy"))

(define rust-tinyvec-1.6.0
  (crate-source "tinyvec" "1.6.0"
                "0l6bl2h62a5m44jdnpn7lmj14rd44via8180i7121fvm73mmrk47"))

(define rust-tinyvec-macros-0.1.1
  (crate-source "tinyvec_macros" "0.1.1"
                "081gag86208sc3y6sdkshgw3vysm5d34p431dzw0bshz66ncng0z"))

(define rust-tipsy-0.6.5
  (crate-source "tipsy" "0.6.5"
                "0732mf7dr1clcrb0jygc9a0y5w0xg7w9g5szmzxxwljahd8nqici"))

(define rust-tokio-1.44.2
  (crate-source "tokio" "1.44.2"
                "0j4w3qvlcqzgbxlnap0czvspqj6x461vyk1sbqcf97g4rci8if76"))

(define rust-tokio-macros-2.5.0
  (crate-source "tokio-macros" "2.5.0"
                "1f6az2xbvqp7am417b78d1za8axbvjvxnmkakz9vr8s52czx81kf"))

(define rust-tokio-rustls-0.26.0
  (crate-source "tokio-rustls" "0.26.0"
                "1m00czrmk8x7pdjnz10a3da3i1d0sdf9j9vfp5dnk5ss1q6w8yqc"))

(define rust-tokio-socks-0.5.1
  (crate-source "tokio-socks" "0.5.1"
                "1h6qixh17yjf98bjyw4q8i36pf2lyfbcr9hkjjb6aalx0bx5s5ji"))

(define rust-tokio-stream-0.1.16
  (crate-source "tokio-stream" "0.1.16"
                "1wc65gprcsyzqlr0k091glswy96kph90i32gffi4ksyh03hnqkjg"))

(define rust-tokio-tfo-0.3.1
  (crate-source "tokio-tfo" "0.3.1"
                "1d7is1a3zfyqjy01b8hjcgs8sffm2plp2arxhmjr7qkiccn3id1z"))

(define rust-tokio-util-0.6.10
  (crate-source "tokio-util" "0.6.10"
                "01v5zkcxjdd5zaniqxxfl6isvd7y5qfmljpqsdyrfrvd3bh3x51n"))

(define rust-tokio-util-0.7.16
  (crate-source "tokio-util" "0.7.16"
                "1r9wdrg1k5hna3m0kc8kcb8jdb6n52g7vnw93kw2xxw4cyc7qc0l"))

(define rust-toml-0.5.11
  (crate-source "toml" "0.5.11"
                "0d2266nx8b3n22c7k24x4428z6di8n83a9n466jm7a2hipfz1xzl"))

(define rust-toml-0.8.19
  (crate-source "toml" "0.8.19"
                "0knjd3mkxyb87qcs2dark3qkpadidap3frqfj5nqvhpxwfc1zvd1"))

(define rust-toml-datetime-0.6.8
  (crate-source "toml_datetime" "0.6.8"
                "0hgv7v9g35d7y9r2afic58jvlwnf73vgd1mz2k8gihlgrf73bmqd"))

(define rust-toml-edit-0.22.20
  (crate-source "toml_edit" "0.22.20"
                "07ffw4626k6abicjxb2idh12f1p5fn965zk660zhqsyj5b048g2q"))

(define rust-tonic-0.13.1
  (crate-source "tonic" "0.13.1"
                "1acvnjzh61y0m829mijj6z2nzqnwshdsnmbcl2g4spw3bahinn3y"))

(define rust-tonic-build-0.13.1
  (crate-source "tonic-build" "0.13.1"
                "0iz8g4i9rkaigp5v8149bmj5f1qdgq9v739j845jzl8jwxxzdipa"))

(define rust-tower-0.5.2
  (crate-source "tower" "0.5.2"
                "1ybmd59nm4abl9bsvy6rx31m4zvzp5rja2slzpn712y9b68ssffh"))

(define rust-tower-http-0.6.6
  (crate-source "tower-http" "0.6.6"
                "1wh51y4rf03f91c6rvli6nwzsarx7097yx6sqlm75ag27pbjzj5d"))

(define rust-tower-layer-0.3.3
  (crate-source "tower-layer" "0.3.3"
                "03kq92fdzxin51w8iqix06dcfgydyvx7yr6izjq0p626v9n2l70j"))

(define rust-tower-service-0.3.3
  (crate-source "tower-service" "0.3.3"
                "1hzfkvkci33ra94xjx64vv3pp0sq346w06fpkcdwjcid7zhvdycd"))

(define rust-tracing-0.1.44
  (crate-source "tracing" "0.1.44"
                "006ilqkg1lmfdh3xhg3z762izfwmxcvz0w7m4qx2qajbz9i1drv3"))

(define rust-tracing-appender-0.2.4
  (crate-source "tracing-appender" "0.2.4"
                "1bxf7xvsr89glbq174cx0b9pinaacbhlmc85y1ssniv2rq5lhvbq"))

(define rust-tracing-attributes-0.1.31
  (crate-source "tracing-attributes" "0.1.31"
                "1np8d77shfvz0n7camx2bsf1qw0zg331lra0hxb4cdwnxjjwz43l"))

(define rust-tracing-core-0.1.36
  (crate-source "tracing-core" "0.1.36"
                "16mpbz6p8vd6j7sf925k9k8wzvm9vdfsjbynbmaxxyq6v7wwm5yv"))

(define rust-tracing-log-0.2.0
  (crate-source "tracing-log" "0.2.0"
                "1hs77z026k730ij1a9dhahzrl0s073gfa2hm5p0fbl0b80gmz1gf"))

(define rust-tracing-subscriber-0.3.22
  (crate-source "tracing-subscriber" "0.3.22"
                "07hz575a0p1c2i4xw3gs3hkrykhndnkbfhyqdwjhvayx4ww18c1g"))

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

(define rust-tun-0.8.5
  (crate-source "tun" "0.8.5"
                "0ph9y6la40dnqg2q7ybxpai4vdg517c0hn7897c3n3k52mh1fpxk"))

(define rust-typed-builder-0.20.1
  (crate-source "typed-builder" "0.20.1"
                "1ixgq9rnffvph1kd5ssd4xnnkcq7rx1k45vb4j7wf9l0l3ik17fd"))

(define rust-typed-builder-0.21.0
  (crate-source "typed-builder" "0.21.0"
                "0d454hcqn1b1h64z02m8cnqqpkhdivrw3ffpyw3c41lqgspvqqyf"))

(define rust-typed-builder-macro-0.20.1
  (crate-source "typed-builder-macro" "0.20.1"
                "0a6vry4jjl14ikmshqz26x951hpn9j760ycqdmr86sp4q0f7hdiw"))

(define rust-typed-builder-macro-0.21.0
  (crate-source "typed-builder-macro" "0.21.0"
                "0ns1snfbzbgdh83nvlws0dywfjdcbfdg5k8r6nfpag9av8ldin30"))

(define rust-typenum-1.17.0
  (crate-source "typenum" "1.17.0"
                "09dqxv69m9lj9zvv6xw5vxaqx15ps0vxyy5myg33i0kbqvq0pzs2"))

(define rust-udp-over-tcp-0.3.0.87936ac
  ;; TODO REVIEW: Define standalone package if this is a workspace.
  (origin
    (method git-fetch)
    (uri (git-reference
          (url "https://github.com/mullvad/udp-over-tcp")
          (commit "87936ac29b68b902565955f138ab02294bcc8593")))
    (file-name (git-file-name "rust-udp-over-tcp" "0.3.0.87936ac"))
    (sha256 (base32 "1bl5j5agdcgvawg6r7xmbjc1s8nvs2cjlnnra5syr1pkpwrrmxz4"))))

(define rust-unarray-0.1.4
  (crate-source "unarray" "0.1.4"
                "154smf048k84prsdgh09nkm2n0w0336v84jd4zikyn6v6jrqbspa"))

(define rust-unicode-ident-1.0.12
  (crate-source "unicode-ident" "1.0.12"
                "0jzf1znfpb2gx8nr8mvmyqs1crnv79l57nxnbiszc7xf7ynbjm1k"))

(define rust-universal-hash-0.5.1
  (crate-source "universal-hash" "0.5.1"
                "1sh79x677zkncasa95wz05b36134822w6qxmi1ck05fwi33f47gw"))

(define rust-untrusted-0.9.0
  (crate-source "untrusted" "0.9.0"
                "1ha7ib98vkc538x0z60gfn0fc5whqdd85mb87dvisdcaifi6vjwf"))

(define rust-url-2.5.4
  (crate-source "url" "2.5.4"
                "0q6sgznyy2n4l5lm16zahkisvc9nip9aa5q1pps7656xra3bdy1j"))

(define rust-utf16-iter-1.0.5
  (crate-source "utf16_iter" "1.0.5"
                "0ik2krdr73hfgsdzw0218fn35fa09dg2hvbi1xp3bmdfrp9js8y8"))

(define rust-utf8-iter-1.0.4
  (crate-source "utf8_iter" "1.0.4"
                "1gmna9flnj8dbyd8ba17zigrp9c4c3zclngf5lnb5yvz1ri41hdn"))

(define rust-utf8parse-0.2.1
  (crate-source "utf8parse" "0.2.1"
                "02ip1a0az0qmc2786vxk2nqwsgcwf17d3a38fkf0q7hrmwh9c6vi"))

(define rust-uuid-1.8.0
  (crate-source "uuid" "1.8.0"
                "1h7wks153j08xmdk06wnza3is8pn6j37hihd3kfv95xsxrzwz0x1"))

(define rust-valuable-0.1.1
  (crate-source "valuable" "0.1.1"
                "0r9srp55v7g27s5bg7a2m095fzckrcdca5maih6dy9bay6fflwxs"))

(define rust-vec1-1.12.1
  (crate-source "vec1" "1.12.1"
                "08k370srixpnqgvyxqjqvkzig4j9c5kapqzvzsqfys8ghib8pdpa"))

(define rust-version-check-0.9.4
  (crate-source "version_check" "0.9.4"
                "0gs8grwdlgh0xq660d7wr80x14vxbizmd8dbp29p2pdncx8lp1s9"))

(define rust-wait-timeout-0.2.0
  (crate-source "wait-timeout" "0.2.0"
                "1xpkk0j5l9pfmjfh1pi0i89invlavfrd9av5xp0zhxgb29dhy84z"))

(define rust-walkdir-2.5.0
  (crate-source "walkdir" "2.5.0"
                "0jsy7a710qv8gld5957ybrnc07gavppp963gs32xk4ag8130jy99"))

(define rust-want-0.3.1
  (crate-source "want" "0.3.1"
                "03hbfrnvqqdchb5kgxyavb9jabwza0dmh2vw5kg0dq8rxl57d9xz"))

(define rust-wasi-0.11.0+wasi-snapshot-preview1
  (crate-source "wasi" "0.11.0+wasi-snapshot-preview1"
                "08z4hxwkpdpalxjps1ai9y7ihin26y9f476i53dv98v45gkqg3cw"))

(define rust-wasi-0.14.2+wasi-0.2.4
  (crate-source "wasi" "0.14.2+wasi-0.2.4"
                "1cwcqjr3dgdq8j325awgk8a715h0hg0f7jqzsb077n4qm6jzk0wn"))

(define rust-wasm-bindgen-0.2.100
  (crate-source "wasm-bindgen" "0.2.100"
                "1x8ymcm6yi3i1rwj78myl1agqv2m86i648myy3lc97s9swlqkp0y"))

(define rust-wasm-bindgen-backend-0.2.100
  (crate-source "wasm-bindgen-backend" "0.2.100"
                "1ihbf1hq3y81c4md9lyh6lcwbx6a5j0fw4fygd423g62lm8hc2ig"))

(define rust-wasm-bindgen-futures-0.4.42
  (crate-source "wasm-bindgen-futures" "0.4.42"
                "1h322zjvpjllcpj7dahfxjsv6inkr6y0baw7nkdwivr1c4v19g3n"))

(define rust-wasm-bindgen-macro-0.2.100
  (crate-source "wasm-bindgen-macro" "0.2.100"
                "01xls2dvzh38yj17jgrbiib1d3nyad7k2yw9s0mpklwys333zrkz"))

(define rust-wasm-bindgen-macro-support-0.2.100
  (crate-source "wasm-bindgen-macro-support" "0.2.100"
                "1plm8dh20jg2id0320pbmrlsv6cazfv6b6907z19ys4z1jj7xs4a"))

(define rust-wasm-bindgen-shared-0.2.100
  (crate-source "wasm-bindgen-shared" "0.2.100"
                "0gffxvqgbh9r9xl36gprkfnh3w9gl8wgia6xrin7v11sjcxxf18s"))

(define rust-web-sys-0.3.69
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "web-sys" "0.3.69"
                "1vqkxk935xa8zcnsi4bd88sb267ly2i24xl1yiq26d1n32hskbvp"))

(define rust-web-time-1.1.0
  (crate-source "web-time" "1.1.0"
                "1fx05yqx83dhx628wb70fyy10yjfq1jpl20qfqhdkymi13rq0ras"))

(define rust-webpki-roots-0.26.7
  (crate-source "webpki-roots" "0.26.7"
                "0zpykqqk4jnrx55jc8wcysnprhfdcwh35dsiwhm2fybydgqjyr2x"))

(define rust-webpki-roots-1.0.4
  (crate-source "webpki-roots" "1.0.4"
                "07jp2zgj3hjb60m1nwrasixdwazmzhh9y4bryy66wz6457q8x1xj"))

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

(define rust-winapi-util-0.1.7
  (crate-source "winapi-util" "0.1.7"
                "15v6ajzp8pkki1hrw4kh341dci1sbp2sxpp8adjasisn7jhhchqk"))

(define rust-winapi-x86-64-pc-windows-gnu-0.4.0
  (crate-source "winapi-x86_64-pc-windows-gnu" "0.4.0"
                "0gqq64czqb64kskjryj8isp62m2sgvx25yyj3kpc2myh85w24bki"))

(define rust-windows-0.58.0
  (crate-source "windows" "0.58.0"
                "1dkjj94b0gn91nn1n22cvm4afsj98f5qrhcl3112v6f4jcfx816x"))

(define rust-windows-0.61.3
  (crate-source "windows" "0.61.3"
                "14v8dln7i4ccskd8danzri22bkjkbmgzh284j3vaxhd4cykx7awv"))

(define rust-windows-0.62.2
  (crate-source "windows" "0.62.2"
                "10457l9ihrbw8j79z2v4plyjxkf6xvb5npd0lqwmkh702gpaszsj"))

(define rust-windows-collections-0.2.0
  (crate-source "windows-collections" "0.2.0"
                "1s65anr609qvsjga7w971p6iq964h87670dkfqfypnfgwnswxviv"))

(define rust-windows-collections-0.3.2
  (crate-source "windows-collections" "0.3.2"
                "0436rjbkqn3j9m2v2lcmwwk0l3n2r57yvqb7fcy4m8d8y5ddkci3"))

(define rust-windows-core-0.52.0
  (crate-source "windows-core" "0.52.0"
                "1nc3qv7sy24x0nlnb32f7alzpd6f72l4p24vl65vydbyil669ark"))

(define rust-windows-core-0.58.0
  (crate-source "windows-core" "0.58.0"
                "16czypy425jzmiys4yb3pwsh7cm6grxn9kjp889iqnf2r17d99kb"))

(define rust-windows-core-0.61.2
  (crate-source "windows-core" "0.61.2"
                "1qsa3iw14wk4ngfl7ipcvdf9xyq456ms7cx2i9iwf406p7fx7zf0"))

(define rust-windows-core-0.62.2
  (crate-source "windows-core" "0.62.2"
                "1swxpv1a8qvn3bkxv8cn663238h2jccq35ff3nsj61jdsca3ms5q"))

(define rust-windows-future-0.2.1
  (crate-source "windows-future" "0.2.1"
                "13mdzcdn51ckpzp3frb8glnmkyjr1c30ym9wnzj9zc97hkll2spw"))

(define rust-windows-future-0.3.2
  (crate-source "windows-future" "0.3.2"
                "1jq5qs2dwzf6rl60f8gr49z2mifxsrdh4y4yfdws467ya41gkmp1"))

(define rust-windows-implement-0.58.0
  (crate-source "windows-implement" "0.58.0"
                "16spr5z65z21qyv379rv2mb1s5q2i9ibd1p2pkn0dr9qr535pg9b"))

(define rust-windows-implement-0.60.2
  (crate-source "windows-implement" "0.60.2"
                "1psxhmklzcf3wjs4b8qb42qb6znvc142cb5pa74rsyxm1822wgh5"))

(define rust-windows-interface-0.58.0
  (crate-source "windows-interface" "0.58.0"
                "059mxmfvx3x88q74ms0qlxmj2pnidmr5mzn60hakn7f95m34qg05"))

(define rust-windows-interface-0.59.3
  (crate-source "windows-interface" "0.59.3"
                "0n73cwrn4247d0axrk7gjp08p34x1723483jxjxjdfkh4m56qc9z"))

(define rust-windows-link-0.1.3
  (crate-source "windows-link" "0.1.3"
                "12kr1p46dbhpijr4zbwr2spfgq8i8c5x55mvvfmyl96m01cx4sjy"))

(define rust-windows-link-0.2.1
  (crate-source "windows-link" "0.2.1"
                "1rag186yfr3xx7piv5rg8b6im2dwcf8zldiflvb22xbzwli5507h"))

(define rust-windows-numerics-0.2.0
  (crate-source "windows-numerics" "0.2.0"
                "1cf2j8nbqf0hqqa7chnyid91wxsl2m131kn0vl3mqk3c0rlayl4i"))

(define rust-windows-numerics-0.3.1
  (crate-source "windows-numerics" "0.3.1"
                "09hgbg8pf89r4090yyhh9q29ppi7yyxkgmga9ascshy19a240bkf"))

(define rust-windows-result-0.2.0
  (crate-source "windows-result" "0.2.0"
                "03mf2z1xcy2slhhsm15z24p76qxgm2m74xdjp8bihyag47c4640x"))

(define rust-windows-result-0.3.4
  (crate-source "windows-result" "0.3.4"
                "1il60l6idrc6hqsij0cal0mgva6n3w6gq4ziban8wv6c6b9jpx2n"))

(define rust-windows-result-0.4.1
  (crate-source "windows-result" "0.4.1"
                "1d9yhmrmmfqh56zlj751s5wfm9a2aa7az9rd7nn5027nxa4zm0bp"))

(define rust-windows-service-0.6.0
  (crate-source "windows-service" "0.6.0"
                "1j0kml9wlkylmcx24hqjh1i2qjwx0332z2j6jlnpc4svrdzb77fd"))

(define rust-windows-strings-0.1.0
  (crate-source "windows-strings" "0.1.0"
                "042dxvi3133f7dyi2pgcvknwkikk47k8bddwxbq5s0l6qhjv3nac"))

(define rust-windows-strings-0.4.2
  (crate-source "windows-strings" "0.4.2"
                "0mrv3plibkla4v5kaakc2rfksdd0b14plcmidhbkcfqc78zwkrjn"))

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

(define rust-windows-sys-0.48.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.48.0"
                "1aan23v5gs7gya1lc46hqn9mdh8yph3fhxmhxlw36pn6pqc28zb7"))

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

(define rust-windows-targets-0.48.5
  (crate-source "windows-targets" "0.48.5"
                "034ljxqshifs1lan89xwpcy1hp0lhdh4b5n0d2z4fwjx2piacbws"))

(define rust-windows-targets-0.52.6
  (crate-source "windows-targets" "0.52.6"
                "0wwrx625nwlfp7k93r2rra568gad1mwd888h1jwnl0vfg5r4ywlv"))

(define rust-windows-targets-0.53.4
  (crate-source "windows-targets" "0.53.4"
                "0jxc6f032xb3bbb7mj9rlhky84w7vz7hkbsh8s2hcakdysvvfhid"))

(define rust-windows-threading-0.1.0
  (crate-source "windows-threading" "0.1.0"
                "19jpn37zpjj2q7pn07dpq0ay300w65qx7wdp13wbp8qf5snn6r5n"))

(define rust-windows-threading-0.2.1
  (crate-source "windows-threading" "0.2.1"
                "0dsvsy33vxs0153z4n39sqkzx382cjjkrd46rb3z3zfak5dvsj9r"))

(define rust-windows-aarch64-gnullvm-0.42.2
  (crate-source "windows_aarch64_gnullvm" "0.42.2"
                "1y4q0qmvl0lvp7syxvfykafvmwal5hrjb4fmv04bqs0bawc52yjr"))

(define rust-windows-aarch64-gnullvm-0.48.5
  (crate-source "windows_aarch64_gnullvm" "0.48.5"
                "1n05v7qblg1ci3i567inc7xrkmywczxrs1z3lj3rkkxw18py6f1b"))

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

(define rust-windows-aarch64-msvc-0.48.5
  (crate-source "windows_aarch64_msvc" "0.48.5"
                "1g5l4ry968p73g6bg6jgyvy9lb8fyhcs54067yzxpcpkf44k2dfw"))

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

(define rust-windows-i686-gnu-0.48.5
  (crate-source "windows_i686_gnu" "0.48.5"
                "0gklnglwd9ilqx7ac3cn8hbhkraqisd0n83jxzf9837nvvkiand7"))

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

(define rust-windows-i686-msvc-0.48.5
  (crate-source "windows_i686_msvc" "0.48.5"
                "01m4rik437dl9rdf0ndnm2syh10hizvq0dajdkv2fjqcywrw4mcg"))

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

(define rust-windows-x86-64-gnu-0.48.5
  (crate-source "windows_x86_64_gnu" "0.48.5"
                "13kiqqcvz2vnyxzydjh73hwgigsdr2z1xpzx313kxll34nyhmm2k"))

(define rust-windows-x86-64-gnu-0.52.6
  (crate-source "windows_x86_64_gnu" "0.52.6"
                "0y0sifqcb56a56mvn7xjgs8g43p33mfqkd8wj1yhrgxzma05qyhl"))

(define rust-windows-x86-64-gnu-0.53.1
  (crate-source "windows_x86_64_gnu" "0.53.1"
                "16d4yiysmfdlsrghndr97y57gh3kljkwhfdbcs05m1jasz6l4f4w"))

(define rust-windows-x86-64-gnullvm-0.42.2
  (crate-source "windows_x86_64_gnullvm" "0.42.2"
                "18wl9r8qbsl475j39zvawlidp1bsbinliwfymr43fibdld31pm16"))

(define rust-windows-x86-64-gnullvm-0.48.5
  (crate-source "windows_x86_64_gnullvm" "0.48.5"
                "1k24810wfbgz8k48c2yknqjmiigmql6kk3knmddkv8k8g1v54yqb"))

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

(define rust-windows-x86-64-msvc-0.48.5
  (crate-source "windows_x86_64_msvc" "0.48.5"
                "0f4mdp895kkjh9zv8dxvn4pc10xr7839lf5pa9l0193i2pkgr57d"))

(define rust-windows-x86-64-msvc-0.52.6
  (crate-source "windows_x86_64_msvc" "0.52.6"
                "1v7rb5cibyzx8vak29pdrk8nx9hycsjs4w0jgms08qk49jl6v7sq"))

(define rust-windows-x86-64-msvc-0.53.1
  (crate-source "windows_x86_64_msvc" "0.53.1"
                "0l6npq76vlq4ksn4bwsncpr8508mk0gmznm6wnhjg95d19gzzfyn"))

(define rust-winnow-0.6.20
  (crate-source "winnow" "0.6.20"
                "16y4i8z9vh8hazjxg5mvmq0c5i35wlk8rxi5gkq6cn5vlb0zxh9n"))

(define rust-winreg-0.50.0
  (crate-source "winreg" "0.50.0"
                "1cddmp929k882mdh6i9f2as848f13qqna6czwsqzkh1pqnr5fkjj"))

(define rust-winreg-0.55.0
  (crate-source "winreg" "0.55.0"
                "15xy060vylrsp91bc0ximx3xziwipzlrn1n2ab19w3n56x9pcnnb"))

(define rust-winres-0.1.12
  (crate-source "winres" "0.1.12"
                "0v2gvqnd8iwwvb6fs69nv0mmk1z96430527n0qlfbsarxxhv53dn"))

(define rust-wintun-bindings-0.7.34
  (crate-source "wintun-bindings" "0.7.34"
                "0qa4f3bcbwkm0gnhd757v8krlciqcpix4a4ihi71fsc59g9h9bi7"))

(define rust-wit-bindgen-rt-0.39.0
  (crate-source "wit-bindgen-rt" "0.39.0"
                "1hd65pa5hp0nl664m94bg554h4zlhrzmkjsf6lsgsb7yc4734hkg"))

(define rust-wmi-0.14.0
  (crate-source "wmi" "0.14.0"
                "01f046zah4zirx256d45h6gga50fd65m656qgdhvl9pfpl3abpgv"))

(define rust-write16-1.0.0
  (crate-source "write16" "1.0.0"
                "0dnryvrrbrnl7vvf5vb1zkmwldhjkf2n5znliviam7bm4900z2fi"))

(define rust-writeable-0.5.5
  (crate-source "writeable" "0.5.5"
                "0lawr6y0bwqfyayf3z8zmqlhpnzhdx0ahs54isacbhyjwa7g778y"))

(define rust-x25519-dalek-2.0.1
  (crate-source "x25519-dalek" "2.0.1"
                "0xyjgqpsa0q6pprakdp58q1hy45rf8wnqqscgzx0gyw13hr6ir67"))

(define rust-yoke-0.7.4
  (crate-source "yoke" "0.7.4"
                "198c4jkh6i3hxijia7mfa4cpnxg1iqym9bz364697c3rn0a16nvc"))

(define rust-yoke-derive-0.7.4
  (crate-source "yoke-derive" "0.7.4"
                "15cvhkci2mchfffx3fmva84fpmp34dsmnbzibwfnzjqq3ds33k18"))

(define rust-zerocopy-0.8.27
  (crate-source "zerocopy" "0.8.27"
                "0b1870gf2zzlckca69v2k4mqwmf8yh2li37qldnzvvd3by58g508"))

(define rust-zerocopy-derive-0.8.27
  (crate-source "zerocopy-derive" "0.8.27"
                "0c9qrylm2p55dvaplxsl24ma48add9qk4y0d6kjbkllaqvcvill8"))

(define rust-zerofrom-0.1.4
  (crate-source "zerofrom" "0.1.4"
                "0mdbjd7vmbix2ynxbrbrrli47a5yrpfx05hi99wf1l4pwwf13v4i"))

(define rust-zerofrom-derive-0.1.4
  (crate-source "zerofrom-derive" "0.1.4"
                "19b31rrs2ry1lrq5mpdqjzgg65va51fgvwghxnf6da3ycfiv99qf"))

(define rust-zeroize-1.8.2
  (crate-source "zeroize" "1.8.2"
                "1l48zxgcv34d7kjskr610zqsm6j2b4fcr2vfh9jm9j1jgvk58wdr"))

(define rust-zeroize-derive-1.4.2
  (crate-source "zeroize_derive" "1.4.2"
                "0sczjlqjdmrp3wn62g7mw6p438c9j4jgp2f9zamd56991mdycdnf"))

(define rust-zerovec-0.10.4
  (crate-source "zerovec" "0.10.4"
                "0yghix7n3fjfdppwghknzvx9v8cf826h2qal5nqvy8yzg4yqjaxa"))

(define rust-zerovec-derive-0.10.3
  (crate-source "zerovec-derive" "0.10.3"
                "1ik322dys6wnap5d3gcsn09azmssq466xryn5czfm13mn7gsdbvf"))


(define mullvad-crate-inputs
  (list
   (list "rust-addr2line-0.25.1" rust-addr2line-0.25.1)
   (list "rust-adler2-2.0.0" rust-adler2-2.0.0)
   (list "rust-aead-0.5.2" rust-aead-0.5.2)
   (list "rust-aes-0.8.4" rust-aes-0.8.4)
   (list "rust-aes-gcm-0.10.3" rust-aes-gcm-0.10.3)
   (list "rust-aho-corasick-1.1.3" rust-aho-corasick-1.1.3)
   (list "rust-android-tzdata-0.1.1" rust-android-tzdata-0.1.1)
   (list "rust-android-system-properties-0.1.5" rust-android-system-properties-0.1.5)
   (list "rust-anes-0.1.6" rust-anes-0.1.6)
   (list "rust-anstream-0.6.13" rust-anstream-0.6.13)
   (list "rust-anstyle-1.0.6" rust-anstyle-1.0.6)
   (list "rust-anstyle-parse-0.2.3" rust-anstyle-parse-0.2.3)
   (list "rust-anstyle-query-1.0.2" rust-anstyle-query-1.0.2)
   (list "rust-anstyle-wincon-3.0.2" rust-anstyle-wincon-3.0.2)
   (list "rust-anyhow-1.0.82" rust-anyhow-1.0.82)
   (list "rust-arc-swap-1.7.1" rust-arc-swap-1.7.1)
   (list "rust-arrayref-0.3.7" rust-arrayref-0.3.7)
   (list "rust-arrayvec-0.7.6" rust-arrayvec-0.7.6)
   (list "rust-assert-json-diff-2.0.2" rust-assert-json-diff-2.0.2)
   (list "rust-async-channel-2.3.1" rust-async-channel-2.3.1)
   (list "rust-async-task-4.7.1" rust-async-task-4.7.1)
   (list "rust-async-tempfile-0.6.0" rust-async-tempfile-0.6.0)
   (list "rust-async-trait-0.1.88" rust-async-trait-0.1.88)
   (list "rust-atomic-waker-1.1.2" rust-atomic-waker-1.1.2)
   (list "rust-autocfg-1.2.0" rust-autocfg-1.2.0)
   (list "rust-axum-0.8.4" rust-axum-0.8.4)
   (list "rust-axum-core-0.5.2" rust-axum-core-0.5.2)
   (list "rust-backtrace-0.3.76" rust-backtrace-0.3.76)
   (list "rust-base64-0.13.1" rust-base64-0.13.1)
   (list "rust-base64-0.22.1" rust-base64-0.22.1)
   (list "rust-base64ct-1.6.0" rust-base64ct-1.6.0)
   (list "rust-bincode-1.3.3" rust-bincode-1.3.3)
   (list "rust-bit-set-0.8.0" rust-bit-set-0.8.0)
   (list "rust-bit-vec-0.8.0" rust-bit-vec-0.8.0)
   (list "rust-bitfield-struct-0.11.0" rust-bitfield-struct-0.11.0)
   (list "rust-bitflags-1.3.2" rust-bitflags-1.3.2)
   (list "rust-bitflags-2.9.0" rust-bitflags-2.9.0)
   (list "rust-blake2-0.10.6" rust-blake2-0.10.6)
   (list "rust-blake3-1.5.1" rust-blake3-1.5.1)
   (list "rust-block-0.1.6" rust-block-0.1.6)
   (list "rust-block-buffer-0.10.4" rust-block-buffer-0.10.4)
   (list "rust-block2-0.5.1" rust-block2-0.5.1)
   (list "rust-block2-0.6.1" rust-block2-0.6.1)
   (list "rust-blocking-1.6.2" rust-blocking-1.6.2)
   (list "rust-bumpalo-3.16.0" rust-bumpalo-3.16.0)
   (list "rust-byte-string-1.0.0" rust-byte-string-1.0.0)
   (list "rust-byteorder-1.5.0" rust-byteorder-1.5.0)
   (list "rust-byteorder-slice-3.0.0" rust-byteorder-slice-3.0.0)
   (list "rust-bytes-1.11.1" rust-bytes-1.11.1)
   (list "rust-c2rust-bitfields-0.21.0" rust-c2rust-bitfields-0.21.0)
   (list "rust-c2rust-bitfields-derive-0.21.0" rust-c2rust-bitfields-derive-0.21.0)
   (list "rust-cacao-0.3.2" rust-cacao-0.3.2)
   (list "rust-camellia-0.1.0" rust-camellia-0.1.0)
   (list "rust-cast-0.3.0" rust-cast-0.3.0)
   (list "rust-cbindgen-0.28.0" rust-cbindgen-0.28.0)
   (list "rust-cc-1.2.16" rust-cc-1.2.16)
   (list "rust-cesu8-1.1.0" rust-cesu8-1.1.0)
   (list "rust-cfg-if-1.0.4" rust-cfg-if-1.0.4)
   (list "rust-cfg-aliases-0.1.1" rust-cfg-aliases-0.1.1)
   (list "rust-cfg-aliases-0.2.1" rust-cfg-aliases-0.2.1)
   (list "rust-chacha20-0.9.1" rust-chacha20-0.9.1)
   (list "rust-chacha20poly1305-0.10.1" rust-chacha20poly1305-0.10.1)
   (list "rust-chrono-0.4.39" rust-chrono-0.4.39)
   (list "rust-ciborium-0.2.2" rust-ciborium-0.2.2)
   (list "rust-ciborium-io-0.2.2" rust-ciborium-io-0.2.2)
   (list "rust-ciborium-ll-0.2.2" rust-ciborium-ll-0.2.2)
   (list "rust-cipher-0.4.4" rust-cipher-0.4.4)
   (list "rust-clap-4.5.4" rust-clap-4.5.4)
   (list "rust-clap-builder-4.5.2" rust-clap-builder-4.5.2)
   (list "rust-clap-complete-4.5.2" rust-clap-complete-4.5.2)
   (list "rust-clap-derive-4.5.4" rust-clap-derive-4.5.4)
   (list "rust-clap-lex-0.7.0" rust-clap-lex-0.7.0)
   (list "rust-colorchoice-1.0.0" rust-colorchoice-1.0.0)
   (list "rust-colored-2.2.0" rust-colored-2.2.0)
   (list "rust-combine-4.6.7" rust-combine-4.6.7)
   (list "rust-concurrent-queue-2.5.0" rust-concurrent-queue-2.5.0)
   (list "rust-console-0.15.11" rust-console-0.15.11)
   (list "rust-const-oid-0.9.6" rust-const-oid-0.9.6)
   (list "rust-constant-time-eq-0.3.0" rust-constant-time-eq-0.3.0)
   (list "rust-constant-time-eq-0.4.2" rust-constant-time-eq-0.4.2)
   (list "rust-core-foundation-0.9.4" rust-core-foundation-0.9.4)
   (list "rust-core-foundation-sys-0.8.6" rust-core-foundation-sys-0.8.6)
   (list "rust-core-graphics-0.22.3" rust-core-graphics-0.22.3)
   (list "rust-core-graphics-types-0.1.3" rust-core-graphics-types-0.1.3)
   (list "rust-cpufeatures-0.2.12" rust-cpufeatures-0.2.12)
   (list "rust-crc32fast-1.4.0" rust-crc32fast-1.4.0)
   (list "rust-criterion-0.7.0" rust-criterion-0.7.0)
   (list "rust-criterion-plot-0.6.0" rust-criterion-plot-0.6.0)
   (list "rust-critical-section-1.2.0" rust-critical-section-1.2.0)
   (list "rust-crossbeam-channel-0.5.15" rust-crossbeam-channel-0.5.15)
   (list "rust-crossbeam-deque-0.8.6" rust-crossbeam-deque-0.8.6)
   (list "rust-crossbeam-epoch-0.9.18" rust-crossbeam-epoch-0.9.18)
   (list "rust-crossbeam-utils-0.8.19" rust-crossbeam-utils-0.8.19)
   (list "rust-crunchy-0.2.4" rust-crunchy-0.2.4)
   (list "rust-crypto-common-0.1.6" rust-crypto-common-0.1.6)
   (list "rust-csv-1.3.1" rust-csv-1.3.1)
   (list "rust-csv-core-0.1.12" rust-csv-core-0.1.12)
   (list "rust-ctr-0.9.2" rust-ctr-0.9.2)
   (list "rust-ctrlc-3.4.4" rust-ctrlc-3.4.4)
   (list "rust-curve25519-dalek-4.1.3" rust-curve25519-dalek-4.1.3)
   (list "rust-curve25519-dalek-derive-0.1.1" rust-curve25519-dalek-derive-0.1.1)
   (list "rust-darling-0.20.10" rust-darling-0.20.10)
   (list "rust-darling-core-0.20.10" rust-darling-core-0.20.10)
   (list "rust-darling-macro-0.20.10" rust-darling-macro-0.20.10)
   (list "rust-data-encoding-2.5.0" rust-data-encoding-2.5.0)
   (list "rust-dbus-0.9.7" rust-dbus-0.9.7)
   (list "rust-der-0.7.9" rust-der-0.7.9)
   (list "rust-deranged-0.5.5" rust-deranged-0.5.5)
   (list "rust-derive-into-owned-0.2.0" rust-derive-into-owned-0.2.0)
   (list "rust-derive-builder-0.20.0" rust-derive-builder-0.20.0)
   (list "rust-derive-builder-core-0.20.0" rust-derive-builder-core-0.20.0)
   (list "rust-derive-builder-macro-0.20.0" rust-derive-builder-macro-0.20.0)
   (list "rust-digest-0.10.7" rust-digest-0.10.7)
   (list "rust-dirs-6.0.0" rust-dirs-6.0.0)
   (list "rust-dirs-sys-0.5.0" rust-dirs-sys-0.5.0)
   (list "rust-dispatch-0.2.0" rust-dispatch-0.2.0)
   (list "rust-dispatch2-0.3.0" rust-dispatch2-0.3.0)
   (list "rust-displaydoc-0.2.5" rust-displaydoc-0.2.5)
   (list "rust-dunce-1.0.5" rust-dunce-1.0.5)
   (list "rust-duplicate-2.0.0" rust-duplicate-2.0.0)
   (list "rust-dynosaur-0.2.0" rust-dynosaur-0.2.0)
   (list "rust-dynosaur-derive-0.2.0" rust-dynosaur-derive-0.2.0)
   (list "rust-ed25519-2.2.3" rust-ed25519-2.2.3)
   (list "rust-ed25519-dalek-2.1.1" rust-ed25519-dalek-2.1.1)
   (list "rust-either-1.15.0" rust-either-1.15.0)
   (list "rust-encode-unicode-1.0.0" rust-encode-unicode-1.0.0)
   (list "rust-enum-as-inner-0.6.0" rust-enum-as-inner-0.6.0)
   (list "rust-enum-map-2.7.3" rust-enum-map-2.7.3)
   (list "rust-enum-map-derive-0.17.0" rust-enum-map-derive-0.17.0)
   (list "rust-env-filter-0.1.3" rust-env-filter-0.1.3)
   (list "rust-env-logger-0.11.7" rust-env-logger-0.11.7)
   (list "rust-equivalent-1.0.1" rust-equivalent-1.0.1)
   (list "rust-err-context-0.1.0" rust-err-context-0.1.0)
   (list "rust-errno-0.2.8" rust-errno-0.2.8)
   (list "rust-errno-0.3.8" rust-errno-0.3.8)
   (list "rust-errno-dragonfly-0.1.2" rust-errno-dragonfly-0.1.2)
   (list "rust-event-listener-5.4.0" rust-event-listener-5.4.0)
   (list "rust-event-listener-strategy-0.5.3" rust-event-listener-strategy-0.5.3)
   (list "rust-eyre-0.6.12" rust-eyre-0.6.12)
   (list "rust-fastrand-2.0.2" rust-fastrand-2.0.2)
   (list "rust-fiat-crypto-0.2.8" rust-fiat-crypto-0.2.8)
   (list "rust-filetime-0.2.23" rust-filetime-0.2.23)
   (list "rust-fixedbitset-0.4.2" rust-fixedbitset-0.4.2)
   (list "rust-flate2-1.1.2" rust-flate2-1.1.2)
   (list "rust-fnv-1.0.7" rust-fnv-1.0.7)
   (list "rust-foreign-types-0.3.2" rust-foreign-types-0.3.2)
   (list "rust-foreign-types-shared-0.1.1" rust-foreign-types-shared-0.1.1)
   (list "rust-form-urlencoded-1.2.1" rust-form-urlencoded-1.2.1)
   (list "rust-fsevent-sys-4.1.0" rust-fsevent-sys-4.1.0)
   (list "rust-futures-0.3.31" rust-futures-0.3.31)
   (list "rust-futures-channel-0.3.31" rust-futures-channel-0.3.31)
   (list "rust-futures-core-0.3.31" rust-futures-core-0.3.31)
   (list "rust-futures-executor-0.3.31" rust-futures-executor-0.3.31)
   (list "rust-futures-io-0.3.31" rust-futures-io-0.3.31)
   (list "rust-futures-lite-2.6.0" rust-futures-lite-2.6.0)
   (list "rust-futures-macro-0.3.31" rust-futures-macro-0.3.31)
   (list "rust-futures-sink-0.3.31" rust-futures-sink-0.3.31)
   (list "rust-futures-task-0.3.31" rust-futures-task-0.3.31)
   (list "rust-futures-util-0.3.31" rust-futures-util-0.3.31)
   (list "rust-generator-0.8.7" rust-generator-0.8.7)
   (list "rust-generic-array-0.14.7" rust-generic-array-0.14.7)
   (list "rust-getrandom-0.2.14" rust-getrandom-0.2.14)
   (list "rust-getrandom-0.3.2" rust-getrandom-0.3.2)
   (list "rust-ghash-0.5.1" rust-ghash-0.5.1)
   (list "rust-gimli-0.32.3" rust-gimli-0.32.3)
   (list "rust-glob-0.3.2" rust-glob-0.3.2)
   (list "rust-gotatun-0.2.0" rust-gotatun-0.2.0)
   (list "rust-h2-0.4.4" rust-h2-0.4.4)
   (list "rust-h3-0.0.7" rust-h3-0.0.7)
   (list "rust-h3-datagram-0.0.1" rust-h3-datagram-0.0.1)
   (list "rust-h3-quinn-0.0.9" rust-h3-quinn-0.0.9)
   (list "rust-half-2.6.0" rust-half-2.6.0)
   (list "rust-hashbrown-0.14.3" rust-hashbrown-0.14.3)
   (list "rust-heck-0.4.1" rust-heck-0.4.1)
   (list "rust-heck-0.5.0" rust-heck-0.5.0)
   (list "rust-hermit-abi-0.3.9" rust-hermit-abi-0.3.9)
   (list "rust-hex-0.4.3" rust-hex-0.4.3)
   (list "rust-hickory-proto-0.25.2" rust-hickory-proto-0.25.2)
   (list "rust-hickory-resolver-0.25.2" rust-hickory-resolver-0.25.2)
   (list "rust-hickory-server-0.25.2" rust-hickory-server-0.25.2)
   (list "rust-hkdf-0.12.4" rust-hkdf-0.12.4)
   (list "rust-hmac-0.12.1" rust-hmac-0.12.1)
   (list "rust-home-0.5.9" rust-home-0.5.9)
   (list "rust-hostname-0.3.1" rust-hostname-0.3.1)
   (list "rust-htmlize-1.0.6" rust-htmlize-1.0.6)
   (list "rust-http-1.1.0" rust-http-1.1.0)
   (list "rust-http-body-1.0.0" rust-http-body-1.0.0)
   (list "rust-http-body-util-0.1.2" rust-http-body-util-0.1.2)
   (list "rust-httparse-1.9.4" rust-httparse-1.9.4)
   (list "rust-httpdate-1.0.3" rust-httpdate-1.0.3)
   (list "rust-hybrid-array-0.2.0-rc.11" rust-hybrid-array-0.2.0-rc.11)
   (list "rust-hyper-1.8.1" rust-hyper-1.8.1)
   (list "rust-hyper-rustls-0.27.5" rust-hyper-rustls-0.27.5)
   (list "rust-hyper-timeout-0.5.1" rust-hyper-timeout-0.5.1)
   (list "rust-hyper-util-0.1.16" rust-hyper-util-0.1.16)
   (list "rust-iana-time-zone-0.1.60" rust-iana-time-zone-0.1.60)
   (list "rust-iana-time-zone-haiku-0.1.2" rust-iana-time-zone-haiku-0.1.2)
   (list "rust-icu-collections-1.5.0" rust-icu-collections-1.5.0)
   (list "rust-icu-locid-1.5.0" rust-icu-locid-1.5.0)
   (list "rust-icu-locid-transform-1.5.0" rust-icu-locid-transform-1.5.0)
   (list "rust-icu-locid-transform-data-1.5.0" rust-icu-locid-transform-data-1.5.0)
   (list "rust-icu-normalizer-1.5.0" rust-icu-normalizer-1.5.0)
   (list "rust-icu-normalizer-data-1.5.0" rust-icu-normalizer-data-1.5.0)
   (list "rust-icu-properties-1.5.1" rust-icu-properties-1.5.1)
   (list "rust-icu-properties-data-1.5.0" rust-icu-properties-data-1.5.0)
   (list "rust-icu-provider-1.5.0" rust-icu-provider-1.5.0)
   (list "rust-icu-provider-macros-1.5.0" rust-icu-provider-macros-1.5.0)
   (list "rust-ident-case-1.0.1" rust-ident-case-1.0.1)
   (list "rust-idna-1.0.3" rust-idna-1.0.3)
   (list "rust-idna-adapter-1.2.0" rust-idna-adapter-1.2.0)
   (list "rust-indenter-0.3.3" rust-indenter-0.3.3)
   (list "rust-indexmap-2.2.6" rust-indexmap-2.2.6)
   (list "rust-inotify-0.10.2" rust-inotify-0.10.2)
   (list "rust-inotify-0.11.0" rust-inotify-0.11.0)
   (list "rust-inotify-sys-0.1.5" rust-inotify-sys-0.1.5)
   (list "rust-inout-0.1.3" rust-inout-0.1.3)
   (list "rust-insta-1.42.1" rust-insta-1.42.1)
   (list "rust-internet-checksum-0.2.1" rust-internet-checksum-0.2.1)
   (list "rust-ioctl-sys-0.6.0" rust-ioctl-sys-0.6.0)
   (list "rust-ioctl-sys-0.8.0" rust-ioctl-sys-0.8.0)
   (list "rust-ip-network-0.4.1" rust-ip-network-0.4.1)
   (list "rust-ip-network-table-0.2.0" rust-ip-network-table-0.2.0)
   (list "rust-ip-network-table-deps-treebitmap-0.5.0" rust-ip-network-table-deps-treebitmap-0.5.0)
   (list "rust-ipconfig-0.3.2" rust-ipconfig-0.3.2)
   (list "rust-ipnet-2.9.0" rust-ipnet-2.9.0)
   (list "rust-ipnetwork-0.21.1" rust-ipnetwork-0.21.1)
   (list "rust-iri-string-0.7.8" rust-iri-string-0.7.8)
   (list "rust-itertools-0.13.0" rust-itertools-0.13.0)
   (list "rust-itertools-0.14.0" rust-itertools-0.14.0)
   (list "rust-itoa-1.0.11" rust-itoa-1.0.11)
   (list "rust-jni-0.19.0" rust-jni-0.19.0)
   (list "rust-jni-sys-0.3.0" rust-jni-sys-0.3.0)
   (list "rust-jnix-0.5.3" rust-jnix-0.5.3)
   (list "rust-jnix-macros-0.4.1" rust-jnix-macros-0.4.1)
   (list "rust-jobserver-0.1.32" rust-jobserver-0.1.32)
   (list "rust-js-sys-0.3.77" rust-js-sys-0.3.77)
   (list "rust-json-canon-0.1.3" rust-json-canon-0.1.3)
   (list "rust-keccak-0.1.5" rust-keccak-0.1.5)
   (list "rust-kem-0.3.0-pre.0" rust-kem-0.3.0-pre.0)
   (list "rust-kqueue-1.0.8" rust-kqueue-1.0.8)
   (list "rust-kqueue-sys-1.0.4" rust-kqueue-sys-1.0.4)
   (list "rust-lazy-static-1.4.0" rust-lazy-static-1.4.0)
   (list "rust-libc-0.2.172" rust-libc-0.2.172)
   (list "rust-libdbus-sys-0.2.5" rust-libdbus-sys-0.2.5)
   (list "rust-libloading-0.8.3" rust-libloading-0.8.3)
   (list "rust-libloading-0.9.0" rust-libloading-0.9.0)
   (list "rust-libm-0.2.8" rust-libm-0.2.8)
   (list "rust-libredox-0.1.3" rust-libredox-0.1.3)
   (list "rust-linked-hash-map-0.5.6" rust-linked-hash-map-0.5.6)
   (list "rust-linux-raw-sys-0.4.13" rust-linux-raw-sys-0.4.13)
   (list "rust-litemap-0.7.3" rust-litemap-0.7.3)
   (list "rust-lock-api-0.4.11" rust-lock-api-0.4.11)
   (list "rust-log-0.4.29" rust-log-0.4.29)
   (list "rust-log-panics-2.1.0" rust-log-panics-2.1.0)
   (list "rust-loom-0.7.2" rust-loom-0.7.2)
   (list "rust-lru-slab-0.1.2" rust-lru-slab-0.1.2)
   (list "rust-malloc-buf-0.0.6" rust-malloc-buf-0.0.6)
   (list "rust-match-cfg-0.1.0" rust-match-cfg-0.1.0)
   (list "rust-matchers-0.2.0" rust-matchers-0.2.0)
   (list "rust-matchit-0.8.4" rust-matchit-0.8.4)
   (list "rust-maybenot-2.2.2" rust-maybenot-2.2.2)
   (list "rust-maybenot-ffi-2.2.2" rust-maybenot-ffi-2.2.2)
   (list "rust-md-5-0.10.6" rust-md-5-0.10.6)
   (list "rust-memchr-2.7.2" rust-memchr-2.7.2)
   (list "rust-memoffset-0.6.5" rust-memoffset-0.6.5)
   (list "rust-memoffset-0.9.1" rust-memoffset-0.9.1)
   (list "rust-mime-0.3.17" rust-mime-0.3.17)
   (list "rust-miniz-oxide-0.8.9" rust-miniz-oxide-0.8.9)
   (list "rust-mio-1.0.2" rust-mio-1.0.2)
   (list "rust-ml-kem-0.2.1" rust-ml-kem-0.2.1)
   (list "rust-mnl-0.3.0" rust-mnl-0.3.0)
   (list "rust-mnl-sys-0.2.2" rust-mnl-sys-0.2.2)
   (list "rust-mockito-1.6.1" rust-mockito-1.6.1)
   (list "rust-moka-0.12.10" rust-moka-0.12.10)
   (list "rust-multimap-0.10.0" rust-multimap-0.10.0)
   (list "rust-native-windows-gui-1.0.13" rust-native-windows-gui-1.0.13)
   (list "rust-natord-1.0.9" rust-natord-1.0.9)
   (list "rust-ndk-sys-0.5.0+25.2.9519653" rust-ndk-sys-0.5.0+25.2.9519653)
   (list "rust-neon-1.0.0" rust-neon-1.0.0)
   (list "rust-neon-macros-1.0.0" rust-neon-macros-1.0.0)
   (list "rust-netlink-packet-core-0.8.0" rust-netlink-packet-core-0.8.0)
   (list "rust-netlink-packet-route-0.25.1" rust-netlink-packet-route-0.25.1)
   (list "rust-netlink-proto-0.12.0" rust-netlink-proto-0.12.0)
   (list "rust-netlink-sys-0.8.7" rust-netlink-sys-0.8.7)
   (list "rust-nftnl-0.9.1" rust-nftnl-0.9.1)
   (list "rust-nftnl-sys-0.6.4" rust-nftnl-sys-0.6.4)
   (list "rust-nix-0.23.2" rust-nix-0.23.2)
   (list "rust-nix-0.28.0" rust-nix-0.28.0)
   (list "rust-nix-0.29.0" rust-nix-0.29.0)
   (list "rust-nix-0.30.1" rust-nix-0.30.1)
   (list "rust-no-std-net-0.6.0" rust-no-std-net-0.6.0)
   (list "rust-notify-8.0.0" rust-notify-8.0.0)
   (list "rust-notify-types-2.0.0" rust-notify-types-2.0.0)
   (list "rust-nu-ansi-term-0.50.1" rust-nu-ansi-term-0.50.1)
   (list "rust-num-conv-0.2.0" rust-num-conv-0.2.0)
   (list "rust-num-traits-0.2.18" rust-num-traits-0.2.18)
   (list "rust-objc-0.2.7" rust-objc-0.2.7)
   (list "rust-objc-sys-0.3.5" rust-objc-sys-0.3.5)
   (list "rust-objc2-0.5.2" rust-objc2-0.5.2)
   (list "rust-objc2-0.6.2" rust-objc2-0.6.2)
   (list "rust-objc2-app-kit-0.2.2" rust-objc2-app-kit-0.2.2)
   (list "rust-objc2-core-data-0.2.2" rust-objc2-core-data-0.2.2)
   (list "rust-objc2-core-foundation-0.3.1" rust-objc2-core-foundation-0.3.1)
   (list "rust-objc2-core-image-0.2.2" rust-objc2-core-image-0.2.2)
   (list "rust-objc2-encode-4.1.0" rust-objc2-encode-4.1.0)
   (list "rust-objc2-foundation-0.2.2" rust-objc2-foundation-0.2.2)
   (list "rust-objc2-foundation-0.3.1" rust-objc2-foundation-0.3.1)
   (list "rust-objc2-metal-0.2.2" rust-objc2-metal-0.2.2)
   (list "rust-objc2-quartz-core-0.2.2" rust-objc2-quartz-core-0.2.2)
   (list "rust-objc2-security-0.3.1" rust-objc2-security-0.3.1)
   (list "rust-objc2-service-management-0.3.1" rust-objc2-service-management-0.3.1)
   (list "rust-objc-id-0.1.1" rust-objc-id-0.1.1)
   (list "rust-object-0.37.3" rust-object-0.37.3)
   (list "rust-once-cell-1.20.3" rust-once-cell-1.20.3)
   (list "rust-oorandom-11.1.5" rust-oorandom-11.1.5)
   (list "rust-opaque-debug-0.3.1" rust-opaque-debug-0.3.1)
   (list "rust-option-ext-0.2.0" rust-option-ext-0.2.0)
   (list "rust-os-info-3.9.2" rust-os-info-3.9.2)
   (list "rust-paranoid-android-0.2.2" rust-paranoid-android-0.2.2)
   (list "rust-parking-2.2.1" rust-parking-2.2.1)
   (list "rust-parking-lot-0.12.1" rust-parking-lot-0.12.1)
   (list "rust-parking-lot-core-0.9.9" rust-parking-lot-core-0.9.9)
   (list "rust-pastey-0.1.1" rust-pastey-0.1.1)
   (list "rust-pcap-2.1.0" rust-pcap-2.1.0)
   (list "rust-pcap-file-2.0.0" rust-pcap-file-2.0.0)
   (list "rust-percent-encoding-2.3.1" rust-percent-encoding-2.3.1)
   (list "rust-petgraph-0.6.4" rust-petgraph-0.6.4)
   (list "rust-pfctl-0.7.0" rust-pfctl-0.7.0)
   (list "rust-phf-0.11.2" rust-phf-0.11.2)
   (list "rust-phf-codegen-0.11.2" rust-phf-codegen-0.11.2)
   (list "rust-phf-generator-0.11.2" rust-phf-generator-0.11.2)
   (list "rust-phf-shared-0.11.2" rust-phf-shared-0.11.2)
   (list "rust-pin-project-1.1.5" rust-pin-project-1.1.5)
   (list "rust-pin-project-internal-1.1.5" rust-pin-project-internal-1.1.5)
   (list "rust-pin-project-lite-0.2.14" rust-pin-project-lite-0.2.14)
   (list "rust-pin-utils-0.1.0" rust-pin-utils-0.1.0)
   (list "rust-piper-0.2.4" rust-piper-0.2.4)
   (list "rust-pkcs8-0.10.2" rust-pkcs8-0.10.2)
   (list "rust-pkg-config-0.3.30" rust-pkg-config-0.3.30)
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
   (list "rust-poly1305-0.8.0" rust-poly1305-0.8.0)
   (list "rust-polyval-0.6.2" rust-polyval-0.6.2)
   (list "rust-portable-atomic-1.11.0" rust-portable-atomic-1.11.0)
   (list "rust-powerfmt-0.2.0" rust-powerfmt-0.2.0)
   (list "rust-ppv-lite86-0.2.17" rust-ppv-lite86-0.2.17)
   (list "rust-pqcrypto-hqc-0.2.1" rust-pqcrypto-hqc-0.2.1)
   (list "rust-pqcrypto-internals-0.2.10" rust-pqcrypto-internals-0.2.10)
   (list "rust-pqcrypto-traits-0.3.5" rust-pqcrypto-traits-0.3.5)
   (list "rust-prefix-trie-0.7.0" rust-prefix-trie-0.7.0)
   (list "rust-prettyplease-0.2.19" rust-prettyplease-0.2.19)
   (list "rust-proc-macro2-1.0.94" rust-proc-macro2-1.0.94)
   (list "rust-proptest-1.9.0" rust-proptest-1.9.0)
   (list "rust-prost-0.13.3" rust-prost-0.13.3)
   (list "rust-prost-build-0.13.3" rust-prost-build-0.13.3)
   (list "rust-prost-derive-0.13.3" rust-prost-derive-0.13.3)
   (list "rust-prost-types-0.13.3" rust-prost-types-0.13.3)
   (list "rust-quick-error-1.2.3" rust-quick-error-1.2.3)
   (list "rust-quick-xml-0.27.1" rust-quick-xml-0.27.1)
   (list "rust-quinn-0.11.8" rust-quinn-0.11.8)
   (list "rust-quinn-proto-0.11.12" rust-quinn-proto-0.11.12)
   (list "rust-quinn-udp-0.5.12" rust-quinn-udp-0.5.12)
   (list "rust-quote-1.0.39" rust-quote-1.0.39)
   (list "rust-r-efi-5.2.0" rust-r-efi-5.2.0)
   (list "rust-rand-0.8.5" rust-rand-0.8.5)
   (list "rust-rand-0.9.2" rust-rand-0.9.2)
   (list "rust-rand-chacha-0.3.1" rust-rand-chacha-0.3.1)
   (list "rust-rand-chacha-0.9.0" rust-rand-chacha-0.9.0)
   (list "rust-rand-core-0.6.4" rust-rand-core-0.6.4)
   (list "rust-rand-core-0.9.3" rust-rand-core-0.9.3)
   (list "rust-rand-distr-0.5.1" rust-rand-distr-0.5.1)
   (list "rust-rand-xorshift-0.4.0" rust-rand-xorshift-0.4.0)
   (list "rust-rayon-1.11.0" rust-rayon-1.11.0)
   (list "rust-rayon-core-1.13.0" rust-rayon-core-1.13.0)
   (list "rust-redox-syscall-0.4.1" rust-redox-syscall-0.4.1)
   (list "rust-redox-users-0.5.2" rust-redox-users-0.5.2)
   (list "rust-regex-1.10.4" rust-regex-1.10.4)
   (list "rust-regex-automata-0.4.6" rust-regex-automata-0.4.6)
   (list "rust-regex-lite-0.1.6" rust-regex-lite-0.1.6)
   (list "rust-regex-syntax-0.8.3" rust-regex-syntax-0.8.3)
   (list "rust-reqwest-0.12.23" rust-reqwest-0.12.23)
   (list "rust-resolv-conf-0.7.0" rust-resolv-conf-0.7.0)
   (list "rust-ring-0.17.13" rust-ring-0.17.13)
   (list "rust-ring-compat-0.8.0" rust-ring-compat-0.8.0)
   (list "rust-rs-release-0.1.9" rust-rs-release-0.1.9)
   (list "rust-rtnetlink-0.18.1" rust-rtnetlink-0.18.1)
   (list "rust-rustc-demangle-0.1.26" rust-rustc-demangle-0.1.26)
   (list "rust-rustc-hash-2.1.0" rust-rustc-hash-2.1.0)
   (list "rust-rustc-version-0.4.0" rust-rustc-version-0.4.0)
   (list "rust-rustix-0.38.34" rust-rustix-0.38.34)
   (list "rust-rustls-0.23.35" rust-rustls-0.23.35)
   (list "rust-rustls-pki-types-1.13.1" rust-rustls-pki-types-1.13.1)
   (list "rust-rustls-webpki-0.103.8" rust-rustls-webpki-0.103.8)
   (list "rust-rustversion-1.0.15" rust-rustversion-1.0.15)
   (list "rust-rusty-fork-0.3.0" rust-rusty-fork-0.3.0)
   (list "rust-ryu-1.0.17" rust-ryu-1.0.17)
   (list "rust-ryu-js-0.2.2" rust-ryu-js-0.2.2)
   (list "rust-same-file-1.0.6" rust-same-file-1.0.6)
   (list "rust-scoped-tls-1.0.1" rust-scoped-tls-1.0.1)
   (list "rust-scopeguard-1.2.0" rust-scopeguard-1.2.0)
   (list "rust-sealed-0.6.0" rust-sealed-0.6.0)
   (list "rust-semver-1.0.22" rust-semver-1.0.22)
   (list "rust-send-wrapper-0.6.0" rust-send-wrapper-0.6.0)
   (list "rust-sendfd-0.4.3" rust-sendfd-0.4.3)
   (list "rust-serde-1.0.228" rust-serde-1.0.228)
   (list "rust-serde-core-1.0.228" rust-serde-core-1.0.228)
   (list "rust-serde-derive-1.0.228" rust-serde-derive-1.0.228)
   (list "rust-serde-json-1.0.138" rust-serde-json-1.0.138)
   (list "rust-serde-spanned-0.6.8" rust-serde-spanned-0.6.8)
   (list "rust-serde-urlencoded-0.7.1" rust-serde-urlencoded-0.7.1)
   (list "rust-sha1-0.10.6" rust-sha1-0.10.6)
   (list "rust-sha2-0.10.8" rust-sha2-0.10.8)
   (list "rust-sha256-1.5.0" rust-sha256-1.5.0)
   (list "rust-sha3-0.10.8" rust-sha3-0.10.8)
   (list "rust-shadowsocks-1.23.2" rust-shadowsocks-1.23.2)
   (list "rust-shadowsocks-crypto-0.6.2" rust-shadowsocks-crypto-0.6.2)
   (list "rust-sharded-slab-0.1.7" rust-sharded-slab-0.1.7)
   (list "rust-shlex-1.3.0" rust-shlex-1.3.0)
   (list "rust-signal-hook-registry-1.4.2" rust-signal-hook-registry-1.4.2)
   (list "rust-signature-2.2.0" rust-signature-2.2.0)
   (list "rust-similar-2.6.0" rust-similar-2.6.0)
   (list "rust-simple-signal-1.1.1" rust-simple-signal-1.1.1)
   (list "rust-siphasher-0.3.11" rust-siphasher-0.3.11)
   (list "rust-slab-0.4.9" rust-slab-0.4.9)
   (list "rust-smallvec-1.13.2" rust-smallvec-1.13.2)
   (list "rust-socket2-0.5.8" rust-socket2-0.5.8)
   (list "rust-socket2-0.6.0" rust-socket2-0.6.0)
   (list "rust-spin-0.10.0" rust-spin-0.10.0)
   (list "rust-spki-0.7.3" rust-spki-0.7.3)
   (list "rust-stable-deref-trait-1.2.0" rust-stable-deref-trait-1.2.0)
   (list "rust-strsim-0.11.1" rust-strsim-0.11.1)
   (list "rust-strum-0.27.2" rust-strum-0.27.2)
   (list "rust-strum-macros-0.27.2" rust-strum-macros-0.27.2)
   (list "rust-subtle-2.5.0" rust-subtle-2.5.0)
   (list "rust-surge-ping-0.8.1" rust-surge-ping-0.8.1)
   (list "rust-syn-1.0.109" rust-syn-1.0.109)
   (list "rust-syn-2.0.108" rust-syn-2.0.108)
   (list "rust-syn-mid-0.6.0" rust-syn-mid-0.6.0)
   (list "rust-sync-wrapper-1.0.1" rust-sync-wrapper-1.0.1)
   (list "rust-synstructure-0.13.1" rust-synstructure-0.13.1)
   (list "rust-system-configuration-0.5.1" rust-system-configuration-0.5.1)
   (list "rust-system-configuration-sys-0.5.0" rust-system-configuration-sys-0.5.0)
   (list "rust-tagptr-0.2.0" rust-tagptr-0.2.0)
   (list "rust-tempfile-3.10.1" rust-tempfile-3.10.1)
   (list "rust-test-log-0.2.17" rust-test-log-0.2.17)
   (list "rust-test-log-macros-0.2.17" rust-test-log-macros-0.2.17)
   (list "rust-thiserror-1.0.59" rust-thiserror-1.0.59)
   (list "rust-thiserror-2.0.17" rust-thiserror-2.0.17)
   (list "rust-thiserror-impl-1.0.59" rust-thiserror-impl-1.0.59)
   (list "rust-thiserror-impl-2.0.17" rust-thiserror-impl-2.0.17)
   (list "rust-thread-local-1.1.8" rust-thread-local-1.1.8)
   (list "rust-time-0.3.47" rust-time-0.3.47)
   (list "rust-time-core-0.1.8" rust-time-core-0.1.8)
   (list "rust-time-macros-0.2.27" rust-time-macros-0.2.27)
   (list "rust-tinystr-0.7.6" rust-tinystr-0.7.6)
   (list "rust-tinytemplate-1.2.1" rust-tinytemplate-1.2.1)
   (list "rust-tinyvec-1.6.0" rust-tinyvec-1.6.0)
   (list "rust-tinyvec-macros-0.1.1" rust-tinyvec-macros-0.1.1)
   (list "rust-tipsy-0.6.5" rust-tipsy-0.6.5)
   (list "rust-tokio-1.44.2" rust-tokio-1.44.2)
   (list "rust-tokio-macros-2.5.0" rust-tokio-macros-2.5.0)
   (list "rust-tokio-rustls-0.26.0" rust-tokio-rustls-0.26.0)
   (list "rust-tokio-socks-0.5.1" rust-tokio-socks-0.5.1)
   (list "rust-tokio-stream-0.1.16" rust-tokio-stream-0.1.16)
   (list "rust-tokio-tfo-0.3.1" rust-tokio-tfo-0.3.1)
   (list "rust-tokio-util-0.6.10" rust-tokio-util-0.6.10)
   (list "rust-tokio-util-0.7.16" rust-tokio-util-0.7.16)
   (list "rust-toml-0.5.11" rust-toml-0.5.11)
   (list "rust-toml-0.8.19" rust-toml-0.8.19)
   (list "rust-toml-datetime-0.6.8" rust-toml-datetime-0.6.8)
   (list "rust-toml-edit-0.22.20" rust-toml-edit-0.22.20)
   (list "rust-tonic-0.13.1" rust-tonic-0.13.1)
   (list "rust-tonic-build-0.13.1" rust-tonic-build-0.13.1)
   (list "rust-tower-0.5.2" rust-tower-0.5.2)
   (list "rust-tower-http-0.6.6" rust-tower-http-0.6.6)
   (list "rust-tower-layer-0.3.3" rust-tower-layer-0.3.3)
   (list "rust-tower-service-0.3.3" rust-tower-service-0.3.3)
   (list "rust-tracing-0.1.44" rust-tracing-0.1.44)
   (list "rust-tracing-appender-0.2.4" rust-tracing-appender-0.2.4)
   (list "rust-tracing-attributes-0.1.31" rust-tracing-attributes-0.1.31)
   (list "rust-tracing-core-0.1.36" rust-tracing-core-0.1.36)
   (list "rust-tracing-log-0.2.0" rust-tracing-log-0.2.0)
   (list "rust-tracing-subscriber-0.3.22" rust-tracing-subscriber-0.3.22)
   (list "rust-trait-variant-0.1.2" rust-trait-variant-0.1.2)
   (list "rust-triggered-0.1.3" rust-triggered-0.1.3)
   (list "rust-try-lock-0.2.5" rust-try-lock-0.2.5)
   (list "rust-tun-0.5.5" rust-tun-0.5.5)
   (list "rust-tun-0.8.5" rust-tun-0.8.5)
   (list "rust-typed-builder-0.20.1" rust-typed-builder-0.20.1)
   (list "rust-typed-builder-0.21.0" rust-typed-builder-0.21.0)
   (list "rust-typed-builder-macro-0.20.1" rust-typed-builder-macro-0.20.1)
   (list "rust-typed-builder-macro-0.21.0" rust-typed-builder-macro-0.21.0)
   (list "rust-typenum-1.17.0" rust-typenum-1.17.0)
   (list "rust-udp-over-tcp-0.3.0.87936ac" rust-udp-over-tcp-0.3.0.87936ac)
   (list "rust-unarray-0.1.4" rust-unarray-0.1.4)
   (list "rust-unicode-ident-1.0.12" rust-unicode-ident-1.0.12)
   (list "rust-universal-hash-0.5.1" rust-universal-hash-0.5.1)
   (list "rust-untrusted-0.9.0" rust-untrusted-0.9.0)
   (list "rust-url-2.5.4" rust-url-2.5.4)
   (list "rust-utf16-iter-1.0.5" rust-utf16-iter-1.0.5)
   (list "rust-utf8-iter-1.0.4" rust-utf8-iter-1.0.4)
   (list "rust-utf8parse-0.2.1" rust-utf8parse-0.2.1)
   (list "rust-uuid-1.8.0" rust-uuid-1.8.0)
   (list "rust-valuable-0.1.1" rust-valuable-0.1.1)
   (list "rust-vec1-1.12.1" rust-vec1-1.12.1)
   (list "rust-version-check-0.9.4" rust-version-check-0.9.4)
   (list "rust-wait-timeout-0.2.0" rust-wait-timeout-0.2.0)
   (list "rust-walkdir-2.5.0" rust-walkdir-2.5.0)
   (list "rust-want-0.3.1" rust-want-0.3.1)
   (list "rust-wasi-0.11.0+wasi-snapshot-preview1" rust-wasi-0.11.0+wasi-snapshot-preview1)
   (list "rust-wasi-0.14.2+wasi-0.2.4" rust-wasi-0.14.2+wasi-0.2.4)
   (list "rust-wasm-bindgen-0.2.100" rust-wasm-bindgen-0.2.100)
   (list "rust-wasm-bindgen-backend-0.2.100" rust-wasm-bindgen-backend-0.2.100)
   (list "rust-wasm-bindgen-futures-0.4.42" rust-wasm-bindgen-futures-0.4.42)
   (list "rust-wasm-bindgen-macro-0.2.100" rust-wasm-bindgen-macro-0.2.100)
   (list "rust-wasm-bindgen-macro-support-0.2.100" rust-wasm-bindgen-macro-support-0.2.100)
   (list "rust-wasm-bindgen-shared-0.2.100" rust-wasm-bindgen-shared-0.2.100)
   (list "rust-web-sys-0.3.69" rust-web-sys-0.3.69)
   (list "rust-web-time-1.1.0" rust-web-time-1.1.0)
   (list "rust-webpki-roots-0.26.7" rust-webpki-roots-0.26.7)
   (list "rust-webpki-roots-1.0.4" rust-webpki-roots-1.0.4)
   (list "rust-which-4.4.2" rust-which-4.4.2)
   (list "rust-widestring-1.2.1" rust-widestring-1.2.1)
   (list "rust-winapi-0.3.9" rust-winapi-0.3.9)
   (list "rust-winapi-build-0.1.1" rust-winapi-build-0.1.1)
   (list "rust-winapi-i686-pc-windows-gnu-0.4.0" rust-winapi-i686-pc-windows-gnu-0.4.0)
   (list "rust-winapi-util-0.1.7" rust-winapi-util-0.1.7)
   (list "rust-winapi-x86-64-pc-windows-gnu-0.4.0" rust-winapi-x86-64-pc-windows-gnu-0.4.0)
   (list "rust-windows-0.58.0" rust-windows-0.58.0)
   (list "rust-windows-0.61.3" rust-windows-0.61.3)
   (list "rust-windows-0.62.2" rust-windows-0.62.2)
   (list "rust-windows-collections-0.2.0" rust-windows-collections-0.2.0)
   (list "rust-windows-collections-0.3.2" rust-windows-collections-0.3.2)
   (list "rust-windows-core-0.52.0" rust-windows-core-0.52.0)
   (list "rust-windows-core-0.58.0" rust-windows-core-0.58.0)
   (list "rust-windows-core-0.61.2" rust-windows-core-0.61.2)
   (list "rust-windows-core-0.62.2" rust-windows-core-0.62.2)
   (list "rust-windows-future-0.2.1" rust-windows-future-0.2.1)
   (list "rust-windows-future-0.3.2" rust-windows-future-0.3.2)
   (list "rust-windows-implement-0.58.0" rust-windows-implement-0.58.0)
   (list "rust-windows-implement-0.60.2" rust-windows-implement-0.60.2)
   (list "rust-windows-interface-0.58.0" rust-windows-interface-0.58.0)
   (list "rust-windows-interface-0.59.3" rust-windows-interface-0.59.3)
   (list "rust-windows-link-0.1.3" rust-windows-link-0.1.3)
   (list "rust-windows-link-0.2.1" rust-windows-link-0.2.1)
   (list "rust-windows-numerics-0.2.0" rust-windows-numerics-0.2.0)
   (list "rust-windows-numerics-0.3.1" rust-windows-numerics-0.3.1)
   (list "rust-windows-result-0.2.0" rust-windows-result-0.2.0)
   (list "rust-windows-result-0.3.4" rust-windows-result-0.3.4)
   (list "rust-windows-result-0.4.1" rust-windows-result-0.4.1)
   (list "rust-windows-service-0.6.0" rust-windows-service-0.6.0)
   (list "rust-windows-strings-0.1.0" rust-windows-strings-0.1.0)
   (list "rust-windows-strings-0.4.2" rust-windows-strings-0.4.2)
   (list "rust-windows-strings-0.5.1" rust-windows-strings-0.5.1)
   (list "rust-windows-sys-0.36.1" rust-windows-sys-0.36.1)
   (list "rust-windows-sys-0.45.0" rust-windows-sys-0.45.0)
   (list "rust-windows-sys-0.48.0" rust-windows-sys-0.48.0)
   (list "rust-windows-sys-0.52.0" rust-windows-sys-0.52.0)
   (list "rust-windows-sys-0.59.0" rust-windows-sys-0.59.0)
   (list "rust-windows-sys-0.60.2" rust-windows-sys-0.60.2)
   (list "rust-windows-sys-0.61.2" rust-windows-sys-0.61.2)
   (list "rust-windows-targets-0.42.2" rust-windows-targets-0.42.2)
   (list "rust-windows-targets-0.48.5" rust-windows-targets-0.48.5)
   (list "rust-windows-targets-0.52.6" rust-windows-targets-0.52.6)
   (list "rust-windows-targets-0.53.4" rust-windows-targets-0.53.4)
   (list "rust-windows-threading-0.1.0" rust-windows-threading-0.1.0)
   (list "rust-windows-threading-0.2.1" rust-windows-threading-0.2.1)
   (list "rust-windows-aarch64-gnullvm-0.42.2" rust-windows-aarch64-gnullvm-0.42.2)
   (list "rust-windows-aarch64-gnullvm-0.48.5" rust-windows-aarch64-gnullvm-0.48.5)
   (list "rust-windows-aarch64-gnullvm-0.52.6" rust-windows-aarch64-gnullvm-0.52.6)
   (list "rust-windows-aarch64-gnullvm-0.53.1" rust-windows-aarch64-gnullvm-0.53.1)
   (list "rust-windows-aarch64-msvc-0.36.1" rust-windows-aarch64-msvc-0.36.1)
   (list "rust-windows-aarch64-msvc-0.42.2" rust-windows-aarch64-msvc-0.42.2)
   (list "rust-windows-aarch64-msvc-0.48.5" rust-windows-aarch64-msvc-0.48.5)
   (list "rust-windows-aarch64-msvc-0.52.6" rust-windows-aarch64-msvc-0.52.6)
   (list "rust-windows-aarch64-msvc-0.53.1" rust-windows-aarch64-msvc-0.53.1)
   (list "rust-windows-i686-gnu-0.36.1" rust-windows-i686-gnu-0.36.1)
   (list "rust-windows-i686-gnu-0.42.2" rust-windows-i686-gnu-0.42.2)
   (list "rust-windows-i686-gnu-0.48.5" rust-windows-i686-gnu-0.48.5)
   (list "rust-windows-i686-gnu-0.52.6" rust-windows-i686-gnu-0.52.6)
   (list "rust-windows-i686-gnu-0.53.1" rust-windows-i686-gnu-0.53.1)
   (list "rust-windows-i686-gnullvm-0.52.6" rust-windows-i686-gnullvm-0.52.6)
   (list "rust-windows-i686-gnullvm-0.53.1" rust-windows-i686-gnullvm-0.53.1)
   (list "rust-windows-i686-msvc-0.36.1" rust-windows-i686-msvc-0.36.1)
   (list "rust-windows-i686-msvc-0.42.2" rust-windows-i686-msvc-0.42.2)
   (list "rust-windows-i686-msvc-0.48.5" rust-windows-i686-msvc-0.48.5)
   (list "rust-windows-i686-msvc-0.52.6" rust-windows-i686-msvc-0.52.6)
   (list "rust-windows-i686-msvc-0.53.1" rust-windows-i686-msvc-0.53.1)
   (list "rust-windows-x86-64-gnu-0.36.1" rust-windows-x86-64-gnu-0.36.1)
   (list "rust-windows-x86-64-gnu-0.42.2" rust-windows-x86-64-gnu-0.42.2)
   (list "rust-windows-x86-64-gnu-0.48.5" rust-windows-x86-64-gnu-0.48.5)
   (list "rust-windows-x86-64-gnu-0.52.6" rust-windows-x86-64-gnu-0.52.6)
   (list "rust-windows-x86-64-gnu-0.53.1" rust-windows-x86-64-gnu-0.53.1)
   (list "rust-windows-x86-64-gnullvm-0.42.2" rust-windows-x86-64-gnullvm-0.42.2)
   (list "rust-windows-x86-64-gnullvm-0.48.5" rust-windows-x86-64-gnullvm-0.48.5)
   (list "rust-windows-x86-64-gnullvm-0.52.6" rust-windows-x86-64-gnullvm-0.52.6)
   (list "rust-windows-x86-64-gnullvm-0.53.1" rust-windows-x86-64-gnullvm-0.53.1)
   (list "rust-windows-x86-64-msvc-0.36.1" rust-windows-x86-64-msvc-0.36.1)
   (list "rust-windows-x86-64-msvc-0.42.2" rust-windows-x86-64-msvc-0.42.2)
   (list "rust-windows-x86-64-msvc-0.48.5" rust-windows-x86-64-msvc-0.48.5)
   (list "rust-windows-x86-64-msvc-0.52.6" rust-windows-x86-64-msvc-0.52.6)
   (list "rust-windows-x86-64-msvc-0.53.1" rust-windows-x86-64-msvc-0.53.1)
   (list "rust-winnow-0.6.20" rust-winnow-0.6.20)
   (list "rust-winreg-0.50.0" rust-winreg-0.50.0)
   (list "rust-winreg-0.55.0" rust-winreg-0.55.0)
   (list "rust-winres-0.1.12" rust-winres-0.1.12)
   (list "rust-wintun-bindings-0.7.34" rust-wintun-bindings-0.7.34)
   (list "rust-wit-bindgen-rt-0.39.0" rust-wit-bindgen-rt-0.39.0)
   (list "rust-wmi-0.14.0" rust-wmi-0.14.0)
   (list "rust-write16-1.0.0" rust-write16-1.0.0)
   (list "rust-writeable-0.5.5" rust-writeable-0.5.5)
   (list "rust-x25519-dalek-2.0.1" rust-x25519-dalek-2.0.1)
   (list "rust-yoke-0.7.4" rust-yoke-0.7.4)
   (list "rust-yoke-derive-0.7.4" rust-yoke-derive-0.7.4)
   (list "rust-zerocopy-0.8.27" rust-zerocopy-0.8.27)
   (list "rust-zerocopy-derive-0.8.27" rust-zerocopy-derive-0.8.27)
   (list "rust-zerofrom-0.1.4" rust-zerofrom-0.1.4)
   (list "rust-zerofrom-derive-0.1.4" rust-zerofrom-derive-0.1.4)
   (list "rust-zeroize-1.8.2" rust-zeroize-1.8.2)
   (list "rust-zeroize-derive-1.4.2" rust-zeroize-derive-1.4.2)
   (list "rust-zerovec-0.10.4" rust-zerovec-0.10.4)
   (list "rust-zerovec-derive-0.10.3" rust-zerovec-derive-0.10.3)
   ))
