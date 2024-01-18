#!/bin/sh
set -eu -o pipefail

export PATH="$make/bin:$toolchain/bin:$busybox/bin"
export CC=clang

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

./configure --prefix=$out --syslibdir=$out/lib
make -j8
make install
