#!/bin/sh
set -eu -o pipefail

export PATH="$toolchain/bin:$busybox/bin"
export LD="ld.lld"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
mkdir $TMPDIR/build && cd $TMPDIR/build
$TMPDIR/source/configure --disable-dependency-tracking
/bin/sh build.sh

mkdir -p $out/bin
mv make $out/bin