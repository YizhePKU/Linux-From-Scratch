#!/bin/sh
set -eu -o pipefail

export PATH="$toolchain/bin:$cmake/bin:$make/bin:$busybox/bin"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
mkdir $TMPDIR/build && cd $TMPDIR/build
cmake -S $TMPDIR/source \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build