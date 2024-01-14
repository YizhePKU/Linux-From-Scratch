#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$clang/bin:$llvm/bin:$make/bin:$busybox/bin"
export CC="clang"
export LDSHARED="$CC -shared"
export CFLAGS="-nostdlibinc -isystem $musl/include -isystem $linuxHeaders/include"
export LDFLAGS="-nostdlib -L$musl/lib -L$compilerRt/lib/linux -lc -lclang_rt.builtins-x86_64"

cd $TMPDIR
$src/configure --prefix=$out
make -j8
make install