{ busybox-bin, make-tmp, gcc-musl-bin, rsync-tmp }:

derivation {
  name = "linux-headers-6.6.9";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.6.9.tar.xz;
    sha256 = "19lrh13mjh3jmk1qa8dwl9mv6cr02qnj8y8rmk53k9hbrkrgqryw";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  make = make-tmp;
  gcc = gcc-musl-bin;
  rsync = rsync-tmp;
}
