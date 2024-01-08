{ busybox-bin }:

derivation {
  name = "gcc-musl-bin";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://musl.cc/x86_64-linux-musl-native.tgz;
    sha256 = "140gi72svsgs1qp94mh47763iv62qgpv5p0z9jsr10rnb0hc9273";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
}
