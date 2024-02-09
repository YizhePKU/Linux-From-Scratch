#!/bin/sh
set -eu -o pipefail

export PATH="$toolchain/bin:$make/bin:$busybox/bin"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=2

# patch phase
# musl doesn't implement `sigsetmask` and `sigblock`, here's a workaround:
# https://github.com/cheusov/nbase/issues/4#issuecomment-546694857
sed -i 's/gcc/clang/g' src/conf-cc src/conf-ld src/find-systype.sh
sed -i 's/clang -O2 -Wall/clang -O2 -Wall -Wno-implicit-function-declaration -Wno-int-conversion -D"sigsetmask(x)=sigprocmask(SIG_SETMASK,x,0)" -D"sigblock(x)=sigprocmask(SIG_BLOCK,x,0)"/g' src/conf-cc
sed -i '/cat warn-shsgr; exit 1/d' src/Makefile

# build phase
package/compile

mkdir -p $out/bin
cp command/* $out/bin