#!/usr/bin/env bash

platform::is_osx() {
   [[ $(uname -s) == "Darwin" ]]
}

platform::is_linux() {
   [[ $(uname -s) == "Linux" ]]
}

platform::is_wsl() {
   grep -qE "(Microsoft|WSL)" /proc/version &> /dev/null
}

platform::is_arm() {
   [[ $(uname -a | grep -q "armv" || echo 1) -eq 0 ]]
}

platform::is_x86() {
   [[ $(uname -a | grep -q "x86" || echo 1) -eq 0 ]]
}

platform::is_64bits() {
   [[ $(uname -a | grep -q "x86_64" || echo 1) -eq 0 ]]
}

platform::is_android() {
   [[ $(uname -a | grep -q "Android" || echo 1) -eq 0 ]]
}

platform::is_ami2() {
   local -r txt="$(uname -a)"
   [[ $(echo "$txt" | grep -q "Amazon Linux release 2" || echo "$txt" | grep -q "amzn2" || echo 1) -eq 0 ]]
}

platform::has_stubbed_sudo() {
   sudo --help 2> /dev/null \
      | grep -q "stub"
}

platform::tags() {
   local tags=""
   if platform::is_osx; then tags="${tags}osx "; fi
   if platform::is_linux; then tags="${tags}linux "; fi
   if platform::is_arm; then tags="${tags}arm "; fi
   if platform::is_x86; then tags="${tags}x86 "; fi
   if platform::is_64bits; then tags="${tags}64bits "; fi
   if platform::is_android; then tags="${tags}android "; fi
   if platform::is_wsl; then tags="${tags}wsl "; fi
   echo "$tags"
}

platform::command_exists() {
   local -r cmd="${1:-}"
   [ -n $cmd ] && type "$cmd" &> /dev/null
}

platform::existing_command() {
   local cmd
   for cmd in "$@"; do
      if platform::command_exists "$cmd"; then
         echo "$cmd"
         return 0
      fi
   done
   return 1
}
