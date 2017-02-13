# |Constants| {{{
# ------------------------------------------------------------------------------

local -A colors
colors=(
  info      "$(tput setaf 32)"
  warn      "$(tput setaf 221)"
  error     "$(tput setaf 196)"
  fatal     "$(tput setaf 7; tput setab 196)"
  success   "$(tput setaf 34)"
  white     "$(tput setaf 7)"
  red       "$(tput setaf 1)"
  green     "$(tput setaf 2)"
  blue      "$(tput setaf 4)"
  dimmed    "$(tput setaf 245)"
  bold      "$(tput bold)"
  underline "$(tput smul)"
  reset     "$(tput sgr0)"
)
readonly -l colors

local -A __tsm_commands
__tsm_commands=(
  list        "List saved sessions"
  show        "Show details about a session"
  save        "Save the current session"
  rename      "Rename a saved session"
  restore     "Restore a saved session"
  resume      "Restore and attach a saved session"
  quit        "Quit tmux"
  version     "Show version"
  help        "Show usage information"
)
readonly -l __tsm_commands

# -------------------------------------------------------------------------- }}}
