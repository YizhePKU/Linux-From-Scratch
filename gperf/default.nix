{ llvm-toolchain, busybox, make }:

derivation {
  name = "gperf-3.1";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://ftp.gnu.org/gnu/gperf/gperf-3.1.tar.gz;
    sha256 = "1qispg6i508rq8pkajh26cznwimbnj06wq9sd85vg95v8nwld1aq";
  };
  __contentAddressed = true;

  toolchain = llvm-toolchain;
  inherit busybox make;
}
