function tkt
  # Use 'set -l' to create a variable local to this function
  set -l TICKET (git rev-parse --abbrev-ref HEAD | grep -o -E "\S-\d+" | head -n 1)

  # Check if a ticket ID was found before trying to open it
  if test -n "$TICKET"
    open "https://linear.app/joinzoe/issue/$TICKET"
  else
    echo "No ticket ID found in branch name." >&2
  end
end
