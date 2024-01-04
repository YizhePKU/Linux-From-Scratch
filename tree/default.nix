{ busybox-bin, gcc-musl-bin, patchelf-bin, gnumake }:

derivation {
  name = "unix-tree-2.1.1";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://gitlab.com/OldManProgrammer/unix-tree/-/archive/2.1.1/unix-tree-2.1.1.tar.bz2;
    sha256 = "1m3yyvxs445ylhb8cv62izkqa2q2ysi02b9i6bka000ywm2gbz38";
  };

  busybox = busybox-bin;
  gcc = gcc-musl-bin;
  patchelf = patchelf-bin;
  make = gnumake;
}
