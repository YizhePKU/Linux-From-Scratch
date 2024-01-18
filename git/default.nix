{ llvm-toolchain, busybox, make, zlib, curl }:

derivation {
  name = "git-2.43.0";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://github.com/git/git/archive/refs/tags/v2.43.0.tar.gz;
    sha256 = "0h10yvncfpzkp39cq19aizcvi3r185vkwxvash0lzmkp3wirj5af";
  };
  __contentAddressed = true;

  toolchain = llvm-toolchain;
  inherit busybox make zlib curl;
}
