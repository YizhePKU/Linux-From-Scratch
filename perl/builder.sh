#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$clang/bin:$llvm/bin:$make/bin:$busybox/bin"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
mkdir $TMPDIR/build && cd $TMPDIR/build
# Perl checks for the availability of functions (such as `eaccess`) by look for it in libc symbols,
# instead of test-compiling a program like every sensible build system does.
# -Dccflags="-D_GNU_SOURCE" is required to make `eaccess` available.
$TMPDIR/source/Configure -des -Dcc=clang -Dprefix=$out -Dmksymlinks -Dccflags="-D_GNU_SOURCE"
make -j8
make install