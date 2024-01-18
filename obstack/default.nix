{ llvm-toolchain, busybox }:

derivation {
  name = "obstack-1.2.3";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://github.com/void-linux/musl-obstack/archive/refs/tags/v1.2.3.tar.gz;
    sha256 = "15cklq1xn8j6fj4w47j61fz1v5n34cbyb024p871gw2xn5wk9ywz";
  };
  __contentAddressed = true;

  toolchain = llvm-toolchain;
  inherit busybox;
}
