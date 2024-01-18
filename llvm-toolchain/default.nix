{ busybox-bin, llvm, lld, clang, musl, compiler-rt, libcxx, linux-headers }:

derivation {
  name = "llvm-toolchain-17.0.6";
  system = "x86_64-linux";
  builder = ./builder.sh;
  __contentAddressed = true;

  busybox = busybox-bin;
  llvm = llvm;
  lld = lld;
  clang = clang;
  musl = musl;
  compilerRt = compiler-rt;
  libcxx = libcxx;
  linuxHeaders = linux-headers;
}
