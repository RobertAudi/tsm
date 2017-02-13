function __tsm::commands::remove() {
  local session_name="$1"
  if [[ -z "$session_name" ]]; then
    __tsm::utils::log error "Missing session name"
    __tsm::commands::help::remove
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

  if [[ ! -r "$session_file" || ! -w "$session_file" ]]; then
    __tsm::utils::log error "Inaccessible session file: $(__tsm::utils::colorize bold,white "$session_file")"
    return 1
  fi

  __tsm::utils::log warn "The session named $(__tsm::utils::colorize bold,white "${session_name:r}") will be removed."
  __tsm::utils::log warn "This action cannot be undone."
  if __tsm::utils::ask::confirmation "Are you sure you want to proceed?"; then
    command rm "$session_file"
  else
    __tsm::utils::log error "The session named $(__tsm::utils::colorize bold,white "${session_name:r}") was not removed."
    return 1
  fi
}
