#!/bin/sh
set -eu -o pipefail

export PATH="$toolchain/bin:$make/bin:$busybox/bin"
export CFLAGS="-I$zlib/include"
export LDFLAGS="-L$zlib/lib -lz"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
mkdir $TMPDIR/build && cd $TMPDIR/build
$TMPDIR/source/configure --prefix=$out --with-openssl=$openssl
make -j8
make install
