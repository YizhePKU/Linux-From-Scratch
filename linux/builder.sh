#!/bin/sh
set -eu -o pipefail

export PATH="$toolchain/bin:$make/bin:$perl/bin:$flex/bin:$bison/bin:$busybox/bin"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
mkdir $TMPDIR/build
cp $config $TMPDIR/build/.config
make -j8 O=$TMPDIR/build LLVM=1 HOSTCFLAGS="-I$elfutils/include -I$openssl/include" HOSTLDFLAGS="-L$elfutils/lib -L$openssl/lib"

cd $TMPDIR/build
mkdir $out
cp arch/x86/boot/bzImage $out
cp System.map $out
cp .config $out
