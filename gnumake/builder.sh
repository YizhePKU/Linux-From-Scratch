#!/bin/sh

export PATH="$gcc/bin:$busybox/bin"

# gnumake doesn't support out-of-tree build
cp -r $src $TMPDIR/source
cd $TMPDIR/source

# Nix doesn't preserve write-permission bits when copying files into the store
chmod -R u+w $TMPDIR/source

# Specifying --host tells autotools we're "cross-compiling", even though we really aren't.
# This is necessary to skip some sanity checks (because binaries won't run without patchelf)
./configure --disable-dependency-tracking --host=x86_64-pc-linux-gnu

/bin/sh build.sh

$patchelf --set-interpreter $gcc/lib/libc.so make

mv make $out