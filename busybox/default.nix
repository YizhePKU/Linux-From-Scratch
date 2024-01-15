{ busybox-bin, git-tmp, make, llvm, clang, lld }:

derivation {
  name = "busybox-1.36.1";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://busybox.net/downloads/busybox-1.36.1.tar.bz2;
    sha256 = "0573gpj51phcz04sg77iznvcxmf5jnbk9gn3g5r9x02daz4j9k5q";
  };
  __contentAddressed = true;

  patches = [ ./no-hardcode-pwd.patch ];

  merge = ./merge_config.sh;

  busybox = busybox-bin;
  git = git-tmp;
  inherit make llvm clang lld;
}
