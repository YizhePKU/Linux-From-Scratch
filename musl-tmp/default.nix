{ busybox-bin, gcc-musl-bin, make-tmp }:

derivation {
  name = "musl-1.2.4";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://musl.libc.org/releases/musl-1.2.4.tar.gz;
    sha256 = "0mbifyamvs9hrz8dcmmqhsr5q45zmd7v3w3y7fn4i3cq0ciipz2f";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  gcc = gcc-musl-bin;
  make = make-tmp;
}
