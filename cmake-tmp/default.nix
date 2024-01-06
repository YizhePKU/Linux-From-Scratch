{ busybox-bin, gcc-musl-bin, make-tmp }:

derivation {
  name = "cmake-3.28.1";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://github.com/Kitware/CMake/releases/download/v3.28.1/cmake-3.28.1.tar.gz;
    sha256 = "028b388d0i2xk0ff8g5dlhggad1aldqzazgyda3dhvrj4gj372ni";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  gcc = gcc-musl-bin;
  make = make-tmp;
}
