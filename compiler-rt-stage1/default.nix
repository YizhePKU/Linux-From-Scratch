{ busybox-bin, gcc-musl-bin, make-tmp, cmake-tmp, python3-tmp, llvm-stage1, clang-stage1, lld-stage1, musl-stage1 }:

# Currently, Nix thinks compiler-rt has a runtime dependency on the llvm source.
# This is because compiler-rt uses __FILE__ to report errors.
derivation {
  name = "compiler-rt-17.0.6";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = builtins.fetchurl {
    url = https://github.com/llvm/llvm-project/releases/download/llvmorg-17.0.6/llvm-project-17.0.6.src.tar.xz;
    sha256 = "04q8pkc1lwygf65r6h43amb9k56r09ng9nqjydj70qp6c2683a2q";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  gcc = gcc-musl-bin;
  make = make-tmp;
  cmake = cmake-tmp;
  python3 = python3-tmp;
  llvm = llvm-stage1;
  clang = clang-stage1;
  lld = lld-stage1;
  musl = musl-stage1;
}
