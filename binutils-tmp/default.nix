{ busybox-bin, gcc-musl-bin, make-tmp }:

derivation {
  name = "binutils-2.41";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://sourceware.org/pub/binutils/releases/binutils-2.41.tar.xz;
    sha256 = "0shr30dgkifjzlgqgsf0f0nmb8ffbqrkh93w54bnz4sk4v0s7lgi";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  gcc = gcc-musl-bin;
  make = make-tmp;
}
