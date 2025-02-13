#!/usr/bin/env bash
export PATH="/usr/local/bin:/usr/bin:/bin:/opt/homebrew/bin:$PATH"

echo "[$(date)] PIP script starting. Workspace: $ws" >> /tmp/pip_windows.log

ws=${1:-$AEROSPACE_FOCUSED_WORKSPACE}

IFS=$'\n' all_wins=$(aerospace list-windows --all --format '%{window-id}|%{app-name}|%{window-title}|%{monitor-id}|%{workspace}')
echo "[$(date)] All windows: $all_wins" >> /tmp/pip_windows.log
IFS=$'\n' all_ws=$(aerospace list-workspaces --all --format '%{workspace}|%{monitor-id}')

# Array of possible window titles
pip_titles=("Picture-in-picture" "Picture-in-Picture" "Picture in Picture" "Picture in picture" "Picture in Picture (Firefox)")

# Function to find matching PIP windows
find_pip_windows() {
  local titles=("$@")
  local result=""
  for title in "${titles[@]}"; do
    local matches=$(printf '%s\n' "$all_wins" | rg "$title")
    echo "Searching for title: $title"  # Debugging line
    echo "$matches"                      # Print matches directly
    if [[ -n $matches ]]; then
      result="$result"$'\n'"$matches"
    fi
  done
  echo "$result" | sed '/^s*$/d' # Remove empty lines
}

pip_wins=$(find_pip_windows "${pip_titles[@]}")
target_mon=$(printf '%s\n' "$all_ws" | rg "^$ws" | cut -d'|' -f2 | xargs)

move_win() {
  local win="$1"
  [[ -n $win ]] || return 0

  local win_mon=$(echo "$win" | cut -d'|' -f4 | xargs)
  local win_id=$(echo "$win" | cut -d'|' -f1 | xargs)
  local win_ws=$(echo "$win" | cut -d'|' -f5 | xargs)

  # Skip if already on target monitor/workspace
  [[ $target_mon != "$win_mon" ]] && return 0
  [[ $ws == "$win_ws" ]] && return 0

  # Move to workspace and make floating
  aerospace move-node-to-workspace --window-id "$win_id" "$ws"
  aerospace layout floating --window-id "$win_id"  # New line added
}

# Process each PIP window found
while IFS= read -r win; do
  move_win "$win"
done <<< "$pip_wins"
