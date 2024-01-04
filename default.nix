let
  callPackage = path: overrides:
    let f = import path;
    in f (builtins.intersectAttrs (builtins.functionArgs f) pkgs // overrides);
  pkgs = {
    busybox-bin = callPackage ./busybox-bin { };
    gcc-musl-bin = callPackage ./gcc-musl-bin { };
    patchelf-bin = callPackage ./patchelf-bin { };
    gnumake = callPackage ./gnumake { };
    tree = callPackage ./tree { };
  };
in
pkgs
