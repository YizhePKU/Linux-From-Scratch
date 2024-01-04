let
  callPackage = path: overrides:
    let f = import path;
    in f (builtins.intersectAttrs (builtins.functionArgs f) pkgs // overrides);
  pkgs = {
    busybox = callPackage ./busybox { };
    gcc = callPackage ./gcc-musl { };
    patchelf = callPackage ./patchelf { };
    make = callPackage ./gnumake { };
    tree = callPackage ./tree { };
  };
in
pkgs
