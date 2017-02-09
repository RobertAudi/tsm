# ------------------------------------------------------------------------------

function __tsm::main() {
  local cmd="$1"
  [[ "$cmd" == "tsm" ]] && { __tsm::commands::tsm ; return $status }
  if (( ${+__tsm_commands[(r)$cmd]} )); then
    __tsm::commands::"$cmd" "${@:2}"
  else
    __tsm::commands::help
    return 1
  fi
}

# ------------------------------------------------------------------------------
