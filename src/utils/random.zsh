# Generate n (default: 1) random strings of c (default: 8) alphanumeric characters. Example:
# => n5E8smo0
function __tsm::utils::random() {
  local -A opts
  zparseopts -D -A opts -- c: n:

  integer -l chars
  if [[ "${opts[-c]}" = <-> && "${opts[-c]}" -gt 0 ]]; then
    chars="${opts[-c]}"
  else
    chars=8
  fi

  integer -l num
  if [[ "${opts[-n]}" = <-> && "${opts[-n]}" -gt 0 ]]; then
    num="${opts[-n]}"
  else
    num=1
  fi

  command cat /dev/urandom | command base64 | command tr -dc 'a-zA-Z0-9' \
    | command fold -w $chars | command head -n $num
}
