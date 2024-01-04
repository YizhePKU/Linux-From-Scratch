{ busybox }:

derivation {
  name = "patchelf-bin";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = ./patchelf;

  inherit busybox;
}
