{ busybox-bin, gcc-musl-bin, make-tmp, cmake-tmp, python3-tmp }:

# Currently, Nix thinks compiler-rt has a runtime dependency on the llvm source.
# This is because compiler-rt uses __FILE__ to report errors.
derivation {
  name = "compiler-rt-17.0.6";
  system = "x86_64-linux";
  builder = ./builder.sh;
  src = fetchTarball {
    url = https://github.com/llvm/llvm-project/releases/download/llvmorg-17.0.6/llvm-project-17.0.6.src.tar.xz;
    sha256 = "1a7rq3rgw5vxm8y39fyzr4kv7w97lli4a0c1qrkchwk8p0n07hgh";
  };
  __contentAddressed = true;

  busybox = busybox-bin;
  gcc = gcc-musl-bin;
  make = make-tmp;
  cmake = cmake-tmp;
  python3 = python3-tmp;
}