{ llvm-toolchain, busybox, cmake, make }:

derivation {
  name = "ninja-1.11.1";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://github.com/ninja-build/ninja/archive/refs/tags/v1.11.1.tar.gz;
    sha256 = "1shc83kpzimwvca1q7b9yph1455aqa1nys2273d1wgr16gk7lx1i";
  };
  __contentAddressed = true;

  toolchain = llvm-toolchain;
  inherit busybox cmake make;
}

