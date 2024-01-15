{ busybox-bin, gcc-musl-bin, make-tmp }:

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
  gcc = gcc-musl-bin;
  make = make-tmp;
}

