{ busybox-bin, llvm-toolchain-stage1, make-tmp }:

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
  toolchain = llvm-toolchain-stage1;
  make = make-tmp;
}
