# Usage: command1 | and-pipe command2
#
# Pipes command1 to command2 only if command1 succeeds.
# If it doesn't, return its exit code.
# (i.e.: Its actual exit code, not just 1)
#
function __tsm::utils::and_pipe() {
  if [[ -p /dev/stdin ]]; then
    local out=$(</dev/stdin)
    local res=${pipestatus[1]}
    [[ $res == 0 ]] && { printf '%s\n' "$out" | "$@" } || return $res
  else
    "$@"
  fi
}
