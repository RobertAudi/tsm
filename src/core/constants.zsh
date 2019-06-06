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
  list            "List saved sessions"
  show            "Show details about a session"
  save            "Save the current session"
  remove          "Remove a saved session"
  rename          "Rename a saved session"
  copy            "Copy a saved session"
  restore         "Restore a saved session"
  resume          "Restore and attach a saved session"
  quit            "Quit tmux"
  version         "Show version"
  help            "Show usage information"
)
readonly -l __tsm_commands

local __tsm_tmux_delimiter
__tsm_tmux_delimiter=$'\t'
readonly __tsm_tmux_delimiter

local -A __tsm_tmux_formats
__tsm_tmux_formats=(
  pane             "#{session_name}${__tsm_tmux_delimiter}#{window_name}${__tsm_tmux_delimiter}#{pane_current_path}"
  window           "#{session_name}${__tsm_tmux_delimiter}#{window_index}${__tsm_tmux_delimiter}#{window_active}:#{window_flags}${__tsm_tmux_delimiter}#{window_layout}"
  grouped_sessions "#{session_grouped}${__tsm_tmux_delimiter}#{session_group}${__tsm_tmux_delimiter}#{session_id}${__tsm_tmux_delimiter}#{session_name}"
  state            "#{client_session}${__tsm_tmux_delimiter}#{client_last_session}"
)
readonly -l __tsm_tmux_formats

# -------------------------------------------------------------------------- }}}
