#!/bin/sh

export PATH="$gcc/bin:$busybox/bin:$make/bin:$cmake/bin:$python3/bin"

cd $TMPDIR
cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DCOMPILER_RT_INCLUDE_TESTS=OFF \
      -DCOMPILER_RT_BUILD_SANITIZERS=OFF \
      -DCOMPILER_RT_BUILD_MEMPROF=OFF \
      -DCOMPILER_RT_BUILD_XRAY=OFF \
      -DCOMPILER_RT_BUILD_LIBFUZZER=OFF \
      -DCOMPILER_RT_BUILD_ORC=OFF \
      -DCOMPILER_RT_BUILD_PROFILE=OFF \
      -DCOMPILER_RT_BUILD_GWP_ASAN=OFF \
      $src/compiler-rt
make -j8
make install
