# Log a message to STDERR.
# Messages are printed to STDERR instead of STDOUT
# so that logging can be silenced without hiding output
# that could be relevent (eg: output from other commands).
function __tsm::utils::log() {
  local prefix
  local level="${(L)1}"
  local level_color="$level"
  local message="${@:2}"

  case "$level" in
    info)    prefix="---"  ;;
    warn)    prefix="/!\\" ;;
    error)   prefix="!!!"  ;;
    fatal)   prefix="!!!"  ;;
    success) prefix="\\o/" ;;
    *)       prefix="-->"
      level="*" message="$@" level_color="dimmed"
      ;;
  esac

  integer -l left_padding=$(( 7 - ${#level} ))
  builtin printf "%s$(__tsm::utils::colorize $level_color "%*s")%-2s" "[" ${#level} "${(U)level}" "]" >&2
  builtin printf "$(__tsm::utils::colorize blue "%-4s")" "${prefix}" >&2
  builtin printf "%s\n" "$message" >&2
}
