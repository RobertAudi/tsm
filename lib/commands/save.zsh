# Save the current session. If a name is not specified
# as the first argument, one will be generated automatically.
# If a session with the same name exists, the user will be
# asked to confirm before override the existing one.
function __tsm::save() {
  local session_dump
  session_dump="$(__tsm::dump)" || return $status

  local filename="${1:-$(__tsm::filename)}.txt"
  local session_file="${TSM_SESSIONS_DIR}/$filename"

  if [[ -f "$session_file" ]]; then
    __tsm::log warn "A session with the same name already exist: $(__tsm::colorize bold,white "${filename:r}")"
    if __tsm::ask "Do you want to override the existing session?"; then
      __tsm::log info "Overriding existing session: $(__tsm::colorize bold,white "${filename:r}")"
      __tsm::backup::session "$session_file"
    else
      __tsm::log error "The current session was not saved"
      return 1
    fi
  fi

  if builtin print -- "$session_dump" >! "$session_file"; then
    __tsm::log success "Session saved as $(__tsm::colorize bold,white "${filename:r}") in $(__tsm::colorize green "$session_file")"
  else
    __tsm::log error "Unable to save the current session"
    return 1
  fi
}
