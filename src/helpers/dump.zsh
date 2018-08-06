# Dump the list of tmux windows using the following
# three components separated by a tab character `\t`:
# - Session name
# - Window name
# - Window working directory path
#
# Caveat: Window panes are ignored.
function __tsm::helpers::dump() {
  # FIXME: Fail if tmux is not running
  # TODO: Find a way to dump all panes including enough info to be able to restore them
  command tmux list-panes -a -F "${__tsm_tmux_formats[pane]}"
}
