#!/bin/sh
set -eu -o pipefail

# mkdir -p $out/bin
/bin/sh -c "exec -a mkdir $src -p $out/bin"

# busybox --install $out/bin
/bin/sh -c "exec -a busybox $src --install -s $out/bin"
