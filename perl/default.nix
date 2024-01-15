{ busybox, make, llvm, clang, lld }:

derivation {
  name = "perl-5.38.2";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://www.cpan.org/src/5.0/perl-5.38.2.tar.gz;
    sha256 = "0pk581zmfqj7wgsh1jlhpj4d8m1sajbs9535glybidqy8ls1b8x0";
  };
  __contentAddressed = true;

  inherit busybox make llvm clang lld;
}

