# Ask Yes/No question
function __tsm::ask() {
  local question answer
  question="$(sed -e 's/\\\??[[:space:]]*$//' <<< "$1")"
  : ${question:=Are you sure}
  builtin read -qs "?${question} [y/n] "
  # ???: This should probably be removed...
  answer=$status ; builtin print ; return $answer
}
