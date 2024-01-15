{ busybox-bin, make-tmp, cmake-tmp, python3-tmp, zlib, git-tmp, llvm-stage2, clang-stage2, lld-stage2, musl, compiler-rt, libcxx, linux-headers }:

derivation {
  name = "llvm-17.0.6";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://github.com/llvm/llvm-project/releases/download/llvmorg-17.0.6/llvm-project-17.0.6.src.tar.xz;
    sha256 = "04q8pkc1lwygf65r6h43amb9k56r09ng9nqjydj70qp6c2683a2q";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  make = make-tmp;
  cmake = cmake-tmp;
  python3 = python3-tmp;
  zlib = zlib;
  git = git-tmp;
  llvm = llvm-stage2;
  clang = clang-stage2;
  lld = lld-stage2;
  musl = musl;
  compilerRt = compiler-rt;
  libcxx = libcxx;
  linuxHeaders = linux-headers;
}
