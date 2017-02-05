typeset __tsm_dist_dir="${${(%):-%x}:A:h}/dist"
path=("${__tsm_dist_dir}/"bin $path)
fpath=("${__tsm_dist_dir}/"functions $fpath)
autoload -Uz ${__tsm_dist_dir}/functions/*(.N:t)
unset __tsm_dist_dir
