function __tsm::commands::copy() {
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

  local new_session_name="$(__tsm::utils::trim ${2:-$(__tsm::utils::ask -p "New name:")})"
  if [[ -z "$new_session_name" ]]; then
    __tsm::utils::log error "Missing session name"
    __tsm::commands::help::copy
    return 1
  elif [[ "$new_session_name" == "$session_name" ]]; then
    __tsm::utils::log error "The new session name $(__tsm::utils::colorize bold,white "$new_session_name") is the same as the current one $(__tsm::utils::colorize bold,white "$session_name")"
    __tsm::commands::help::copy
    return 1
  fi

  local new_session_file
  new_session_file="$TSM_SESSIONS_DIR/$new_session_name"
  [[ "${new_session_file:e}" == "txt" ]] || new_session_file+=".txt"

  if [[ -f "$new_session_file" ]]; then
    __tsm::utils::log warn "A session with the same name already exist: $(__tsm::utils::colorize bold,white "${new_session_name:r}")"
    if __tsm::utils::ask::confirmation "Do you want to override the existing session?"; then
      __tsm::commands::backup::session "$new_session_file"
    else
      __tsm::utils::log error "Failed to copy session: $(__tsm::utils::colorize bold,white "$session_name")"
      if [[ ! -r "$session_file" || ! -w "$session_file" ]]; then
        __tsm::utils::log error "Inaccessible session file: $(__tsm::utils::colorize bold,white "$session_file")"
      fi
      return 1
    fi
  fi

  __tsm::utils::log info "Copying session: $(__tsm::utils::colorize bold,white "$session_name") -> $(__tsm::utils::colorize bold,white "$new_session_name")"
  command cp -f "$session_file" "$new_session_file" >/dev/null
}
