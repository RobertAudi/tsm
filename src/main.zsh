# ------------------------------------------------------------------------------

function __tsm::main() {
  local cmd="$1"
  if (( ${+__tsm_commands[(r)$cmd]} )); then
    __tsm::"$cmd" "${@:2}"
  else
    builtin print -- "valid commands: ${(j:, :)__tsm_commands}" >&2
    return 1
  fi
}

# ------------------------------------------------------------------------------
