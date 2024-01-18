#!/bin/sh
set -eu -o pipefail

export PATH="$toolchain/bin:$busybox/bin"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
clang -c -isystem . argp-ba.c argp-eexst.c argp-fmtstream.c argp-help.c argp-parse.c argp-pv.c argp-pvh.c
ar rcs libargp.a *.o

mkdir -p $out/include
cp *.h $out/include
mkdir -p $out/lib
cp libargp.a $out/lib