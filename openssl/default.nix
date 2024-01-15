{ busybox, make, llvm, clang, lld, perl }:

derivation {
  name = "openssl-3.2.0";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://www.openssl.org/source/openssl-3.2.0.tar.gz;
    sha256 = "03k9nhz1igzi5hm9ck2bhj25dffs4ngglsawzc33fhvygkq2dj0l";
  };
  __contentAddressed = true;

  inherit busybox make llvm clang lld perl;
}
