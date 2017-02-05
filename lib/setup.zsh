# |Setup| {{{
# ------------------------------------------------------------------------------

emulate -LR zsh

zmodload zsh/parameter
zmodload zsh/datetime

setopt extended_glob
setopt typeset_silent
setopt pipe_fail
setopt short_loops
setopt NO_clobber

# -------------------------------------------------------------------------- }}}
