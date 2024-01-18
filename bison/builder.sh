#!/bin/sh
set -eu -o pipefail

export PATH="$toolchain/bin:$make/bin:$m4/bin:$busybox/bin"
export LD=ld.lld

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

./configure --prefix=$out
make -j8
make install
