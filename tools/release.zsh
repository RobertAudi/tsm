#!/usr/bin/env zsh

function {
  emulate -LR zsh
  setopt extended_glob clobber

  local __tsm_script_filename="tsm"
  local __tsm_completion_filename="_${__tsm_script_filename}"
  local __tsm_root="${${(%):-%x}:A:h:h}"
  local __tsm_build_dir="${__tsm_root}/build"
  local __tsm_share_dir="${__tsm_root}/share/zsh"
  local __tsm_dist_dir="${__tsm_root}/dist"
  local __tsm_build_script="${__tsm_root}/tools/build.zsh"
  local __tsm_dist_bin_dir="${__tsm_dist_dir}/bin"
  local __tsm_dist_functions_dir="${__tsm_dist_dir}/functions"

  if [[ ! -f "${__tsm_build_dir}/${__tsm_script_filename}" ]]; then
    "${__tsm_build_script}" || return $status
  fi

  {
    command mkdir -p \
      "${__tsm_dist_dir}" \
      "${__tsm_dist_bin_dir}" \
      "${__tsm_dist_functions_dir}"

    command rm -f \
      "${__tsm_dist_bin_dir}/${__tsm_script_filename}" \
      "${__tsm_dist_functions_dir}/${__tsm_completion_filename}"

    command cp "${__tsm_build_dir}/${__tsm_script_filename}" "${__tsm_dist_bin_dir}/${__tsm_script_filename}"

    if [[ -f "${__tsm_share_dir}/${__tsm_completion_filename}" ]]; then
      command cp "${__tsm_share_dir}/${__tsm_completion_filename}" "${__tsm_dist_functions_dir}/${__tsm_completion_filename}"
    fi

  } &>/dev/null
}
