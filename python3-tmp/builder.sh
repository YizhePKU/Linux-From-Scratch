#!/bin/sh
set -eu -o pipefail

export PATH="$make/bin:$gcc/bin:$busybox/bin:"
export LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so -Wl,--rpath=$gcc/lib"

cd $TMPDIR
$src/configure --prefix=$out --with-ensurepip=no
make -j8
make install
