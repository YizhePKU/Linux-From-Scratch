{ busybox, make, llvm, clang, lld, zlib, openssl }:

derivation {
  name = "python-3.12.1";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://www.python.org/ftp/python/3.12.1/Python-3.12.1.tar.xz;
    sha256 = "08gb39cp7s2q4v9igykna6b68cp5jqg5zgg2z5bnc8nddx18zywd";
  };
  __contentAddressed = true;

  inherit busybox make llvm clang lld zlib openssl;
}

