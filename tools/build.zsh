#!/usr/bin/env zsh

function {
  emulate -LR zsh
  setopt extended_glob clobber

  local __tsm_script_filename="tsm"
  local __tsm_root="${${(%):-%x}:A:h:h}"
  local __tsm_src_dir="${__tsm_root}/src"
  local __tsm_build_dir="${__tsm_root}/build"

  command mkdir "${__tsm_build_dir}" &>/dev/null
  builtin print -l -- "${__tsm_src_dir}"/{shebang,logo,setup,{core,utils,helpers,commands}/*,main,tsm}.zsh(.Nf:u+rw:) \
    | command xargs command awk 'FNR==1 && NR > 1 {print ""}{print}' > "${__tsm_build_dir}/${__tsm_script_filename}" \
    && command chmod +x "${__tsm_build_dir}/${__tsm_script_filename}" &>/dev/null
}
