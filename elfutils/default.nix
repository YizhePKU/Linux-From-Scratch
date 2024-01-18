{ llvm-toolchain, busybox, make, m4, zlib, argp, fts, obstack }:

derivation {
  name = "elfutils-0.189";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://sourceware.org/ftp/elfutils/0.189/elfutils-0.189.tar.bz2;
    sha256 = "1j08hwab8yc1im3mg2jpd47njvnwxnh13zy3mga7qawf6cd8zg9r";
  };
  __contentAddressed = true;

  toolchain = llvm-toolchain;
  inherit busybox make m4 zlib argp fts obstack;
}

