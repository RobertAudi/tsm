#!/usr/bin/env zsh

emulate -LR zsh
setopt clobber

function {
local __tsm_root="${${(%):-%x}:A:h:h}"
local __tsm_function_filename="tsm.zsh"
local __tsm_function_dir="${__tsm_root}/src/commands"

local __tsm_logo_string="$(builtin print -- "tsm" | figlet -f standard -w60 -c | toilet --gay -f term | sed -e 's/[[:space:]]*$//')"
local __tsm_title_string="$(builtin print -- "Tmux Session Manager" | figlet -f term -w60 -c | toilet --gay -f term | sed -e 's/[[:space:]]*$//')"
local __tsm_subtitle_string="$(builtin print -- "Save and restore the state of tmux sessions and windows." | figlet -f term -w60 -c | toilet --gay -f term | sed -e 's/[[:space:]]*$//')"

{
cat <<EOF
function __tsm::commands::tsm() {
  cat <<"End-of-message"
${__tsm_logo_string}

${__tsm_title_string}
${__tsm_subtitle_string}

End-of-message
}
EOF
} > "${__tsm_function_dir}/${__tsm_function_filename}"
}
