# Restore a session and attach to one
# TODO: Specify which tmux session to attach to
function __tsm::resume() {
  __tsm::restore "$@" && { __tsm::inside_tmux || command tmux attach }
}
