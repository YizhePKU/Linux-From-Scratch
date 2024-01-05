{ busybox-bin, gcc-musl-bin, make-tmp }:

derivation {
  name = "m4-1.4.19";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://ftp.gnu.org/gnu/m4/m4-1.4.19.tar.xz;
    sha256 = "02xz8gal0fdc4gzjwyiy1557q31xcpg896yc0y6kd8s5jbynvdmf";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  gcc = gcc-musl-bin;
  make = make-tmp;
}

