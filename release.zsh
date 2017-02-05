#!/usr/bin/env zsh

function {
  emulate -LR zsh
  setopt extended_glob clobber

  local __tsm_script_name="tsm"
  local __tsm_root="${${(%):-%x}:A:h}"
  local __tsm_build_dir="${__tsm_root}/build"
  local __tsm_dist_dir="${__tsm_root}/dist"
  local __tsm_build_script="${__tsm_root}/build.zsh"

  if [[ ! -s "${__tsm_build_dir}/${__tsm_script_name}" ]]; then
    "${__tsm_build_script}" || return $status
  fi

  {
    command mkdir "${__tsm_dist_dir}"
    command rm -f "${__tsm_dist_dir}/${__tsm_script_name}"
    command cp "${__tsm_build_dir}/${__tsm_script_name}" "${__tsm_dist_dir}"
  } &>/dev/null
}
