#!/bin/sh

export PATH="$gcc/bin:$busybox/bin:$make/bin"
export LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so"

cd $TMPDIR
$src/configure --disable-openssl --disable-xxhash --disable-zstd --disable-lz4 --prefix=$out
make
make install
