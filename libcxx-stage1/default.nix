{ busybox-bin, make-tmp, cmake-tmp, python3-tmp, llvm-stage1, clang-stage1, lld-stage1, musl-stage1, compiler-rt-stage1, linux-headers }:

derivation {
  name = "libc++-17.0.6";
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
  llvm = llvm-stage1;
  clang = clang-stage1;
  lld = lld-stage1;
  musl = musl-stage1;
  compilerRt = compiler-rt-stage1;
  linuxHeaders = linux-headers;
}
