# Create a new tmux session.
# A dummy window is created so that the working
# directory of new windows will default to "$HOME".
# Without the dummy window, the default working directory
# of new windows would be the one of the first window created.
function __tsm::helpers::new_session() {
  local session_name="$1" window_name="$2" window_working_directory="$3"
  local dimensions="${4:-$(__tsm::utils::dimensions_parameters)}"
  local session_working_directory dummy_window dummy_window_index
  session_working_directory="$HOME"
  dummy_window="__dummy-window-${EPOCHREALTIME/./}-$(__tsm::utils::random)__"

  command tmux new-session -d -s "$session_name" -n "$dummy_window" -c "$HOME" $=dimensions
  dummy_window_index="$(command tmux list-windows -t "$session_name" | command grep "$dummy_window" | command cut -d: -f1)"

  __tsm::helpers::add_window "$session_name" "$window_name" "$window_working_directory"

  command tmux kill-window -t "${session_name}:${dummy_window_index}"
}

