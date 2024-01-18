#!/bin/sh
set -eu -o pipefail

export PATH="$make/bin:$toolchain/bin:$busybox/bin"
export CC="clang"
export LDSHARED="$CC -shared"
export LDFLAGS="-L$musl/lib"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
mkdir $TMPDIR/build && cd $TMPDIR/build
$TMPDIR/source/configure --prefix=$out
make -j8
make install