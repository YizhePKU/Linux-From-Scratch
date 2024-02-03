{ llvm-toolchain, busybox, make }:

derivation {
  name = "libcap-2.69";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.69.tar.xz;
    sha256 = "1sypj9sdbprir7iwl57p525jkaa3r5z6y7bdav89jinqvbrzh4gk";
  };
  __contentAddressed = true;

  toolchain = llvm-toolchain;
  inherit busybox make;
}
