#!/bin/sh
set -eu -o pipefail

export PATH="$toolchain/bin:$make/bin:$busybox/bin"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
mkdir $TMPDIR/build && cd $TMPDIR/build
$TMPDIR/source/configure CC=clang --prefix=$out --with-shared --without-debug --enable-rpath --enable-widec 
make -j8
make install

# Some programs expect to find `curses.h` in `$ncurses/include` instead of `$ncurses/ncursesw/include`
ln -s $out/include/ncursesw/curses.h $out/include/curses.h