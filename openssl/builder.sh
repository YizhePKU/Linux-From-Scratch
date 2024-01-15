#!/bin/sh
set -eu -o pipefail

export PATH="$perl/bin:$lld/bin:$clang/bin:$llvm/bin:$make/bin:$busybox/bin"

# copy source to temporary directory
cp -r $src $TMPDIR/source
chmod -R +w $TMPDIR/source

# patch shebang
sed -i "s|#! /usr/bin/env perl|#!$perl/bin/perl|" $TMPDIR/source/Configure

cd $TMPDIR/source
./Configure --prefix=$out --libdir=lib
make -j8 CC=clang
make install