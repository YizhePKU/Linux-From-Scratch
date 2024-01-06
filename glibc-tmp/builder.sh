#!/bin/sh

export PATH="$python3/bin:$gawk/bin:$bison/bin:$gcc/bin:$busybox/bin:$make/bin"

# Fix -Werror build failure when building glibc with musl with GCC >= 8, see:
# https://github.com/NixOS/nixpkgs/pull/68244#issuecomment-544307798
export CFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so -O2 -Wno-error=attribute-alias"

cd $TMPDIR
$src/configure --prefix=$out --enable-kernel=4.14 --with-headers=$linux_headers/include
make -j
make install
