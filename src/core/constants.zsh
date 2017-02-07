# |Constants| {{{
# ------------------------------------------------------------------------------

local -A colors
colors=(
  info    "$(tput setaf 32)"
  warn    "$(tput setaf 221)"
  error   "$(tput setaf 196)"
  success "$(tput setaf 34)"
  white   "$(tput setaf 7)"
  red     "$(tput setaf 1)"
  green   "$(tput setaf 2)"
  blue    "$(tput setaf 4)"
  dimmed  "$(tput setaf 245)"
  bold    "$(tput bold)"
  reset   "$(tput sgr0)"
)
readonly -l colors

local -a __tsm_commands
__tsm_commands=("list" "show" "save" "restore" "resume" "quit" "help")
readonly -l __tsm_commands

# -------------------------------------------------------------------------- }}}
