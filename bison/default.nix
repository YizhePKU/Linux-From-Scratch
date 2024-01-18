{ llvm-toolchain, busybox, make, m4 }:

derivation {
  name = "bison-3.8.2";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://ftp.gnu.org/gnu/bison/bison-3.8.2.tar.xz;
    sha256 = "1wjvbbzrr16k1jlby3l436an3kvv492h08arbnf0gwgprha05flv";
  };
  __contentAddressed = true;

  toolchain = llvm-toolchain;
  inherit busybox make m4;
}

