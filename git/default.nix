{ busybox, zlib, make, llvm, clang, lld, curl }:

derivation {
  name = "git-2.43.0";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://github.com/git/git/archive/refs/tags/v2.43.0.tar.gz;
    sha256 = "0dm9gcb17zi5agqhj63lcjk0s1kn3j21h9i98xv88vn2d3syy4vy";
  };
  __contentAddressed = true;

  inherit busybox zlib make llvm clang lld curl;
}

