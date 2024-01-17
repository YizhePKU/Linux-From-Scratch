{ busybox-bin, gcc-musl-bin, make-tmp, llvm-stage1, lld-stage1, clang-stage1 }:

derivation {
  name = "musl-1.2.4";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://musl.libc.org/releases/musl-1.2.4.tar.gz;
    sha256 = "0fgh2hhsbaksx7my6yiva4jqixi6hxwxx20ivb0afwjk7piyldbs";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  gcc = gcc-musl-bin;
  make = make-tmp;
  llvm = llvm-stage1;
  lld = lld-stage1;
  clang = clang-stage1;
}
