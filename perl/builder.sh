#!/bin/sh

export PATH="$gcc/bin:$busybox/bin:$gnumake/bin"

cd $TMPDIR
$src/Configure -des -Dcc=gcc -Dldflags="-Wl,--dynamic-linker=$gcc/lib/libc.so" -Dprefix=$out -Dmksymlinks
make
make install