{ llvm-toolchain, busybox, make, perl, openssl, flex, bison, ncurses, elfutils }:

derivation {
  name = "linux-6.6.9";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.6.9.tar.xz;
    sha256 = "1cs8ym3yq9czjx6sbxpmn16l6a577mc4c1ff7nk1p2gw1jpnbg4f";
  };
  __contentAddressed = true;

  # To edit config, run
  # make menuconfig O=$TMPDIR/build LLVM=1 HOSTCC="clang -I$ncurses/include" HOSTLDFLAGS="-L$ncurses/lib"
  config = ./.config;

  toolchain = llvm-toolchain;
  inherit busybox make perl openssl flex bison ncurses elfutils;
}
