#!/bin/sh
set -eu -o pipefail

export PATH="$busybox/bin"

mkdir $out && cd $out
tar xf $src --strip-components=1