function __tsm::commands::show() {
  local session_input_name="$1"
  if [[ -z "$session_input_name" ]]; then
    __tsm::utils::log error "Missing session name"
    return 1
  fi

  local session_file
  session_file="$TSM_SESSIONS_DIR/$session_input_name"
  [[ "${session_file:e}" == "txt" ]] || session_file+=".txt"

  if [[ ! -f "$session_file" ]]; then
    __tsm::utils::log error "Session not found: $session_input_name"
    builtin print
    __tsm::commands::list
    return 1
  elif [[ ! -r "$session_file" ]]; then
    __tsm::utils::log error "Inaccessible session: $session_input_name"
    return 1
  elif [[ ! -s "$session_file" ]]; then
    __tsm::utils::log error "Invalid session: $session_input_name"
    return 1
  else
    builtin print -- "Saved session: $(__tsm::utils::colorize bold,white "$session_input_name")"
  fi

  integer -l sessions_count windows_count
  local -A session_registry
  while IFS=$__tsm_tmux_delimiter read session_name window_name dir; do
    if (( ${+session_registry[$session_name]} )); then
      session_registry[$session_name]=$((session_registry[$session_name] + 1))
    else
      builtin print
      session_registry[$session_name]=1
      sessions_count+=1
    fi
    windows_count+=1

    builtin print -- "$(__tsm::utils::colorize bold,white "${session_name}:") $window_name $(__tsm::utils::colorize dimmed "$dir")"
  done < "$session_file"

  builtin print -- "\nSummary: $(__tsm::utils::colorize blue "$sessions_count") sessions and $(__tsm::utils::colorize blue "$windows_count") windows"
  for k in "${(@k)session_registry}"; do
    builtin print -- "  - $(__tsm::utils::colorize bold,white "$k"): $(__tsm::utils::colorize blue "${session_registry[$k]}") windows"
  done

  builtin print -- "\nSession file path: $(__tsm::utils::colorize green "$session_file")"
}
