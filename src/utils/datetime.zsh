# Generate a formatted timestamp including milliseconds
function __tsm::utils::datetime() {
  # NOTE: Padding with leading 0s might mess with the
  # ordering at the millisecond level. If that's a prolem
  # then it's definitely not mine. Don't be a PITA.
  builtin printf "%s.%03d" "$(builtin strftime "%Y-%m-%dT%H:%M:%S" $epochtime[1])" "$(($epochtime[2] / 1000000))"
}

# Return the creation time of a file
function __tsm::utils::datetime::ctime() {
  builtin zstat -F "%Y-%m-%dT%H:%M:%S" +ctime "$1"
}
