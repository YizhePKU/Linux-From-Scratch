#!/bin/sh
set -eu -o pipefail

export PATH="$make/bin:$gcc/bin:$busybox/bin"

# copy source to temporary directory
cp -r $src $TMPDIR/source
chmod -R +w $TMPDIR/source

cd $TMPDIR/source
make -j8 CC=gcc CFLAGS="-I$zlib/include" LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so -L$zlib/lib -Wl,--rpath=$zlib/lib" prefix=$out NO_PERL=1 NO_CURL=1 NO_OPENSSL=1 NO_REGEX=1 NO_TCLTK=1 NO_GETTEXT=1
make install CC=gcc CFLAGS="-I$zlib/include" LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so -L$zlib/lib -Wl,--rpath=$zlib/lib" prefix=$out NO_PERL=1 NO_CURL=1 NO_OPENSSL=1 NO_REGEX=1 NO_TCLTK=1 NO_GETTEXT=1