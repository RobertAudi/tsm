# Check if a tmux session exists.
function __tsm::helpers::session_exists() {
  command tmux has-session -t "$1" 2>/dev/null
}
