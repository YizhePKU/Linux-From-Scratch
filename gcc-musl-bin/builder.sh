#!/bin/sh
set -eu -o pipefail

export PATH="$busybox/bin"

cp -r $src $out