# Ask Yes/No question
function __tsm::ask() {
  local query query_type="prompt"
  local -A opts
  zparseopts -D -A opts -- c p
  if (( ${+opts[c]} )); then
    query_type="confirmation"
  elif (( ${+opts[p]} )); then
    query_type="prompt"
  fi

  query="$(__tsm::trim::trailing "$@")"
  case "$query_type" in
    confirmation) __tsm::ask::confirmation "$query" ;;
    prompt) __tsm::ask::prompt "$query" ;;
    *)
      __tsm::log fatal "Invalid query type: $(__tsm::colorize bold,white "${query_type}")"
      return 1
      ;;
  esac
}

function __tsm::ask::prompt() {
  local prompt="$@"
  : ${prompt:=>}
  builtin read -e "?${prompt} "
}

function __tsm::ask::confirmation() {
  local question="${@%\?}"
  : ${question:=Are you sure}
  builtin read -qs "?${question} [y/n] "
  # ???: This should probably be removed...
  local answer=$status ; builtin print ; return $answer
}
