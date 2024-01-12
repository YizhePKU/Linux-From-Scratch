#!/bin/sh
set -eu -o pipefail

export PATH="$rsync/bin:$make/bin:$gcc/bin:$busybox/bin"
export HOSTCFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so"

# copy source to temporary directory
cp -r $src $TMPDIR/source
chmod -R +w $TMPDIR/source

cd $TMPDIR/source
make headers_install ARCH=x86_64 INSTALL_HDR_PATH=$out