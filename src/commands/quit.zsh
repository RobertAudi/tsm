# Create a backup of the current tmux session
# and then kill the tmux server
function __tsm::commands::quit() {
  __tsm::commands::backup &>/dev/null
  if command tmux kill-server &>/dev/null; then
    __tsm::utils::log success "tmux session ended"
  else
    __tsm::utils::log error "Failed to quit the tmux session"
    return 1
  fi
}
