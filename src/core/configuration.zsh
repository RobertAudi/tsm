# |Configuration| {{{
# ------------------------------------------------------------------------------

: ${TSM_LEGACY_HOME=$HOME/.tmux/tmux-sessions}
: ${TSM_LEGACY_SESSIONS_DIR:=$TSM_LEGACY_HOME/sessions}

: ${TSM_HOME:=${XDG_DATA_HOME:-$HOME/.local/share}/tmux-sessions}
: ${TSM_SESSIONS_DIR:=$TSM_HOME/sessions}
: ${TSM_BACKUPS_DIR:=$TSM_HOME/backups}
: ${TSM_DEFAULT_SESSION_FILE:=$TSM_HOME/default-session.txt}
: ${TSM_BACKUPS_COUNT:=20}

command mkdir -p -m 700 \
  "$TSM_HOME" \
  "$TSM_SESSIONS_DIR" \
  "$TSM_BACKUPS_DIR" &>/dev/null

# -------------------------------------------------------------------------- }}}
