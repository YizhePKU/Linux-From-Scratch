{ llvm-toolchain, busybox }:

derivation {
  name = "fts-1.2.7";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://github.com/void-linux/musl-fts/archive/refs/tags/v1.2.7.tar.gz;
    sha256 = "19l2yipx4isd4ylrqpljk6vvj53b1nzgwpq47n125ayvjrx5dbj9";
  };
  __contentAddressed = true;

  toolchain = llvm-toolchain;
  inherit busybox;
}
