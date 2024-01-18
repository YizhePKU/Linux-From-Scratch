#!/bin/sh
set -eu -o pipefail

export PATH="$busybox/bin"

mkdir -p $out/bin
mkdir -p $out/include
mkdir -p $out/lib/x86_64-unknown-linux-musl

# Install llvm-binutils
cp -r $llvm/bin $out

# Install Clang
cp -r $clang/bin $out
cp -r $clang/lib/clang $out/lib

# Install lld
cp -r $lld/bin $out

# Install musl
cp -rs $musl/include $out
cp -rs $musl/lib/* $out/lib/x86_64-unknown-linux-musl

# Install compiler-rt
chmod +w $out/lib/clang/17
cp -rs $compilerRt/lib $out/lib/clang/17

# Install libc++
cp -rs $libcxx/include $out
cp -rs $libcxx/lib/* $out/lib/x86_64-unknown-linux-musl

# Install linux-headers
chmod +w $out/include/scsi
cp -rs $linuxHeaders/include $out