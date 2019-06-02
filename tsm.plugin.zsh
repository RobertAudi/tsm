typeset -gx TSM_HOME TSM_SESSIONS_DIR TSM_BACKUPS_DIR TSM_DEFAULT_SESSION_FILE TSM_BACKUPS_COUNT

: ${TSM_HOME:=${XDG_DATA_HOME:-$HOME/.local/share}/tsm}
: ${TSM_SESSIONS_DIR:=$TSM_HOME/sessions}
: ${TSM_BACKUPS_DIR:=$TSM_HOME/backups}
: ${TSM_DEFAULT_SESSION_FILE:=$TSM_HOME/default-session.txt}
: ${TSM_BACKUPS_COUNT:=20}

typeset __tsm_dist_dir="${${(%):-%x}:A:h}/dist"
path=("${__tsm_dist_dir}/"bin $path)
fpath=("${__tsm_dist_dir}/"functions $fpath)
autoload -Uz ${__tsm_dist_dir}/functions/*(.N:t)
unset __tsm_dist_dir
