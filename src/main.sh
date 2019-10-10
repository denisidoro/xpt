#!/usr/bin/env bash

if ${xpt_FORCE_GNU:-false} && [ -n "${DOTFILES:-}" ]; then
   source "${DOTFILES}/scripts/core/main.sh"
fi

_import() {
   local -r folder="$1"
   shift
   for ns in $@; do
      source "${XPT_HOME}/src/${folder}/${ns}.sh"
   done   
}

_import lang coll dict misc platform str
_import recipes core
for f in $(find "${XPT_HOME}/src/pkg_managers" -iname '*.sh'); do
   source "$f"
done
_import . install opts package pkg_manager version

handler::help() {
   opts::extract_help "$0"
}

handler::script() {
   "${XPT_HOME}/scripts/${SCRIPT_ARGS[@]}"
}

handler::home() {
   echo "${XPT_HOME}"
}

handler::pkg_manager_operation() {
  local -r operation="$1"
  
  local -r packages="$(dict::get "$OPTIONS" values)"
  local -r pkg_managers="$(dict::get "$OPTIONS" pkg_managers)"

  for pkg_manager in $pkg_managers; do
   if "${pkg_manager}::${operation}" "$packages"; then
      return 0
   fi
  done

   return 1
}

main() {
   local -r entry_point="$(dict::get "$OPTIONS" entry_point)"
   case $entry_point in
      install)
         handler::install
         ;;
      version)
         handler::version false
         ;;
      full-version)
         handler::version true
         ;;
      home)
         handler::home
         ;;
      script)
         handler::script
         ;;
      help)
         handler::help
         ;;
      remove)
         handler::pkg_manager_operation "$entry_point"
         ;;
   esac
}
