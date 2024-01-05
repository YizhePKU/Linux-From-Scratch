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
    coreutils-tmp = callPackage ./coreutils-tmp { };
    binutils-tmp = callPackage ./binutils-tmp { };

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
