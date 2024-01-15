#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$clang/bin:$llvm/bin:$make/bin:$busybox/bin"

# Perl checks for the availability of functions (such as `eaccess`) by look for it in libc symbols,
# instead of test-compiling a program like every sensible build system does.
# "-D_GNU_SOURCE" is required to make `eaccess` available.
cd $TMPDIR
$src/Configure -des -Dcc=clang -Dprefix=$out -Dmksymlinks -Dccflags="-D_GNU_SOURCE"
make -j8
make install