#!/bin/bash
# Claude Code status line
# Reads the JSON status payload from stdin and prints a formatted status line.
# Layout (left -> right): model | cwd | git branch (+dirty) | context % | cost | duration

input=$(cat)

# ---- colors (these are plain ANSI escapes; if the terminal doesn't support
# color the escape sequences are simply ignored/ineffective, so this degrades
# gracefully) ----
RESET=$'\033[0m'
DIM=$'\033[2m'
CYAN=$'\033[36m'
BLUE=$'\033[34m'
YELLOW=$'\033[33m'
GREEN=$'\033[32m'
RED=$'\033[31m'
MAGENTA=$'\033[35m'
MARGIN="      "
MIN_SIDE=10

strip_ansi() {
  printf '%s' "$1" | sed $'s/\x1b\\[[0-9;]*m//g'
}

# ---- model ----
model=$(printf '%s' "$input" | jq -r '.model.display_name // "Claude"')
model_segment="${CYAN}${model}${RESET}"

# ---- current working directory (shortened with ~) ----
cwd=$(printf '%s' "$input" | jq -r '.workspace.current_dir // .cwd // ""')
dir_display="$cwd"
case "$dir_display" in
  "$HOME"/*) dir_display="~${dir_display#"$HOME"}" ;;
  "$HOME") dir_display="~" ;;
esac
dir_segment=""
[ -n "$dir_display" ] && dir_segment="${DIM}${dir_display}${RESET}"

# ---- git branch + dirty/clean status ----
git_segment=""
if [ -n "$cwd" ]; then
  branch=$(cd "$cwd" 2>/dev/null && git --no-optional-locks rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    if [ -n "$(cd "$cwd" 2>/dev/null && git --no-optional-locks status --porcelain 2>/dev/null)" ]; then
      git_segment="${YELLOW}${branch}${RESET}${DIM} ✗${RESET}"
    else
      git_segment="${GREEN}${branch} ✓${RESET}"
    fi
  fi
fi

# ---- context window usage ----
used_pct=$(printf '%s' "$input" | jq -r '.context_window.used_percentage // empty')
ctx_segment=""
if [ -n "$used_pct" ]; then
  ctx_segment="${BLUE}ctx $(printf '%.0f' "$used_pct")%${RESET}"
fi

# ---- session cost ----
cost=$(printf '%s' "$input" | jq -r '.cost.total_cost_usd // empty')
cost_segment=""
if [ -n "$cost" ]; then
  cost_segment="${MAGENTA}\$$(printf '%.2f' "$cost")${RESET}"
fi

# ---- session elapsed time ----
duration_ms=$(printf '%s' "$input" | jq -r '.cost.total_duration_ms // empty')
dur_segment=""
if [ -n "$duration_ms" ]; then
  total_seconds=$(( duration_ms / 1000 ))
  h=$(( total_seconds / 3600 ))
  m=$(( (total_seconds % 3600) / 60 ))
  s=$(( total_seconds % 60 ))
  if [ "$h" -gt 0 ]; then
    dur_fmt=$(printf '%dh%02dm' "$h" "$m")
  elif [ "$m" -gt 0 ]; then
    dur_fmt=$(printf '%dm%02ds' "$m" "$s")
  else
    dur_fmt=$(printf '%ds' "$s")
  fi
  dur_segment="${DIM}${dur_fmt}${RESET}"
fi

# ---- assemble segments with generous separators ----
parts=()
parts+=("$model_segment")
[ -n "$dir_segment" ] && parts+=("$dir_segment")
[ -n "$git_segment" ] && parts+=("$git_segment")
[ -n "$ctx_segment" ] && parts+=("$ctx_segment")
[ -n "$cost_segment" ] && parts+=("$cost_segment")
[ -n "$dur_segment" ] && parts+=("$dur_segment")

# ---- figure out terminal width so segments can be spread across the
# whole status line instead of bunching up on the left ----
cols=$(tput cols 2>/dev/null </dev/tty)
[ -z "$cols" ] && cols=$(tput cols 2>/dev/null)
[ -z "$cols" ] && cols=100

num=${#parts[@]}
gaps=$(( num - 1 ))

total_len=0
plain=()
for i in "${!parts[@]}"; do
  plain[$i]=$(strip_ansi "${parts[$i]}")
  total_len=$(( total_len + ${#plain[$i]} ))
done

margin_len=${#MARGIN}

# each gap gets at least MIN_SIDE spaces on either side of the "│"; if the
# terminal is wider than the content needs, the extra room is split evenly
# across all gaps so segments spread across the full width instead of
# collapsing to the floor
min_gap=$(( MIN_SIDE * 2 ))
pad_each=$min_gap
remainder=0
if [ "$gaps" -gt 0 ]; then
  avail=$(( cols - margin_len - total_len - gaps ))
  min_avail=$(( gaps * min_gap ))
  if [ "$avail" -gt "$min_avail" ]; then
    pad_each=$(( avail / gaps ))
    remainder=$(( avail % gaps ))
  fi
fi

build_sep() {
  local total=$1
  local left=$(( total / 2 ))
  local right=$(( total - left ))
  printf '%*s' "$left" ''
  printf '%s' "${DIM}│${RESET}"
  printf '%*s' "$right" ''
}

out="${parts[0]}"
for (( i=1; i<num; i++ )); do
  gap_index=$(( i - 1 ))
  pad_total=$pad_each
  [ "$gap_index" -lt "$remainder" ] && pad_total=$(( pad_total + 1 ))
  sep=$(build_sep "$pad_total")
  out="${out}${sep}${parts[$i]}"
done

printf '%s%s\n' "$MARGIN" "$out"
