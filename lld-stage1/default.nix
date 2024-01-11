{ busybox-bin, gcc-musl-bin, make-tmp, cmake-tmp, python3-tmp, git-tmp, llvm-stage1, clang-stage1 }:

derivation {
  name = "lld-17.0.6";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://github.com/llvm/llvm-project/releases/download/llvmorg-17.0.6/llvm-project-17.0.6.src.tar.xz;
    sha256 = "1a7rq3rgw5vxm8y39fyzr4kv7w97lli4a0c1qrkchwk8p0n07hgh";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  gcc = gcc-musl-bin;
  make = make-tmp;
  cmake = cmake-tmp;
  python3 = python3-tmp;
  git = git-tmp;
  llvm = llvm-stage1;
  clang = clang-stage1;
}
