#!/bin/sh
set -eu -o pipefail

export PATH="$curl/bin:$lld/bin:$clang/bin:$llvm/bin:$make/bin:$busybox/bin"

# copy source to temporary directory
cp -r $src $TMPDIR/source
chmod -R +w $TMPDIR/source

cd $TMPDIR/source
make -j8 CC=clang CFLAGS="-I$zlib/include -I$curl/include" LDFLAGS="-L$zlib/lib -L$curl/lib -lz -lcurl" prefix=$out NO_PERL=1 NO_OPENSSL=1 NO_REGEX=1 NO_EXPAT=1 NO_TCLTK=1 NO_GETTEXT=1
make install CC=clang CFLAGS="-I$zlib/include -I$curl/include" LDFLAGS="-L$zlib/lib -L$curl/lib -lz -lcurl" prefix=$out NO_PERL=1 NO_OPENSSL=1 NO_REGEX=1 NO_EXPAT=1 NO_TCLTK=1 NO_GETTEXT=1