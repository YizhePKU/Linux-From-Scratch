#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$clang/bin:$llvm/bin:$busybox/bin"
export LD="ld.lld"

cd $TMPDIR
$src/configure --disable-dependency-tracking
/bin/sh build.sh

mkdir -p $out/bin
mv make $out/bin