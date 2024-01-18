{ busybox-bin, llvm-toolchain-stage1, make-tmp, musl }:

derivation {
  name = "zlib-1.3";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://www.zlib.net/zlib-1.3.tar.xz;
    sha256 = "19sh61lf93dkdqrm322wm25mir8ig9ib99bbr977f38xis4s56wa";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  toolchain = llvm-toolchain-stage1;
  make = make-tmp;
  inherit musl;
}

