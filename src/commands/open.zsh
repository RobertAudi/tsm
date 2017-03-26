# Restore a session and attach to one
# Alias of: __tsm::commands::resume
function __tsm::commands::open() {
  __tsm::commands::resume "$@"
}
