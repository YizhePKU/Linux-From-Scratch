let
  callPackage = path: overrides:
    let f = import path;
    in f (builtins.intersectAttrs (builtins.functionArgs f) pkgs // overrides);
  pkgs = {
    # bootstrap packages
    busybox-bin = callPackage ./busybox-bin { };
    gcc-musl-bin = callPackage ./gcc-musl-bin { };

    # temporary packages
    make-tmp = callPackage ./make-tmp { };
    cmake-tmp = callPackage ./cmake-tmp { };

    # m4-tmp = callPackage ./m4-tmp { };
    # binutils-tmp = callPackage ./binutils-tmp { };

    # rsync-tmp = callPackage ./rsync-tmp { };
    # linux-headers = callPackage ./linux-headers { };

    # bison-tmp = callPackage ./bison-tmp { };
    # gawk-tmp = callPackage ./gawk-tmp { };
    # grep-tmp = callPackage ./grep-tmp { };
    # python3-tmp = callPackage ./python3-tmp { };
    # glibc-tmp = callPackage ./glibc-tmp { };

    # gmp-tmp = callPackage ./gmp-tmp { };
    # mpfr-tmp = callPackage ./mpfr-tmp { };
    # mpc-tmp = callPackage ./mpc-tmp { };
    # gcc-tmp = callPackage ./gcc-tmp { };

    # LFS packages


    # todo: cleanup
    # zlib-tmp = callPackage ./zlib-tmp { };
    # coreutils-tmp = callPackage ./coreutils-tmp { };
    # patchelf-bin = callPackage ./patchelf-bin { };
    # perl = callPackage ./perl { };
    # tree = callPackage ./tree { };
  };
in
pkgs
