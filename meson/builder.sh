#!/bin/sh
set -eu -o pipefail

export PATH="$toolchain/bin:$python3/bin:$busybox/bin"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# patch phase
sed -i "s|#!/usr/bin/env python3|#!$python3/bin/python3|" meson.py

# build phase
mkdir $out
cp -r mesonbuild $out
cp meson.py $out
mkdir $out/bin
ln -s $out/meson.py $out/bin/meson
