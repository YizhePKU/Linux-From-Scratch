{ llvm-toolchain, busybox, make }:

derivation {
  name = "runit-2.1.2";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = http://smarden.org/runit/runit-2.1.2.tar.gz;
    sha256 = "065s8w62r6chjjs6m9hapcagy33m75nlnxb69vg0f4ngn061dl3g";
  };
  __contentAddressed = true;

  toolchain = llvm-toolchain;
  inherit busybox make;
}

