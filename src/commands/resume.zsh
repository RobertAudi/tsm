# Restore a session and attach to one
# TODO: Specify which tmux session to attach to
function __tsm::commands::resume() {
  __tsm::commands::restore "$@" && { __tsm::utils::inside_tmux || command tmux attach }
}
