#!/bin/sh
set -eu -o pipefail

export PATH="$make/bin:$gcc/bin:$busybox/bin"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
make -j8 CC=gcc CFLAGS="-I$zlib/include" LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so -L$zlib/lib -Wl,--rpath=$zlib/lib" prefix=$out NO_PERL=1 NO_CURL=1 NO_OPENSSL=1 NO_REGEX=1 NO_TCLTK=1 NO_GETTEXT=1
make install CC=gcc CFLAGS="-I$zlib/include" LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so -L$zlib/lib -Wl,--rpath=$zlib/lib" prefix=$out NO_PERL=1 NO_CURL=1 NO_OPENSSL=1 NO_REGEX=1 NO_TCLTK=1 NO_GETTEXT=1