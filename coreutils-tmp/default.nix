{ busybox-bin, gcc-musl-bin, make-tmp }:

derivation {
  name = "coreutils-9.4";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://ftp.gnu.org/gnu/coreutils/coreutils-9.4.tar.xz;
    sha256 = "013xx0qvc20d286gfyiibqgjdlpsidyxvaq4dd4lmzvihmwd15fb";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  gcc = gcc-musl-bin;
  make = make-tmp;
}
