let
  callPackage = path: overrides:
    let f = import path;
    in f (builtins.intersectAttrs (builtins.functionArgs f) pkgs // overrides);
  pkgs = {
    # host packages
    busybox-bin = callPackage ./busybox-bin { };
    gcc-musl-bin = callPackage ./gcc-musl-bin { };
    patchelf-bin = callPackage ./patchelf-bin { };

    # temporary packages
    make = callPackage ./make { };
    perl = callPackage ./perl { };
    m4 = callPackage ./m4 { };
    bison = callPackage ./bison { };
    tree = callPackage ./tree { };

    # LFS packages
  };
in
pkgs
