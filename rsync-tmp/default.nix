{ busybox-bin, gcc-musl-bin, make-tmp }:

derivation {
  name = "rsync-3.2.7";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://download.samba.org/pub/rsync/src/rsync-3.2.7.tar.gz;
    sha256 = "0prp3dsdqpfw8glpj1fkgjivjr75330jn7bfxqaybd1ky6vzjdjl";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  gcc = gcc-musl-bin;
  make = make-tmp;
}
