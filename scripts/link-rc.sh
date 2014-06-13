#!/bin/sh
cd "$(dirname $0)/.."

dir="$(basename $PWD)"
for rc in _*;
  do ln -sf "$dir/$rc" "../.${rc:1}";
done;