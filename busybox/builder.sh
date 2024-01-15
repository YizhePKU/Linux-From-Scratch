#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$clang/bin:$llvm/bin:$make/bin:$git/bin:$busybox/bin"
export KCONFIG_NOTIMESTAMP=1

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# patch phase
for patch in $patches; do
    git apply $patch
done

# create custom KBuild config, then merge with default config
cat <<EOF >custom_config
# CONFIG_STATIC_LIBGCC is not set
EOF
make defconfig HOSTCC=clang CC=clang
$merge -m .config custom_config

# build phase
make -j8 HOSTCC=clang CC=clang
mkdir -p $out/bin
cp busybox $out/bin
$out/bin/busybox --install -s $out/bin