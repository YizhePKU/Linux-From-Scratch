{ busybox }:

derivation {
  name = "gcc-musl-bin";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = ./x86_64-linux-musl-native;

  inherit busybox;
}
