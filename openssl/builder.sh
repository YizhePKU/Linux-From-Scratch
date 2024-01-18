#!/bin/sh
set -eu -o pipefail

export PATH="$perl/bin:$make/bin:$toolchain/bin:$busybox/bin"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# patch phase
sed -i "s|#! /usr/bin/env perl|#!$perl/bin/perl|" ./Configure

# build phase
./Configure --prefix=$out --libdir=lib
make -j8 CC=clang
make install