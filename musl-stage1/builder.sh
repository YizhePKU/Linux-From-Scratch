#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$clang/bin:$llvm/bin:$make/bin:$busybox/bin"
export CC=clang
export CFLAGS="-nostdinc"
export LDFLAGS="-nostdlib -fuse-ld=lld -L$gcc/lib/gcc/x86_64-linux-musl/11.2.1 -lgcc"

# copy source to temporary directory
cp -r $src $TMPDIR/source
chmod -R +w $TMPDIR/source

cd $TMPDIR
$TMPDIR/source/configure --prefix=$out --syslibdir=$out/lib
make -j8
make install
