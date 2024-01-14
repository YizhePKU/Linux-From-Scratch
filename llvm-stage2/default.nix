{ busybox-bin, make-tmp, cmake-tmp, python3-tmp, zlib-tmp, git-tmp, llvm-stage1, clang-stage1, lld-stage1, musl-stage1, compiler-rt-stage1, libcxx-stage1, linux-headers }:

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
  zlib = zlib-tmp;
  git = git-tmp;
  llvm = llvm-stage1;
  clang = clang-stage1;
  lld = lld-stage1;
  musl = musl-stage1;
  compilerRt = compiler-rt-stage1;
  libcxx = libcxx-stage1;
  linuxHeaders = linux-headers;
}
