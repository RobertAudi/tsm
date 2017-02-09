# Print a separator across the terminal window
# This is essentially the equivalent of <hr>
# The character used for the ruler can be specified
# as the first argument.
function __tsm::utils::separator() {
  local width="$(tput cols)"
  local sep
  [[ -n "$1" ]] && sep="$1" || sep=$'\u2501'
  builtin print -r -- "${(pl:$width::$sep:)}"
}
