#!/bin/sh

export PATH="$gcc/bin:$busybox/bin:$make/bin"
export LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so"

cd $TMPDIR
$src/configure --disable-dependency-tracking --enable-gprofng=no --prefix=$out
make MAKEINFO=true
make install MAKEINFO=true
