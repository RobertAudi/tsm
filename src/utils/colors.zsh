# |Colors| {{{
# ------------------------------------------------------------------------------

function __tsm::utils::color() {
  local color="$1" message="${@:2}"
  if (( ${+colors[$color]} )); then
    builtin print -n -- "${colors[$color]}$message"
  else
    builtin print -- "Invalid color: '$color'" >&2
    return 1
  fi
}

function __tsm::utils::colorize() {
  for c ("${(s:,:)1}") __tsm::utils::color "$c"
  builtin print -n -- "${@:2}${colors[reset]}"
}

# -------------------------------------------------------------------------- }}}
