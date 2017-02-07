function __tsm::help() {
  local cmd="$1"
  [[ "$cmd" == "tsm" ]] && { __tsm::tsm ; return $status }
  if (( ${+__tsm_commands[(r)$cmd]} )); then
    __tsm::help::"$@"
  else
    cat <<Help-Message
Usage: tsm <command>

Commands:
  list        List saved sessions
  show        Show details about a session
  save        Save the current session
  rename      Rename a saved session
  restore     Restore a saved session
  resume      Restore and attach a saved session
  quit        Quit tmux
  help        Show usage information
Help-Message
  fi
  return 64
}

function __tsm::help::list() {
  cat <<Help-Message
Usage: tsm list
Help-Message
  return 64
}

function __tsm::help::show() {
  cat <<Help-Message
Usage: tsm show <name>
Help-Message
  return 64
}

function __tsm::help::save() {
  cat <<Help-Message
Usage: tsm save [name]
Help-Message
  return 64
}

function __tsm::help::rename() {
  cat <<Help-Message
Usage: tsm rename <name> [new-name]
Help-Message
  return 64
}

function __tsm::help::restore() {
  cat <<Help-Message
Usage: tsm restore <name>
Help-Message
  return 64
}

function __tsm::help::resume() {
  cat <<Help-Message
Usage: tsm resume <name>
Help-Message
  return 64
}

function __tsm::help::quit() {
  cat <<Help-Message
Usage: tsm quit
Help-Message
  return 64
}

function __tsm::help::help() {
  cat <<Help-Message
Usage: tsm help [command]

Commands:
  list        List saved sessions
  show        Show details about a session
  save        Save the current session
  restore     Restore a saved session
  resume      Restore and attach a saved session
  quit        Quit tmux
  help        Show usage information
Help-Message
  return 64
}
