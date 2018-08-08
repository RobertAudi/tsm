function __tsm::commands::list() {
  local -a session_files
  session_files=("${TSM_SESSIONS_DIR}"/*.txt(.NOmf:gu+r:))
  builtin print -- "$(__tsm::utils::colorize underline "Saved sessions:")\n"

  # Get the length of the longest filename
  # Source: Chapter 5, paragraph 1, of the "A Users guide to the Z-Shell"
  #   http://zsh.sourceforge.net/Guide/zshguide05.html
  integer -l padding
  padding=$(( ${#${session_files[(r)${(l.${#${(O@)session_files//?/X}[1]}..?.)}]}:t:r} + 2 ))

  integer -l sessions_count windows_count
  local -A session_registry

  for f in $session_files; do
    while IFS=$__tsm_tmux_delimiter read session_name window_name dir; do
      windows_count+=1
      if ! (( ${+session_registry[$session_name]} )); then
        session_registry[$session_name]=$((session_registry[$session_name] + 1))
        sessions_count+=1
      fi
    done < "$f"

    builtin printf "$(__tsm::utils::colorize bold,white "%-*s")" $padding "${f:t:r}"
    builtin printf "($(__tsm::utils::colorize blue "%-2.0d") sessions and $(__tsm::utils::colorize blue "%3.0d") windows)" "$sessions_count" "$windows_count"
    builtin print -- ": $(__tsm::utils::colorize dimmed "$f")"

    windows_count=0 sessions_count=0 session_registry=()
  done

  builtin print -- "\nNumber of saved sessions: $(__tsm::utils::colorize blue "${#session_files}")"
}
