#!/bin/sh

export PATH="$busybox/bin:$make/bin:$gcc/bin:$rsync/bin"
export HOSTCFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so"

cp -r $src $TMPDIR/source
chmod -R +w $TMPDIR/source
cd $TMPDIR/source

make headers_install ARCH=x86_64 INSTALL_HDR_PATH=$out