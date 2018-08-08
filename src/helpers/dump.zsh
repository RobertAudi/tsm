# Dump the list of tmux panes
function __tsm::helpers::dump_panes() {
  command tmux list-panes -a -F "${__tsm_tmux_formats[pane]}"
}

# Dump the list of tmux panes prefixed with the list type (pane)
function __tsm::helpers::dump_panes::annotated() {
  command tmux list-panes -a -F "pane${__tsm_tmux_delimiter}${__tsm_tmux_formats[pane]}"
}

# Dump the list of tmux windows
function __tsm::helpers::dump_windows() {
  command tmux list-windows -a -F "${__tsm_tmux_formats[window]}"
}

# Dump the list of tmux windows prefixed with the list type (window)
function __tsm::helpers::dump_windows::annotated() {
  command tmux list-windows -a -F "window${__tsm_tmux_delimiter}${__tsm_tmux_formats[window]}"
}
