#!/bin/sh
set -eu -o pipefail

export PATH="$toolchain/bin:$make/bin:$m4/bin:$busybox/bin"
export LD=ld.lld
# FNM_EXTMATCH is a GNU extension. Ignore it by defining it to 0.
export CFLAGS="-DFNM_EXTMATCH=0 -I$zlib/include -I$argp/include -I$fts/include -I$obstack/include"
export LDFLAGS="-Wl,--rpath=$out/lib -Wl,--undefined-version -L$zlib/lib -L$argp/lib -L$fts/lib -L$obstack/lib"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

./configure --prefix=$out --disable-libdebuginfod --disable-debuginfod
make -j8
make install
