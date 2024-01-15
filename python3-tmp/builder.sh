#!/bin/sh
set -eu -o pipefail

export PATH="$make/bin:$gcc/bin:$busybox/bin:"
export LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so -Wl,--rpath=$gcc/lib"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
mkdir $TMPDIR/build && cd $TMPDIR/build
$TMPDIR/source/configure --prefix=$out --with-ensurepip=no
make -j8
make install
