# Generate a random filename
function __tsm::utils::filename() {
  builtin print -- "${1:-__tsm__}-$(__tsm::utils::datetime)"
}

