{ busybox-bin, gcc-musl-bin, make-tmp, bison-tmp, gawk-tmp, python3-tmp, linux-headers }:

derivation {
  name = "glibc-2.38";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://ftp.gnu.org/gnu/glibc/glibc-2.38.tar.xz;
    sha256 = "0s0h0p7k3pjmbmxkl0s9ngqghmlj3778piz98akd6kqap8b4myd3";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  gcc = gcc-musl-bin;
  make = make-tmp;
  bison = bison-tmp;
  gawk = gawk-tmp;
  python3 = python3-tmp;
  linux_headers = linux-headers;
}
