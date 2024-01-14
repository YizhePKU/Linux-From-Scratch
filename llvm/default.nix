{ busybox-bin, make-tmp, cmake-tmp, python3-tmp, zlib, git-tmp, llvm-stage2, clang-stage2, lld-stage2, musl, compiler-rt, libunwind, libcxx, linux-headers }:

derivation {
  name = "llvm-17.0.6";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://github.com/llvm/llvm-project/releases/download/llvmorg-17.0.6/llvm-project-17.0.6.src.tar.xz;
    sha256 = "1a7rq3rgw5vxm8y39fyzr4kv7w97lli4a0c1qrkchwk8p0n07hgh";
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
  libunwind = libunwind;
  libcxx = libcxx;
  linuxHeaders = linux-headers;
}
