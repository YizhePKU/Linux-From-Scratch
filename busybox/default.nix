{ busybox-bin, git-tmp, make, llvm, clang, lld }:

derivation {
  name = "busybox-1.36.1";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://busybox.net/downloads/busybox-1.36.1.tar.bz2;
    sha256 = "0mq4phxqm8qshsnv5k651fjmrq51xxfsx4c8169w0rja1h6xjxlc";
  };
  __contentAddressed = true;

  patches = [ ./no-hardcode-pwd.patch ];

  merge = ./merge_config.sh;

  busybox = busybox-bin;
  git = git-tmp;
  inherit make llvm clang lld;
}
