#!/bin/sh

export PATH="$gcc/bin:$busybox/bin:$make/bin:$cmake/bin:$python3/bin:$git/bin"
export LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so -Wl,--enable-new-dtags -Wl,--rpath=$gcc/lib"

# copy source to temporary directory
cp -r $src $TMPDIR/source
chmod -R +w $TMPDIR/source

cd $TMPDIR/source
for patch in $patches; do
    git apply $patch
done

cd $TMPDIR
cmake -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_ASSERTIONS=ON -DCMAKE_INSTALL_PREFIX=$out -DLLVM_TARGETS_TO_BUILD=X86 -DLLVM_ROOT=$llvm $TMPDIR/source/lld
make -j8
make install
