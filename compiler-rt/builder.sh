#!/bin/sh
set -eu -o pipefail

export PATH="$python3/bin:$cmake/bin:$make/bin:$toolchain/bin:$busybox/bin"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
cmake -S $TMPDIR/source/compiler-rt/lib/builtins \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
