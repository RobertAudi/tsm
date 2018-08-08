# |Restore| {{{
# ------------------------------------------------------------------------------

# Find a resorable session file using the following steps:
#   1. File with name passed as a first argument ($1)
#   2. Last backup session file
#   3. Default session file
# A restorable session file must have the following characteristics:
#   - A size greater than zero
#   - Readable by the current process
function __tsm::commands::restore::restorable_file() {
  local session_file
  if [[ -n "$1" ]]; then
    session_file="$TSM_SESSIONS_DIR/$1"
    [[ "${session_file:e}" == "txt" ]] || session_file+=".txt"

    if [[ ! -f "$session_file" ]]; then
      __tsm::utils::log error "Session not found: ${session_name}"
      builtin print
      __tsm::commands::list
      return 1
    fi

    if [[ -s "$session_file" && -r "$session_file" ]]; then
      builtin print -ln -- "$session_file" ; return
    fi
  fi

  local -a backup_files
  backup_files=($(__tsm::commands::backup::list))
  session_file="${backup_files[-1]}"

  if [[ -s "$session_file" && -r "$session_file" ]]; then
    builtin print -ln -- "$session_file" ; return
  fi

  session_file="$TSM_DEFAULT_SESSION_FILE"
  if [[ -s "$session_file" && -r "$session_file" ]]; then
    builtin print -ln -- "$session_file" ; return
  fi

  __tsm::utils::log error "No session found"
  return 1
}

function __tsm::commands::restore() {
  integer -l sessions_count windows_count
  local session_file dimensions
  session_file="$(__tsm::commands::restore::restorable_file "$1")" || return $status

  command tmux start-server

  dimensions="$(__tsm::utils::dimensions_parameters)"

  while IFS=$__tsm_tmux_delimiter read session_name window_name dir; do
    if [[ -d "$dir" && "$window_name" != "log" && "$window_name" != "man" ]]; then
      if __tsm::helpers::session_exists "$session_name"; then
        __tsm::helpers::add_window "$session_name" "$window_name" "$dir"
      else
        __tsm::helpers::new_session "$session_name" "$window_name" "$dir" "$dimensions"
        sessions_count+=1
      fi
      windows_count+=1
    fi
  done < "$session_file"

  builtin print -- "Restored  $(__tsm::utils::colorize blue "$sessions_count") sessions and $(__tsm::utils::colorize blue "$windows_count") windows"
}

# -------------------------------------------------------------------------- }}}
