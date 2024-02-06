{ llvm-toolchain, busybox, python3 }:

derivation {
  name = "meson-1.3.1";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://github.com/mesonbuild/meson/archive/refs/tags/1.3.1.tar.gz;
    sha256 = "1iicq9nxf88sc5pzql4rn65p9079j63ivlw98pmh55l5vcg14k17";
  };
  __contentAddressed = true;

  toolchain = llvm-toolchain;
  inherit busybox python3;
}
