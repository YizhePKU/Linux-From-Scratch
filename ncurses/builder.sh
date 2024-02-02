#!/bin/sh
set -eu -o pipefail

export PATH="$toolchain/bin:$make/bin:$busybox/bin"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
mkdir $TMPDIR/build && cd $TMPDIR/build
$TMPDIR/source/configure CC=clang --prefix=$out --with-shared --without-debug --enable-rpath
make -j8
make install

# Some programs expect to find `ncurses.h` in `$ncurses/include` instead of `$ncurses/ncurses/include`
ln -s $out/include/ncurses/curses.h $out/include/ncurses.h