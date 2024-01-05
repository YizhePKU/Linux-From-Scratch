#!/bin/sh

export PATH="$gcc/bin:$busybox/bin:$make/bin:$m4/bin"
export LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so"

cd $TMPDIR
$src/configure --prefix=$out
make
make install