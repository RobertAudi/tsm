# |Backup| {{{
# ------------------------------------------------------------------------------

# Delete old backup files and keep the n most recent ones.
# n is $1 or $TSM_BACKUPS_COUNT
# To be safe, the files will be removed only if they are
# readable and writable by the current user.
function __tsm::commands::backup::clean() {
  integer -l count
  local -a files
  files=("${TSM_BACKUPS_DIR}"/*.txt(.NOmf:u+rw:))
  count=${1:-TSM_BACKUPS_COUNT}
  if (( ${#files} > $count )); then
    count=$(( ${#files} - $count ))
    (( $count > 0 )) && command rm ${files[1, $count]}
  fi
}

function __tsm::commands::backup::list() {
  integer -l count
  local -a files
  local -A opts
  zparseopts -D -A opts -- a

  files=("${TSM_BACKUPS_DIR}"/*.txt(.NOmf:u+rw:))
  if (( ${+opts[-a]} )) || (( ${#files} <= $TSM_BACKUPS_COUNT )); then
    count=-1
  else
    count=$TSM_BACKUPS_COUNT
  fi

  builtin print -l -- ${files[1,$count]}
}

function __tsm::commands::backup::session() {
  local session_file="$1"
  if [[ ! -f "$session_file" ]]; then
    __tsm::utils::log error "Session file not found: '${session_file}'"
    return 1
  fi

  local filename="${session_file:A:t:r}.$(__tsm::utils::datetime::ctime "$session_file").$(__tsm::utils::random).txt"
  command cp -f "$session_file" "${TSM_BACKUPS_DIR}/$filename" >/dev/null \
    && __tsm::commands::backup::clean
}

function __tsm::commands::backup() {
  local session_dump
  session_dump="$(__tsm::helpers::dump_panes)" || return $status

  local filename="$(__tsm::utils::filename).$(__tsm::utils::random).txt"
  [[ -n "$1" ]] && filename="${1}.${filename}"

  builtin print -- "$session_dump" > "${TSM_BACKUPS_DIR}/$filename" \
    && __tsm::commands::backup::clean
}

# -------------------------------------------------------------------------- }}}
