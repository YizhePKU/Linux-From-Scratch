{ busybox-bin }:

derivation {
  name = "patchelf-bin";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = ./patchelf;
  __contentAddressed = true;

  busybox = busybox-bin;
}
