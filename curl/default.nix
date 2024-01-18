{ llvm-toolchain, busybox, make, cmake, openssl }:

derivation {
  name = "curl-8.5.0";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://curl.se/download/curl-8.5.0.tar.xz;
    sha256 = "1sqfflilf7mcz1g03lazyr6v6pf1rsrzprrknsir10hdwawqvas2";
  };
  __contentAddressed = true;

  toolchain = llvm-toolchain;
  inherit busybox make cmake openssl;
}
