{ busybox-bin }:

derivation {
  name = "gcc-musl-bin";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://musl.cc/x86_64-linux-musl-native.tgz;
    sha256 = "1bgkrvdrffn3awbnwslz4p0jmy7f5rzfzmwkp6zvvgf2ygqbc7gb";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
}
