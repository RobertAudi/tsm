function __tsm::commands::help() {
  local cmd="$1"
  [[ "$cmd" == "tsm" ]] && { __tsm::commands::tsm ; return $status }
  if [[ -n "$cmd" ]] && (( ${+__tsm_commands[(k)$cmd]} )); then
    __tsm::commands::help::"$@"
  else
    cat <<Help-Message
Usage: tsm <command>

Commands:
$(builtin printf "  %-13s %s\n" "${(kv)__tsm_commands[@]}")
Help-Message
  fi
  return 64
}

function __tsm::commands::help::list() {
  cat <<Help-Message
Usage: tsm list
Help-Message
  return 64
}

function __tsm::commands::help::show() {
  cat <<Help-Message
Usage: tsm show <name>
Help-Message
  return 64
}

function __tsm::commands::help::save() {
  cat <<Help-Message
Usage: tsm save [name]
Help-Message
  return 64
}

function __tsm::commands::help::rename() {
  cat <<Help-Message
Usage: tsm rename <name> [new-name]
Help-Message
  return 64
}

function __tsm::commands::help::copy() {
  cat <<Help-Message
Usage: tsm copy <name> [new-name]
Help-Message
  return 64
}

function __tsm::commands::help::duplicate() {
  cat <<Help-Message
Usage: tsm duplicate <name>
Help-Message
  return 64
}

function __tsm::commands::help::remove() {
  cat <<Help-Message
Usage: tsm remove <name>
Help-Message
  return 64
}

function __tsm::commands::help::restore() {
  cat <<Help-Message
Usage: tsm restore <name>
Help-Message
  return 64
}

function __tsm::commands::help::resume() {
  cat <<Help-Message
Usage: tsm resume <name>
Help-Message
  return 64
}

function __tsm::commands::help::quit() {
  cat <<Help-Message
Usage: tsm quit
Help-Message
  return 64
}

function __tsm::commands::help::version() {
  cat <<Help-Message
Usage: tsm version
Help-Message
  return 64
}

function __tsm::commands::help::help() {
  cat <<Help-Message
Usage: tsm help [command]

Commands:
$(builtin printf "  %-13s %s\n" "${(kv)__tsm_commands[@]}")
Help-Message
  return 64
}
