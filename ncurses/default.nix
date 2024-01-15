{ busybox, make, llvm, clang, lld }:

derivation {
  name = "ncurses-6.4";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://invisible-mirror.net/archives/ncurses/ncurses-6.4.tar.gz;
    sha256 = "0nc14knjp080h6n06dpwnhmn68azqz290qhbydrm0z68k8yjhcb9";
  };
  __contentAddressed = true;

  inherit busybox make llvm clang lld;
}
