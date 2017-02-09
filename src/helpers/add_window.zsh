# Add a new tmux window
# Usage: __tsm::helpers::add_window <session_name> <window_name> <window_working_directory>
function __tsm::helpers::add_window() {
  local session_name="$1" window_name="$2" working_directory="$3"
  command tmux new-window -d -t "$session_name:" -n "$window_name" -c "$working_directory"
}
