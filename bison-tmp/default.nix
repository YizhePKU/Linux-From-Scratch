{ busybox-bin, gcc-musl-bin, make-tmp, m4-tmp }:

derivation {
  name = "bison-3.8.2";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://ftp.gnu.org/gnu/bison/bison-3.8.2.tar.xz;
    sha256 = "0w18vf97c1kddc52ljb2x82rsn9k3mffz3acqybhcjfl2l6apn59";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  gcc = gcc-musl-bin;
  make = make-tmp;
  m4 = m4-tmp;
}

