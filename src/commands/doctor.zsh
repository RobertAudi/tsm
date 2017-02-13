# TODO: Refactor. This code is worse than puke.
function __tsm::commands::doctor::legacy() {
  [[ -d "$TSM_LEGACY_SESSIONS_DIR" ]] || return

  local -a legacy_session_files
  legacy_session_files=("${TSM_LEGACY_SESSIONS_DIR}"/*.txt(.NOmf:gu+r:))

  # No legacy session files, no point testing anything else...
  (( ${#legacy_session_files} == 0 )) && return

  __tsm::utils::log warn "Legacy sessions found"

  local -a session_files
  session_files=("${TSM_SESSIONS_DIR}"/*.txt(.NOmf:gu+r:))

  if (( ${#session_files} == 0 )); then
    builtin printf "$(__tsm::utils::colorize blue "%s")" " --> " >&2
    builtin printf "%s\n" "There aren't any saved sessions. You can import the legacy sessions with the following command:" >&2

    builtin printf "$(__tsm::utils::colorize blue "%s")\n" " >>> " >&2
    builtin printf "$(__tsm::utils::colorize blue "%s")" " >>> " >&2
    builtin printf "%*s$(__tsm::utils::colorize dimmed "%s")\n" 2 "" "cp -v ${TSM_LEGACY_SESSIONS_DIR:A}/*.txt ${TSM_SESSIONS_DIR:A}/" >&2
    builtin printf "$(__tsm::utils::colorize blue "%s")\n" " >>> " >&2
  else
    # FIXME: Only show the following output if a `-v|--versbose` flag was passed
    builtin printf "$(__tsm::utils::colorize blue "%s")" " --> " >&2
    builtin printf "%s\n" "You can remove the legacy sessions with the following command:" >&2

    builtin printf "$(__tsm::utils::colorize blue "%s")\n" " >>> " >&2
    builtin printf "$(__tsm::utils::colorize blue "%s")" " >>> " >&2
    builtin printf "%*s$(__tsm::utils::colorize dimmed "%s")\n" 2 "" "rm -v ${TSM_LEGACY_SESSIONS_DIR:A}/*.txt" >&2
    builtin printf "$(__tsm::utils::colorize blue "%s")\n" " >>> " >&2
  fi

  __tsm::utils::separator "-"
  builtin print
}
