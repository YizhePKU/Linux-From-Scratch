{ busybox-bin, llvm-stage1, lld-stage1, clang-stage1, musl-stage1, compiler-rt-stage1, libcxx-stage1, linux-headers }:

derivation {
  name = "llvm-toolchain-17.0.6";
  system = "x86_64-linux";
  builder = ./builder.sh;
  __contentAddressed = true;

  busybox = busybox-bin;
  llvm = llvm-stage1;
  lld = lld-stage1;
  clang = clang-stage1;
  musl = musl-stage1;
  compilerRt = compiler-rt-stage1;
  libcxx = libcxx-stage1;
  linuxHeaders = linux-headers;
}
