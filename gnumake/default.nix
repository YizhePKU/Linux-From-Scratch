{ busybox-bin, patchelf-bin, gcc-musl-bin }:

derivation {
  name = "gnumake-4.4.1";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://ftp.gnu.org/gnu/make/make-4.4.1.tar.gz;
    sha256 = "141z25axp7iz11sqci8c312zlmcmfy8bpyjpf0b0gfi8ri3kna7q";
  };

  busybox = busybox-bin;
  patchelf = patchelf-bin;
  gcc = gcc-musl-bin;
}
