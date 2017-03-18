function __tsm::commands::duplicate() {
  local session_name="$1"
  if [[ -z "$session_name" ]]; then
    __tsm::utils::log error "Missing session name"
    __tsm::commands::help::copy
    return 1
  fi

  local session_file
  session_file="$TSM_SESSIONS_DIR/$session_name"
  [[ "${session_file:e}" == "txt" ]] || session_file+=".txt"

  if [[ ! -f "$session_file" ]]; then
    __tsm::utils::log error "Session not found: ${session_name}"
    builtin print
    __tsm::commands::list
    return 1
  fi

  integer -l index=1
  local new_session_name new_session_file

  while true; do
    new_session_name="${session_name}${index}"
    new_session_file="$TSM_SESSIONS_DIR/${new_session_name}.txt"
    [[ -f "$new_session_file" ]] || break
    (( index++ ))
  done

  __tsm::commands::copy "$session_name" "$new_session_name"
}
