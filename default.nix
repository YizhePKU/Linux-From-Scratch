let
  callPackage = path: overrides:
    let f = import path;
    in f (builtins.intersectAttrs (builtins.functionArgs f) pkgs // overrides);
  pkgs = {
    # host packages
    busybox-bin = callPackage ./busybox-bin { };
    gcc-musl-bin = callPackage ./gcc-musl-bin { };

    # temporary packages
    make-tmp = callPackage ./make-tmp { };
    m4-tmp = callPackage ./m4-tmp { };
    binutils-tmp = callPackage ./binutils-tmp { };

    rsync-tmp = callPackage ./rsync-tmp { };
    linux-headers = callPackage ./linux-headers { };

    bison-tmp = callPackage ./bison-tmp { };
    gawk-tmp = callPackage ./gawk-tmp { };
    python3-tmp = callPackage ./python3-tmp { };
    glibc-tmp = callPackage ./glibc-tmp { };

    # LFS packages


    # todo: cleanup
    # patchelf-bin = callPackage ./patchelf-bin { };
    # bison = callPackage ./bison { };
    # perl = callPackage ./perl { };
    # m4 = callPackage ./m4 { };
    # tree = callPackage ./tree { };
  };
in
pkgs
