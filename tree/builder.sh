#!/bin/sh

export PATH="$gcc/bin:$busybox/bin"

# tree doesn't support out-of-tree build
cp -r $src $TMPDIR/source
cd $TMPDIR/source

# Nix store doesn't preserve write-permission bits
chmod -R u+w $TMPDIR/source

$make

$patchelf --set-interpreter $gcc/lib/libc.so tree

mv tree $out