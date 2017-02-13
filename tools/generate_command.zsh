#!/usr/bin/env zsh

emulate -LR zsh
setopt noclobber

function __tsm_tools::trim() {
  local str="$(builtin printf "%s" "${@#"${@%%[![:space:]]*}"}")"
  builtin printf "%s" "${str%"${str##*[![:space:]]}"}"
}

function {
  local __tsm_root="${${(%):-%x}:A:h:h}"
  local __tsm_commands_dir="${__tsm_root}/src/commands"

  local __tsm_command_name="$(__tsm_tools::trim "$1")"
  if [[ -z "$__tsm_command_name" ]]; then
    __tsm_command_name="$(__tsm_tools::trim $(builtin read -e "?Command name: "))"
    if [[ -z "$__tsm_command_name" ]]; then
      builtin print -P -- "[%F{196}ERROR%f] Command name required" >&2
      return 1
    fi
  fi

  local __tsm_command_filename="${__tsm_commands_dir}/${__tsm_command_name:r}.zsh"
  if [[ -f "$__tsm_command_filename" ]]; then
    builtin print -P -- "[%F{196}ERROR%f] Command already exist: %B${__tsm_command_name}%b" >&2
    return 1
  fi

  {
    builtin print -l -- \
      "function __tsm::commands::${__tsm_command_name}() {" \
      "  # TODO" \
      "  __tsm::utils::log error \"Not implemented\"" \
      "  return 1" \
      "}" > "${__tsm_command_filename}"
  } && builtin print -P -- "[%F{034}SUCCESS%f] New command generated: %B${__tsm_command_name}%b in %F{245}${__tsm_command_filename}%f"
} "$@"

unfunction __tsm_tools::trim &>/dev/null
