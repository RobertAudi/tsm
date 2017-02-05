# This function will return width/height parameters
# that will be passed to the `tmux new-session` command
function __tsm::dimensions_parameters() {
  command stty size 2>/dev/null | __tsm::and-pipe \
    command awk '{ printf "-x%d -y%d", $2, $1 }' 2>/dev/null
}
