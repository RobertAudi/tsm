# Check if a tmux session exists.
function __tsm::session_exists() {
  command tmux has-session -t "$1" 2>/dev/null
}
