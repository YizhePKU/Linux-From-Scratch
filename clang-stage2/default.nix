{ busybox-bin, make-tmp, cmake-tmp, python3-tmp, zlib-tmp, git-tmp, llvm-stage2, clang-stage1, lld-stage1, musl-stage1, compiler-rt-stage1, libcxx-stage1, linux-headers }:

derivation {
  name = "clang-17.0.6";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://github.com/llvm/llvm-project/releases/download/llvmorg-17.0.6/llvm-project-17.0.6.src.tar.xz;
    sha256 = "04q8pkc1lwygf65r6h43amb9k56r09ng9nqjydj70qp6c2683a2q";
  };
  __contentAddressed = true;

  patches = [ ./allow-configure-system-dirs.patch ];

  busybox = busybox-bin;
  make = make-tmp;
  cmake = cmake-tmp;
  python3 = python3-tmp;
  zlib = zlib-tmp;
  git = git-tmp;
  llvm = llvm-stage2;
  clang = clang-stage1;
  lld = lld-stage1;
  musl = musl-stage1;
  compilerRt = compiler-rt-stage1;
  libcxx = libcxx-stage1;
  linuxHeaders = linux-headers;
}
