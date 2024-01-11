#!/bin/sh

export PATH="$llvm/bin:$clang/bin:$lld/bin:$make/bin:$busybox/bin"
export CC=clang
export CFLAGS="-nostdinc"
export LDFLAGS="-fuse-ld=lld -nostdinc -nostdlib"

# copy source to temporary directory
cp -r $src $TMPDIR/source
chmod -R +w $TMPDIR/source

cd $TMPDIR
$TMPDIR/source/configure --prefix=$out --syslibdir=$out/lib
make -j8
make install
