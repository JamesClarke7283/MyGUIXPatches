;;; -*- mode: scheme; -*-
;;
;;; Fixed sources for the C/C++ dependencies of bun.
;;;
;;; Bun's build fetches ~21 GitHub archives and builds each one.  Guix's build
;;; sandbox has no network, so every archive has to arrive as a fixed-output
;;; origin and be placed where scripts/build/deps/*.ts expects it, together with
;;; a .ref stamp recording the source identity -- otherwise the fetch step tries
;;; to download and fails with "Failed to download after 10 attempts".
;;;
;;; Regenerate with tools/update-bun-deps.sh -- do not edit by hand.
(define-module (patches bun-deps)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:export (%bun-dep-sources))

(define %bun-dep-sources
  (list
   ;; highway: https://github.com/google/highway at 2607d3b5b0113992fe84d3848859eae13b3b52c1
   (list "highway" "google/highway" "2607d3b5b0113992fe84d3848859eae13b3b52c1"
         (origin
           (method url-fetch)
           (uri "https://github.com/google/highway/archive/2607d3b5b0113992fe84d3848859eae13b3b52c1.tar.gz")
           (file-name "highway-2607d3b5b0113992fe84d3848859eae13b3b52c1.tar.gz")
           (sha256 (base32 "098cjkvvl3yr38x05s3w4chi7q5s9yciz3yspq3f9cz0h5bp07bl"))))
   ;; lolhtml: https://github.com/oven-sh/lol-html at 725ce499aa9b71e38b7a2d0a9fbb6d7294a4079e
   (list "lolhtml" "oven-sh/lol-html" "725ce499aa9b71e38b7a2d0a9fbb6d7294a4079e"
         (origin
           (method url-fetch)
           (uri "https://github.com/oven-sh/lol-html/archive/725ce499aa9b71e38b7a2d0a9fbb6d7294a4079e.tar.gz")
           (file-name "lolhtml-725ce499aa9b71e38b7a2d0a9fbb6d7294a4079e.tar.gz")
           (sha256 (base32 "0j57040fhjzw0r8jrjxplbynb1mv311cssg8fb5srm52w7dkxn5g"))))
   ;; tinycc: https://github.com/oven-sh/tinycc at 05f0fafaa3be31e31d7b4b5c17dc60f62c991171
   (list "tinycc" "oven-sh/tinycc" "05f0fafaa3be31e31d7b4b5c17dc60f62c991171"
         (origin
           (method url-fetch)
           (uri "https://github.com/oven-sh/tinycc/archive/05f0fafaa3be31e31d7b4b5c17dc60f62c991171.tar.gz")
           (file-name "tinycc-05f0fafaa3be31e31d7b4b5c17dc60f62c991171.tar.gz")
           (sha256 (base32 "025w6jaylcqbbfrf1l0937jkb3hx17vl3binvngsa8r96600cxah"))))
   ;; libarchive: https://github.com/libarchive/libarchive at 27cbc7827172698143e440801fc0ba39ccb4f1f5
   (list "libarchive" "libarchive/libarchive" "27cbc7827172698143e440801fc0ba39ccb4f1f5"
         (origin
           (method url-fetch)
           (uri "https://github.com/libarchive/libarchive/archive/27cbc7827172698143e440801fc0ba39ccb4f1f5.tar.gz")
           (file-name "libarchive-27cbc7827172698143e440801fc0ba39ccb4f1f5.tar.gz")
           (sha256 (base32 "14hvi5nfizg8dq5349rfzwrn6bi3gf1dq8k61v4a8vblykpq3sc1"))))
   ;; rust-argon2: https://github.com/sru-systems/rust-argon2 at ed81866f163f0c7026aa6fd8388adf37242eb32a
   (list "rust-argon2" "sru-systems/rust-argon2" "ed81866f163f0c7026aa6fd8388adf37242eb32a"
         (origin
           (method url-fetch)
           (uri "https://github.com/sru-systems/rust-argon2/archive/ed81866f163f0c7026aa6fd8388adf37242eb32a.tar.gz")
           (file-name "rust-argon2-ed81866f163f0c7026aa6fd8388adf37242eb32a.tar.gz")
           (sha256 (base32 "1bvvwpxmrl5n23p680sy4zcv642wyk27d76li3sgm4gi8is7jz77"))))
   ;; boringssl: https://github.com/oven-sh/boringssl at 41bf9b59c2ebf277a7aa427e1ecad5cc80dd4d4f
   (list "boringssl" "oven-sh/boringssl" "41bf9b59c2ebf277a7aa427e1ecad5cc80dd4d4f"
         (origin
           (method url-fetch)
           (uri "https://github.com/oven-sh/boringssl/archive/41bf9b59c2ebf277a7aa427e1ecad5cc80dd4d4f.tar.gz")
           (file-name "boringssl-41bf9b59c2ebf277a7aa427e1ecad5cc80dd4d4f.tar.gz")
           (sha256 (base32 "1pd1i7y7n7m6yhli2q0x28isj9q06dmnc62wg2nz1spifma8s0m5"))))
   ;; cares: https://github.com/c-ares/c-ares at c7a3138dcfe3bb0eaaf10c0c24c36dc66dc790ab
   (list "cares" "c-ares/c-ares" "c7a3138dcfe3bb0eaaf10c0c24c36dc66dc790ab"
         (origin
           (method url-fetch)
           (uri "https://github.com/c-ares/c-ares/archive/c7a3138dcfe3bb0eaaf10c0c24c36dc66dc790ab.tar.gz")
           (file-name "cares-c7a3138dcfe3bb0eaaf10c0c24c36dc66dc790ab.tar.gz")
           (sha256 (base32 "00zyq0ladjsx7a3csj7cfh41ivlw90cxb6r2dhvh8fxj54q1psn9"))))
   ;; mimalloc: https://github.com/oven-sh/mimalloc at 92ef6587c57b262f6e6abf513f7776a2f8d12aeb
   (list "mimalloc" "oven-sh/mimalloc" "92ef6587c57b262f6e6abf513f7776a2f8d12aeb"
         (origin
           (method url-fetch)
           (uri "https://github.com/oven-sh/mimalloc/archive/92ef6587c57b262f6e6abf513f7776a2f8d12aeb.tar.gz")
           (file-name "mimalloc-92ef6587c57b262f6e6abf513f7776a2f8d12aeb.tar.gz")
           (sha256 (base32 "044mqsm0rp2zvd4zbnkki89szd0cn5kwshxdvawj2sxr60bqnw0y"))))
   ;; libjpeg-turbo: https://github.com/libjpeg-turbo/libjpeg-turbo at c85e6b905bf237038faa936dab160ebfc5da0344
   (list "libjpeg-turbo" "libjpeg-turbo/libjpeg-turbo" "c85e6b905bf237038faa936dab160ebfc5da0344"
         (origin
           (method url-fetch)
           (uri "https://github.com/libjpeg-turbo/libjpeg-turbo/archive/c85e6b905bf237038faa936dab160ebfc5da0344.tar.gz")
           (file-name "libjpeg-turbo-c85e6b905bf237038faa936dab160ebfc5da0344.tar.gz")
           (sha256 (base32 "0vygh8zrzvlldg5q2mda5lzxhqmyp18s8zwdminibmjy64zrl825"))))
   ;; libspng: https://github.com/randy408/libspng at fb768002d4288590083a476af628e51c3f1d47cd
   (list "libspng" "randy408/libspng" "fb768002d4288590083a476af628e51c3f1d47cd"
         (origin
           (method url-fetch)
           (uri "https://github.com/randy408/libspng/archive/fb768002d4288590083a476af628e51c3f1d47cd.tar.gz")
           (file-name "libspng-fb768002d4288590083a476af628e51c3f1d47cd.tar.gz")
           (sha256 (base32 "0spqmdki9jjp9vdjz31fikgmm1xkyczk4s77d45pa2npj0r82mnn"))))
   ;; libdeflate: https://github.com/ebiggers/libdeflate at 92e6a0db9fa848d742f9eb286c92afc60f2c3dda
   (list "libdeflate" "ebiggers/libdeflate" "92e6a0db9fa848d742f9eb286c92afc60f2c3dda"
         (origin
           (method url-fetch)
           (uri "https://github.com/ebiggers/libdeflate/archive/92e6a0db9fa848d742f9eb286c92afc60f2c3dda.tar.gz")
           (file-name "libdeflate-92e6a0db9fa848d742f9eb286c92afc60f2c3dda.tar.gz")
           (sha256 (base32 "1ds4p1cqmhya09hayb6wydbmbiy8g4y6byqz7xg5lzw2960ljmmg"))))
   ;; libwebp: https://github.com/webmproject/libwebp at b7e29b9d75bd31422b00c2a446d49d7af06c328d
   (list "libwebp" "webmproject/libwebp" "b7e29b9d75bd31422b00c2a446d49d7af06c328d"
         (origin
           (method url-fetch)
           (uri "https://github.com/webmproject/libwebp/archive/b7e29b9d75bd31422b00c2a446d49d7af06c328d.tar.gz")
           (file-name "libwebp-b7e29b9d75bd31422b00c2a446d49d7af06c328d.tar.gz")
           (sha256 (base32 "1dmj8p4kg95lqay2zx0f3c0b9f0r5s1wz8ncn0didwjg8ns8kyvn"))))
   ;; brotli: https://github.com/google/brotli at db24a98aed38a16de78cc05ca15cdd8dc2a0d92d
   (list "brotli" "google/brotli" "db24a98aed38a16de78cc05ca15cdd8dc2a0d92d"
         (origin
           (method url-fetch)
           (uri "https://github.com/google/brotli/archive/db24a98aed38a16de78cc05ca15cdd8dc2a0d92d.tar.gz")
           (file-name "brotli-db24a98aed38a16de78cc05ca15cdd8dc2a0d92d.tar.gz")
           (sha256 (base32 "13nnl0fibghi1xhfbqqgzfyjzv3f4s1p41qd6vrx4kf1vy2rcfqi"))))
   ;; lsqpack: https://github.com/litespeedtech/ls-qpack at 91567706c41c0d97ab8dc576873ecd472d7869fa
   (list "lsqpack" "litespeedtech/ls-qpack" "91567706c41c0d97ab8dc576873ecd472d7869fa"
         (origin
           (method url-fetch)
           (uri "https://github.com/litespeedtech/ls-qpack/archive/91567706c41c0d97ab8dc576873ecd472d7869fa.tar.gz")
           (file-name "lsqpack-91567706c41c0d97ab8dc576873ecd472d7869fa.tar.gz")
           (sha256 (base32 "0g4lqvk0207m6npivdgjz3dbf06zw8ibr3zsnc69gqxfm5lpm3qy"))))
   ;; zstd: https://github.com/facebook/zstd at f8745da6ff1ad1e7bab384bd1f9d742439278e99
   (list "zstd" "facebook/zstd" "f8745da6ff1ad1e7bab384bd1f9d742439278e99"
         (origin
           (method url-fetch)
           (uri "https://github.com/facebook/zstd/archive/f8745da6ff1ad1e7bab384bd1f9d742439278e99.tar.gz")
           (file-name "zstd-f8745da6ff1ad1e7bab384bd1f9d742439278e99.tar.gz")
           (sha256 (base32 "0b55bvl4jn3lzl03llfjq2sga3skjmrz4d9w22wn2pmjrzqd22sb"))))
   ;; lsquic: https://github.com/litespeedtech/lsquic at f812ceb9529e26717df78c6064a2ff648b949f3e
   (list "lsquic" "litespeedtech/lsquic" "f812ceb9529e26717df78c6064a2ff648b949f3e"
         (origin
           (method url-fetch)
           (uri "https://github.com/litespeedtech/lsquic/archive/f812ceb9529e26717df78c6064a2ff648b949f3e.tar.gz")
           (file-name "lsquic-f812ceb9529e26717df78c6064a2ff648b949f3e.tar.gz")
           (sha256 (base32 "0ggpdp4xipqbkj2mv85bpwg2iw3idibif3j6v5gd718fh45iva65"))))
   ;; zlib: https://github.com/zlib-ng/zlib-ng at 12731092979c6d07f42da27da673a9f6c7b13586
   (list "zlib" "zlib-ng/zlib-ng" "12731092979c6d07f42da27da673a9f6c7b13586"
         (origin
           (method url-fetch)
           (uri "https://github.com/zlib-ng/zlib-ng/archive/12731092979c6d07f42da27da673a9f6c7b13586.tar.gz")
           (file-name "zlib-12731092979c6d07f42da27da673a9f6c7b13586.tar.gz")
           (sha256 (base32 "1mp8j9fvxiz3g5msixwv8svjxyr76ff3lmd1jfkmcjy84b8sblm0"))))
   ;; lshpack: https://github.com/litespeedtech/ls-hpack at cf0f70dd10b352194c97448eb5d00b4aa484f531
   (list "lshpack" "litespeedtech/ls-hpack" "cf0f70dd10b352194c97448eb5d00b4aa484f531"
         (origin
           (method url-fetch)
           (uri "https://github.com/litespeedtech/ls-hpack/archive/cf0f70dd10b352194c97448eb5d00b4aa484f531.tar.gz")
           (file-name "lshpack-cf0f70dd10b352194c97448eb5d00b4aa484f531.tar.gz")
           (sha256 (base32 "1y7raxknjzv2jpq2249jgc6hamxd137l4jbqnm9z7xz5f7ydhf5i"))))
   ;; libuv: https://github.com/oven-sh/libuv at 8023581113b276e7c1aee3f82da57ca0893faab1
   (list "libuv" "oven-sh/libuv" "8023581113b276e7c1aee3f82da57ca0893faab1"
         (origin
           (method url-fetch)
           (uri "https://github.com/oven-sh/libuv/archive/8023581113b276e7c1aee3f82da57ca0893faab1.tar.gz")
           (file-name "libuv-8023581113b276e7c1aee3f82da57ca0893faab1.tar.gz")
           (sha256 (base32 "1k0fbflylf951qnc3g7ad1rs09dfq3x84wk0fgk29hyq2gk9bfwk"))))
   ;; hdrhistogram: https://github.com/HdrHistogram/HdrHistogram_c at 18c7a324383dded1451d15621cd018b0048057d0
   (list "hdrhistogram" "HdrHistogram/HdrHistogram_c" "18c7a324383dded1451d15621cd018b0048057d0"
         (origin
           (method url-fetch)
           (uri "https://github.com/HdrHistogram/HdrHistogram_c/archive/18c7a324383dded1451d15621cd018b0048057d0.tar.gz")
           (file-name "hdrhistogram-18c7a324383dded1451d15621cd018b0048057d0.tar.gz")
           (sha256 (base32 "0cial6c5znwjycpg6y45842r1b1axira76rgcccwki3y0v190wj2"))))
   ;; picohttpparser: https://github.com/h2o/picohttpparser at f4d94b48b31e0abae029ebeafcfd9ca0680ede58
   (list "picohttpparser" "h2o/picohttpparser" "f4d94b48b31e0abae029ebeafcfd9ca0680ede58"
         (origin
           (method url-fetch)
           (uri "https://github.com/h2o/picohttpparser/archive/f4d94b48b31e0abae029ebeafcfd9ca0680ede58.tar.gz")
           (file-name "picohttpparser-f4d94b48b31e0abae029ebeafcfd9ca0680ede58.tar.gz")
           (sha256 (base32 "173yvj4spjy25hkl9j73cvjs64inxh6vdxjylsvk4r9c3snkyxxx"))))
   ))
