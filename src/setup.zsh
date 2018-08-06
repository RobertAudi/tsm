# |Setup| {{{
# ------------------------------------------------------------------------------

emulate -LR zsh

zmodload zsh/parameter
zmodload zsh/datetime
zmodload -F zsh/stat b:zstat

setopt extended_glob
setopt typeset_silent
setopt pipe_fail
setopt short_loops
setopt NO_clobber

# -------------------------------------------------------------------------- }}}
