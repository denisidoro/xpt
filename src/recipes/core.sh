#!/usr/bin/env bash

install_from_git() {
   local -r repo="$1"

   local -r package="$(basename "$repo")"
   local -r path="/opt/${package}"

   cd "/opt"
   git clone "$repo" --depth 1
   cd "$repo"

   if [ -f build.sh ]; then
      ./build.sh
   elif [ -f Makefile ]; then
      make install
   fi
}