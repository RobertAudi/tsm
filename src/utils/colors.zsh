# |Colors| {{{
# ------------------------------------------------------------------------------

function __tsm::color() {
  local color="$1" message="${@:2}"
  if (( ${+colors[$color]} )); then
    builtin print -n -- "${colors[$color]}$message"
  else
    builtin print -- "Invalid color: '$color'" >&2
    return 1
  fi
}

function __tsm::colorize() {
  for c ("${(s:,:)1}") __tsm::color "$c"
  builtin print -n -- "${@:2}${colors[reset]}"
}

# -------------------------------------------------------------------------- }}}
