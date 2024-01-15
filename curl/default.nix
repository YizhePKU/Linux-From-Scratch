{ busybox, make, cmake, llvm, clang, lld, openssl }:

derivation {
  name = "curl-8.5.0";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://curl.se/download/curl-8.5.0.tar.xz;
    sha256 = "09b228hy3w5dls2rcgzz5whnlm501cqqv9rsa9a0sm76m5aaabva";
  };
  __contentAddressed = true;

  inherit busybox make cmake llvm clang lld openssl;
}
