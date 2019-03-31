# Restore a session and attach to one
# Alias of: __tsm::commands::resume
function __tsm::commands::open() {
  __tsm::utils::log warn \
    "The $(__tsm::utils::colorize warn "open") command" \
    "is $(__tsm::utils::colorize bold,underline "DEPRECATED")," \
    "use the $(__tsm::utils::colorize info "reusme") command instead."
  __tsm::commands::resume "$@"
}
