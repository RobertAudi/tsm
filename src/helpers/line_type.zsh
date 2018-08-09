# ------------------------------------------------------------------------------
# When dumping windows and panes, the line type is prepended to each line
# These functions help identify the type of a line

function __tsm::helpers::is_line_type() {
  local line_type="$1" line="$2"
  [[ "$line" =~ "^$line_type" ]]
}

function __tsm::helpers::is_line_type::pane() {
  __tsm::helpers::is_line_type "pane" "$1"
}

function __tsm::helpers::is_line_type::window() {
  __tsm::helpers::is_line_type "window" "$1"
}

# ------------------------------------------------------------------------------
