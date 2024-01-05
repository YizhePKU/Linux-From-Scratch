#!/bin/sh

export PATH="$gcc/bin:$busybox/bin:$make/bin"
export LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so"

cd $TMPDIR
$src/configure --disable-dependency-tracking --enable-install-program=hostname --prefix=$out
make
make install
