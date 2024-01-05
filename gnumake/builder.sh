#!/bin/sh

export PATH="$gcc/bin:$busybox/bin"
export LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so"

cd $TMPDIR
$src/configure --disable-dependency-tracking
/bin/sh build.sh

mkdir -p $out/bin
mv make $out/bin