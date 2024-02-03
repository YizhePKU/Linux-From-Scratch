#!/bin/sh
set -eu -o pipefail

export PATH="$toolchain/bin:$make/bin:$busybox/bin"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
./configure --prefix=$out CC=clang CXX=clang++ CXXFLAGS="-std=c++14"
make -j8
make install
