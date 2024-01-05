{ busybox-bin }:

derivation {
  name = "gcc-musl-bin";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = ./x86_64-linux-musl-native;
  __contentAddressed = true;

  busybox = busybox-bin;
}
