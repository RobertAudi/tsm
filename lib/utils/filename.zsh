# Generate a random filename
function __tsm::filename() {
  builtin print -- "${1:-__tsm__}-$(__tsm::datetime)"
}
