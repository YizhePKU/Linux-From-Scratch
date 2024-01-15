{ busybox-bin, gcc-musl-bin, make-tmp }:

derivation {
  name = "rsync-3.2.7";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://download.samba.org/pub/rsync/src/rsync-3.2.7.tar.gz;
    sha256 = "1fzj8q9w8bgvi3j162rlqymbdx5cgnk29dszik2ph26idqzrszaf";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  gcc = gcc-musl-bin;
  make = make-tmp;
}
