function __tsm::utils::trim() {
  local -A opts
  zparseopts -D -A opts -- l t b
  if (( ${+opts[b]} )) || ! (( ${#opts} )); then
    __tsm::utils::trim::both "$@"
  else
    local string="$@"
    if (( ${+opts[l]} )); then
      string="$(__tsm::utils::trim::leading "$@")"
    fi
    if (( ${+opts[t]} )); then
      string="$(__tsm::utils::trim::trailing "$@")"
    fi
    builtin printf "%s" "$string"
  fi
}

function __tsm::utils::trim::leading() {
  builtin printf "%s" "${@#"${@%%[![:space:]]*}"}"
}

function __tsm::utils::trim::trailing() {
  builtin printf "%s" "${@%"${@##*[![:space:]]}"}"
}

function __tsm::utils::trim::both() {
  __tsm::utils::trim::trailing "$(__tsm::utils::trim::leading "$@")"
}
