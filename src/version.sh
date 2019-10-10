version::code() {
   cd "$XPT_HOME"
   local -r git_info=$(git log -n 1 --pretty=format:'%h%n%ad%n%s' --date=format:'%Y-%m-%d %Hh%M')
   if [ -z "$git_info" ]; then
      return 1
   else
      echo -e "$git_info"
   fi
}

handler::version() {
   local -r full="${1:-false}"

   echo "${VERSION:-unknown}"

   if $full; then
      source "${XPT_HOME}/src/version.sh"
      version::code 2>/dev/null \
         || die "unknown code"
   fi
}