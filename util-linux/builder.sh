#!/bin/sh
set -eu -o pipefail

export PATH="$toolchain/bin:$make/bin:$busybox/bin"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
mkdir $TMPDIR/build && cd $TMPDIR/build
$TMPDIR/source/configure --prefix=$out LD=lld --disable-shared --disable-use-tty-group --disable-makeinstall-chown --disable-makeinstall-setuid
make -j8
make install

# fixup phase
mv $out/sbin/* $out/bin
rmdir $out/sbin