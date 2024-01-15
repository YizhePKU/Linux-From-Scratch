#!/bin/sh
set -eu -o pipefail

export PATH="$rsync/bin:$make/bin:$gcc/bin:$busybox/bin"
export HOSTCFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
make headers_install ARCH=x86_64 INSTALL_HDR_PATH=$out