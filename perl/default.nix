{ busybox-bin, patchelf-bin, gcc-musl-bin, gnumake }:

derivation {
  name = "perl-5.38.2";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://www.cpan.org/src/5.0/perl-5.38.2.tar.gz;
    sha256 = "1ddz3rqimsrlhzp786hg0z9yldj2866mckbkkgz0181yasdivwad";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  patchelf = patchelf-bin;
  gcc = gcc-musl-bin;
  gnumake = gnumake;
}

