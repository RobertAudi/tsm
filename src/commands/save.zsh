# Save the current session. If a name is not specified
# as the first argument, one will be generated automatically.
# If a session with the same name exists, the user will be
# asked to confirm before override the existing one.
function __tsm::commands::save() {
  local session_dump
  session_dump="$(__tsm::helpers::dump_panes)" || return $status

  local filename="${1:-$(__tsm::utils::filename)}.txt"
  local session_file="${TSM_SESSIONS_DIR}/$filename"

  if [[ -f "$session_file" ]]; then
    __tsm::utils::log warn "A session with the same name already exist: $(__tsm::utils::colorize bold,white "${filename:r}")"
    if __tsm::utils::ask::confirmation "Do you want to override the existing session?"; then
      __tsm::utils::log info "Overriding existing session: $(__tsm::utils::colorize bold,white "${filename:r}")"
      __tsm::commands::backup::session "$session_file"
    else
      __tsm::utils::log error "The current session was not saved"
      return 1
    fi
  fi

  if builtin print -- "$session_dump" >! "$session_file"; then
    __tsm::utils::log success "Session saved as $(__tsm::utils::colorize bold,white "${filename:r}") in $(__tsm::utils::colorize green "$session_file")"
  else
    __tsm::utils::log error "Unable to save the current session"
    return 1
  fi
}
