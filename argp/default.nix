{ llvm-toolchain, busybox }:

derivation {
  name = "argp-1.4.1";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://github.com/ericonr/argp-standalone/archive/refs/tags/1.4.1.tar.gz;
    sha256 = "02wysdbnw6zxhcph0xnxmpdyhvfiqr1nzw8jp18y1p148hvpd7c7";
  };
  __contentAddressed = true;

  toolchain = llvm-toolchain;
  inherit busybox;
}
