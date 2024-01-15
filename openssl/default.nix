{ busybox, make, llvm, clang, lld, perl }:

derivation {
  name = "openssl-3.2.0";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://www.openssl.org/source/openssl-3.2.0.tar.gz;
    sha256 = "139b2cpb0na57yvkc9959v4n290p20bw2pfa61v647zjp8i6klh5";
  };
  __contentAddressed = true;

  inherit busybox make llvm clang lld perl;
}
