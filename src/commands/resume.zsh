# Restore a session and attach to one
# Also alias as: __tsm::commands::resume
# TODO: Specify which tmux session to attach to
function __tsm::commands::resume() {
  __tsm::commands::restore "$@" && { __tsm::helpers::inside_tmux || command tmux attach }
}
