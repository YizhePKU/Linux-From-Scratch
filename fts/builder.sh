#!/bin/sh
set -eu -o pipefail

export PATH="$toolchain/bin:$busybox/bin"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# patch phase
sed -i 's|#include "config.h"||' fts.c

# build phase
clang -c -isystem . fts.c
ar rcs libfts.a *.o

mkdir -p $out/include
cp *.h $out/include
mkdir -p $out/lib
cp libfts.a $out/lib