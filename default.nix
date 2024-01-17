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
    python3-tmp = callPackage ./python3-tmp { };
    zlib-tmp = callPackage ./zlib-tmp { };
    git-tmp = callPackage ./git-tmp { };
    rsync-tmp = callPackage ./rsync-tmp { };

    # extract linux headers from source
    linux-headers = callPackage ./linux-headers { };

    # stage1 compiler -- build clang and lld using gcc-bootstrap, linking against gcc-bootstrap and zlib-tmp
    llvm-stage1 = callPackage ./llvm-stage1 { };
    lld-stage1 = callPackage ./lld-stage1 { };
    clang-stage1 = callPackage ./clang-stage1 { };

    # stage1 runtime -- build musl, compiler-rt, libc++ using stage1 compiler, static-linked against libgcc
    musl-stage1 = callPackage ./musl-stage1 { };
    compiler-rt-stage1 = callPackage ./compiler-rt-stage1 { };
    libcxx-stage1 = callPackage ./libcxx-stage1 { };

    # stage1 toolchain
    # llvm-toolchain-stage1 = callPackage ./llvm-toolchain-stage1 { };

    # stage2 runtime -- build musl, compiler-rt, libc++ using stage1 compiler, static-linked against compiler-rt
    # musl = callPackage ./musl { };
    # compiler-rt = callPackage ./compiler-rt { };
    # libcxx = callPackage ./libcxx { };
    # zlib = callPackage ./zlib { };

    # stage2 compiler -- build clang and lld using stage1 compiler, linking against stage2 runtime
    # llvm-stage2 = callPackage ./llvm-stage2 { };
    # clang-stage2 = callPackage ./clang-stage2 { }; # patched to find standard headers and libraries automatically
    # lld-stage2 = callPackage ./lld-stage2 { }; # patched to add RUNPATH automatically

    # # LFS libraries -- build musl, compiler-rt, libc++ using stage2 compiler, static-linked against compiler-rt
    

    # # LFS compiler -- build clang and lld using stage2 compiler, linking against LFS libraries
    # llvm = callPackage ./llvm { };
    # clang = callPackage ./clang { };
    # lld = callPackage ./lld { };

    # # LFS system software
    # make = callPackage ./make { };
    # busybox = callPackage ./busybox { };
    # perl = callPackage ./perl { };
    # openssl = callPackage ./openssl { };
    # cmake = callPackage ./cmake { };
    # curl = callPackage ./curl { };
    # git = callPackage ./git { };
    # ncurses = callPackage ./ncurses { };
    # python3 = callPackage ./python3 { };

    # zlib-test = callPackage ./zlib-test { };
    # llvm-test = callPackage ./llvm-test { };
  };
in
pkgs
