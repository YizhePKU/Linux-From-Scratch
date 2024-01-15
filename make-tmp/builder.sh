#!/bin/sh
set -eu -o pipefail

export PATH="$gcc/bin:$busybox/bin"
export LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
mkdir $TMPDIR/build && cd $TMPDIR/build
$TMPDIR/source/configure --disable-dependency-tracking
/bin/sh build.sh

mkdir -p $out/bin
mv make $out/bin