#!/usr/bin/env zsh

emulate -LR zsh
setopt clobber

function {
  local __tsm_root="${${(%):-%x}:A:h:h}"
  local __tsm_src_dir="${__tsm_root}/src"
  local __tsm_version_constant_dir="${__tsm_src_dir}/core"
  local __tsm_version_constant_filename="version.zsh"
  local __tsm_version_filename="VERSION.txt"
  local __tsm_version="$(command cat ${__tsm_root}/${__tsm_version_filename})"
  builtin print -l -- "local __tsm_version=\"${__tsm_version}\"" "readonly __tsm_version" > "${__tsm_version_constant_dir}/${__tsm_version_constant_filename}"
}
