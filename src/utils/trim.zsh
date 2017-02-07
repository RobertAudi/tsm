function __tsm::trim() {
  local -A opts
  zparseopts -D -A opts -- l t b
  if (( ${+opts[b]} )) || ! (( ${#opts} )); then
    __tsm::trim::both "$@"
  else
    local string="$@"
    if (( ${+opts[l]} )); then
      string="$(__tsm::trim::leading "$@")"
    fi
    if (( ${+opts[t]} )); then
      string="$(__tsm::trim::trailing "$@")"
    fi
    builtin printf "%s" "$string"
  fi
}

function __tsm::trim::leading() {
  builtin printf "%s" "${@#"${@%%[![:space:]]*}"}"
}

function __tsm::trim::trailing() {
  builtin printf "%s" "${@%"${@##*[![:space:]]}"}"
}

function __tsm::trim::both() {
  __tsm::trim::trailing "$(__tsm::trim::leading "$@")"
}
