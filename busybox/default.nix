{}:

derivation {
  name = "busybox-bin";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = ./busybox;
}
