#!/bin/sh
set -eu -o pipefail

export PATH="$make/bin:$gcc/bin:$busybox/bin"
export LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so"

cd $TMPDIR
$src/configure --disable-openssl --disable-xxhash --disable-zstd --disable-lz4 --prefix=$out
make -j8
make install
