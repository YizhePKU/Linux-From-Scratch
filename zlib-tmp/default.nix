{ busybox-bin, gcc-musl-bin, make-tmp }:

derivation {
  name = "zlib-1.3";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://www.zlib.net/zlib-1.3.tar.xz;
    sha256 = "0s1amwva0ckfyj7ibx6fcfvl2ih29mccwrwpxyiv2w1rjnpgib15";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  gcc = gcc-musl-bin;
  make = make-tmp;
}

