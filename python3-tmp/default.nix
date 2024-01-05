{ busybox-bin, gcc-musl-bin, make-tmp }:

derivation {
  name = "python-3.12.1";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://www.python.org/ftp/python/3.12.1/Python-3.12.1.tar.xz;
    sha256 = "0fnfd22dl71rzaphdimpqhb3gqd0nq589sqhv617hw02i32y6240";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  gcc = gcc-musl-bin;
  make = make-tmp;
}

