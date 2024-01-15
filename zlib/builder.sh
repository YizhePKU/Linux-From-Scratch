#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$clang/bin:$llvm/bin:$make/bin:$busybox/bin"
export CC="clang"
export LDSHARED="$CC -shared"
export CFLAGS="-nostdlibinc -isystem $musl/include -isystem $linuxHeaders/include"
export LDFLAGS="-nostdlib -L$musl/lib -L$compilerRt/lib/linux -lc -lclang_rt.builtins-x86_64"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
mkdir $TMPDIR/build && cd $TMPDIR/build
$TMPDIR/source/configure --prefix=$out
make -j8
make install