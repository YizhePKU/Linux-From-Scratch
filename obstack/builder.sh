#!/bin/sh
set -eu -o pipefail

export PATH="$toolchain/bin:$busybox/bin"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# patch phase
sed -i 's|# include <config.h>||' obstack.c

# build phase
clang -c -isystem . obstack.c obstack_printf.c
ar rcs libobstack.a *.o

mkdir -p $out/include
cp *.h $out/include
mkdir -p $out/lib
cp libobstack.a $out/lib