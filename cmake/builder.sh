#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$clang/bin:$llvm/bin:$make/bin:$busybox/bin"

# copy source to temporary directory
cp -r $src $TMPDIR/source
chmod -R +w $TMPDIR/source

cd $TMPDIR
$TMPDIR/source/bootstrap --prefix=$out --parallel=8 -- -DOPENSSL_ROOT_DIR=$openssl
make -j8
make install
