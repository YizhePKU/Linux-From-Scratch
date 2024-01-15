{ busybox-bin, gcc-musl-bin, make-tmp }:

derivation {
  name = "cmake-3.28.1";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://github.com/Kitware/CMake/releases/download/v3.28.1/cmake-3.28.1.tar.gz;
    sha256 = "1bbr80sfgs6ybh7nvmpy3dxc97rlfvdab9s0l4hddxs7ws1lzs8m";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  gcc = gcc-musl-bin;
  make = make-tmp;
}
