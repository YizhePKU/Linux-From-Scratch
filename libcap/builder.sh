#!/bin/sh
set -eu -o pipefail

export PATH="$toolchain/bin:$make/bin:$busybox/bin"
export LDFLAGS="-Wl,--rpath=$out/lib"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# patch phase
sed -i 's|#!/bin/bash|#!/bin/sh|' progs/mkcapshdoc.sh

# build phase
make -j8 prefix=$out lib=lib sbin=bin CC=clang CAPSH_SHELL='-DSHELL=\"/bin/sh\"'
make install prefix=$out lib=lib sbin=bin CC=clang CAPSH_SHELL='-DSHELL=\"/bin/sh\"'
