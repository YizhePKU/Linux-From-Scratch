{ busybox-bin, make-tmp, llvm-stage2, clang-stage2, lld-stage2, compiler-rt, musl, linux-headers }:

derivation {
  name = "zlib-1.3";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://www.zlib.net/zlib-1.3.tar.xz;
    sha256 = "0s1amwva0ckfyj7ibx6fcfvl2ih29mccwrwpxyiv2w1rjnpgib15";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  make = make-tmp;
  llvm = llvm-stage2;
  clang = clang-stage2;
  lld = lld-stage2;
  compilerRt = compiler-rt;
  musl = musl;
  linuxHeaders = linux-headers;
}

