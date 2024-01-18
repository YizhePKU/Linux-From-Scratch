{ busybox-bin, llvm-toolchain }:

derivation {
  name = "gnumake-4.4.1";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://ftp.gnu.org/gnu/make/make-4.4.1.tar.gz;
    sha256 = "1cwgcmwdn7gqn5da2ia91gkyiqs9birr10sy5ykpkaxzcwfzn5nx";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  toolchain = llvm-toolchain;
}
