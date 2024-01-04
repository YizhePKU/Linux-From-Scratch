{ busybox, patchelf, gcc }:

derivation {
  name = "gnumake-4.4.1";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball https://ftp.gnu.org/gnu/make/make-4.4.1.tar.gz;

  inherit busybox patchelf gcc;
}
