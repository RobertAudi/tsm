# ------------------------------------------------------------------------------

function __tsm::main() {
  local cmd="$1"
  [[ "$cmd" == "tsm" ]] && { __tsm::commands::tsm ; return $status }
  if [[ -n "$cmd" ]] && (( ${+__tsm_commands[$cmd]} )); then
    __tsm::commands::"$cmd" "${@:2}"
  else
    [[ -n "$cmd" ]] && __tsm::utils::log error "Command not found: $(__tsm::utils::colorize bold,white "$cmd")"
    __tsm::commands::help
    return 1
  fi
}

# ------------------------------------------------------------------------------
