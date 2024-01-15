{ busybox-bin, make-tmp, llvm-stage2, clang-stage2, lld-stage2 }:

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
  make = make-tmp;
  llvm = llvm-stage2;
  clang = clang-stage2;
  lld = lld-stage2;
}
