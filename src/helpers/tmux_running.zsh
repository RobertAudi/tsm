# Check if the tmux server is running.
# I am not a fan of the approach used
# but it will have to do until I find
# a better way of doing it.
function __tsm::helpers::tmux_running() {
  command tmux info &> /dev/null
}
