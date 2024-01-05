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
    gnumake = callPackage ./gnumake { };
    perl = callPackage ./perl { };
    tree = callPackage ./tree { };

    # LFS packages
  };
in
pkgs
