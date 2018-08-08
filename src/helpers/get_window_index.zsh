function __tsm::helpers::get_active_window_index() {
  command tmux list-windows -t "$1" -F "#{window_flags} #{window_index}" \
    | command awk '$1 ~ /\*/ { print $2; }'
}

function __tsm::helpers::get_alternate_window_index() {
  command tmux list-windows -t "$1" -F "#{window_flags} #{window_index}" \
    | command awk '$1 ~ /-/ { print $2; }'
}
