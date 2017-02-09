# Ask Yes/No question
function __tsm::utils::ask() {
  local query query_type="prompt"
  local -A opts
  zparseopts -D -A opts -- c p
  if (( ${+opts[c]} )); then
    query_type="confirmation"
  elif (( ${+opts[p]} )); then
    query_type="prompt"
  fi

  query="$(__tsm::utils::trim::trailing "$@")"
  case "$query_type" in
    confirmation) __tsm::utils::ask::confirmation "$query" ;;
    prompt) __tsm::utils::ask::prompt "$query" ;;
    *)
      __tsm::utils::log fatal "Invalid query type: $(__tsm::utils::colorize bold,white "${query_type}")"
      return 1
      ;;
  esac
}

function __tsm::utils::ask::prompt() {
  local prompt="$@"
  : ${prompt:=>}
  builtin read -e "?${prompt} "
}

function __tsm::utils::ask::confirmation() {
  local question="${@%\?}"
  : ${question:=Are you sure}
  builtin read -qs "?${question} [y/n] "
  # ???: This should probably be removed...
  local answer=$status ; builtin print ; return $answer
}
