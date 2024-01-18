{ llvm-toolchain, busybox, make }:

derivation {
  name = "m4-1.4.19";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://ftp.gnu.org/gnu/m4/m4-1.4.19.tar.xz;
    sha256 = "15mghcksh11saylpm86h1zkz4in0rbi0pk8i6nqxkdikdmfdxbk3";
  };
  __contentAddressed = true;

  toolchain = llvm-toolchain;
  inherit busybox make;
}

