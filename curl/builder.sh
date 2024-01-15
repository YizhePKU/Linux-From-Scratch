#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$clang/bin:$llvm/bin:$cmake/bin:$make/bin:$busybox/bin"

cmake -S $src \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=ON \
      -DCMAKE_EXE_LINKER_FLAGS="-Wl,--rpath=$out/lib" \
      -DOPENSSL_ROOT_DIR=$openssl \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
