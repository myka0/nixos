#!/usr/bin/env bash

monitors="$(hyprctl -j monitors)"

clients="$(
  hyprctl -j clients \
  | jq -r '[.[] | select(.workspace.id | contains('"$(echo "$monitors" | jq -r 'map(.activeWorkspace.id) | join(",")')"'))]'
)"

boxes="$(
  echo "$clients" \
  | jq -r '.[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1]) \(.title)"' \
  | cut -f1,2 -d' '
)"

geom="$(slurp -r <<< "$boxes")" || exit 1
out="${1:-$(date +%Y%m%d_%H%M%S)}"
dir="$HOME/Videos"
mkdir -p "$dir"

wf-recorder -g "$geom" -r 60 -c libx264rgb -f "$dir"/"$out".mkv

ffmpeg -i "$dir/$out.mkv" -vf \
"fps=30,split[s0][s1];
 [s0]palettegen=max_colors=72:stats_mode=single[p];
 [s1][p]paletteuse=dither=none" \
-gifflags +transdiff "$dir/$out.gif"

gifsicle -O3 --lossy=50 -o "$dir"/"$out"_opt.gif "$dir"/"$out".gif
