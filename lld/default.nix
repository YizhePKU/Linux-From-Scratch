{ busybox-bin, make-tmp, cmake-tmp, python3-tmp, git-tmp, llvm, clang, lld-stage2 }:

derivation {
  name = "lld-17.0.6";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://github.com/llvm/llvm-project/releases/download/llvmorg-17.0.6/llvm-project-17.0.6.src.tar.xz;
    sha256 = "1a7rq3rgw5vxm8y39fyzr4kv7w97lli4a0c1qrkchwk8p0n07hgh";
  };
  __contentAddressed = true;

  patches = [ ./auto-add-rpath.patch ];

  busybox = busybox-bin;
  make = make-tmp;
  cmake = cmake-tmp;
  python3 = python3-tmp;
  git = git-tmp;
  llvm = llvm;
  clang = clang;
  lld = lld-stage2;
}
