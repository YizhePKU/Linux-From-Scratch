#!/bin/sh

export PATH="$gcc/bin:$busybox/bin:$make/bin"
export LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so"

# tree doesn't support out-of-tree build
cp -r $src $TMPDIR/source
cd $TMPDIR/source

# Nix store doesn't preserve write-permission bits
chmod -R u+w $TMPDIR/source

make

mkdir -p $out/bin
mv tree $out/bin
