# Check if tmux is running AND active
# (ie: we are inside a tmux session)
function __tsm::helpers::inside_tmux() {
  { __tsm::helpers::tmux_running && [[ -n "$TMUX" ]] } || return 1
  local -a tmux_info ; tmux_info=("${(s:,:)TMUX}")
  [[ -S "${tmux_info[1]}" ]] && builtin kill -s 0 "${tmux_info[2]}" &>/dev/null
}
