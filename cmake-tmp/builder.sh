#!/bin/sh

export PATH="$gcc/bin:$busybox/bin:$make/bin"
export LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so -Wl,--enable-new-dtags -Wl,--rpath=$gcc/lib"

# copy source to temporary directory
cp -r $src $TMPDIR/source
chmod -R +w $TMPDIR/source

cd $TMPDIR
$TMPDIR/source/bootstrap --prefix=$out --parallel=8 -- -DCMAKE_USE_OPENSSL=OFF
make -j8
make install
