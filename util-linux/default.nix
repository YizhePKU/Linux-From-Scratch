{ llvm-toolchain, busybox, make }:

derivation {
  name = "util-linux-2.39.3";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://www.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.3.tar.xz;
    sha256 = "03zdvxky2wnm1f0rc2x45x0da39x66gwbkxlqhyg8j8sipj0arkv";
  };
  __contentAddressed = true;

  toolchain = llvm-toolchain;
  inherit busybox make;
}
