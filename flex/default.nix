{ llvm-toolchain, busybox, make, m4 }:

derivation {
  name = "flex-2.6.4";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz;
    sha256 = "15g9bv236nzi665p9ggqjlfn4dwck5835vf0bbw2cz7h5c1swyp8";
  };
  __contentAddressed = true;

  toolchain = llvm-toolchain;
  inherit busybox make m4;
}

