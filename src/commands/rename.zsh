# Save the current session. If a name is not specified
# as the first argument, one will be generated automatically.
# If a session with the same name exists, the user will be
# asked to confirm before override the existing one.
function __tsm::rename() {
  local session_name="$1"
  if [[ -z "$session_name" ]]; then
    __tsm::log error "Missing session name"
    __tsm::help::rename
    return 1
  fi

  local session_file
  session_file="$TSM_SESSIONS_DIR/$session_name"
  [[ "${session_file:e}" == "txt" ]] || session_file+=".txt"

  if [[ ! -f "$session_file" ]]; then
    __tsm::log error "Session not found: ${session_name}"
    builtin print
    __tsm::list
    return 1
  fi

  local new_session_name="$(__tsm::trim ${2:-$(__tsm::ask -p "New name:")})"
  if [[ -z "$new_session_name" ]]; then
    __tsm::log error "Missing session name"
    __tsm::help::rename
    return 1
  elif [[ "$new_session_name" == "$session_name" ]]; then
    __tsm::log error "The new session name $(__tsm::colorize bold,white "$new_session_name") is the same as the current one $(__tsm::colorize bold,white "$session_name")"
    __tsm::help::rename
    return 1
  fi

  local new_session_file
  new_session_file="$TSM_SESSIONS_DIR/$new_session_name"
  [[ "${new_session_file:e}" == "txt" ]] || new_session_file+=".txt"

  if [[ -f "$new_session_file" ]]; then
    __tsm::log warn "A session with the same name already exist: $(__tsm::colorize bold,white "${new_session_name:r}")"
    if __tsm::ask::confirmation "Do you want to override the existing session?"; then
      __tsm::backup::session "$new_session_file"
    else
      __tsm::log error "Failed to rename session: $(__tsm::colorize bold,white "$session_name")"
      if [[ ! -r "$session_file" || ! -w "$session_file" ]]; then
        __tsm::log error "Inaccessible session file: $(__tsm::colorize bold,white "$session_file")"
      fi
      return 1
    fi
  fi

  __tsm::log info "Renaming session: $(__tsm::colorize bold,white "$session_name") -> $(__tsm::colorize bold,white "$new_session_name")"
  command mv -f "$session_file" "$new_session_file" >/dev/null
}
