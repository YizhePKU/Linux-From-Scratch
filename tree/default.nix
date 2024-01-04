{ busybox, gcc, make, patchelf }:

derivation {
  name = "unix-tree-2.1.1";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball https://gitlab.com/OldManProgrammer/unix-tree/-/archive/2.1.1/unix-tree-2.1.1.tar.bz2;

  inherit busybox gcc patchelf make;
}
