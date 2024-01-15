#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$clang/bin:$llvm/bin:$make/bin:$git/bin:$busybox/bin"
export KCONFIG_NOTIMESTAMP=1

# copy source to temporary directory
cp -r $src $TMPDIR/source
chmod -R +w $TMPDIR/source

# apply patches
cd $TMPDIR/source
for patch in $patches; do
    git apply $patch
done

# create custom config
cat <<EOF >custom_config
# CONFIG_STATIC_LIBGCC is not set
EOF

make defconfig HOSTCC=clang CC=clang
$merge -m .config custom_config
make -j8 HOSTCC=clang CC=clang

mkdir -p $out/bin
cp busybox $out/bin
$out/bin/busybox --install -s $out/bin