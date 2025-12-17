#!/usr/bin/env bash
set -euo pipefail
pushd ~/nixos/ >/dev/null

nvim

# Format Nix files
alejandra . &>/dev/null

# Show changes
lazygit

sudo -v

# Update flake
nix flake update &>/dev/null & update_pid=$!
gum spin -s minidot --title "Updating NixOS..." -- \
  bash -c "tail --pid=$update_pid -f /dev/null"

# Rebuild system
sudo nixos-rebuild switch --flake ~/nixos/#default &>nixos-switch.log & rebuild_pid=$!
gum spin -s minidot --title "Rebuilding NixOS..." -- \
  bash -c "tail --pid=$rebuild_pid -f /dev/null"

# Error handling
wait "$rebuild_pid" || {
  grep --color -A 25 'error:' nixos-switch.log
  exit 1
}

# Get generation info
current_gen=$(nixos-rebuild list-generations | awk 'NR>1 && $NF=="True" {print $1, $2, $3}')
read -r gen_number gen_date gen_time <<< "$current_gen"

# Commit changes
commit_message="Generation $gen_number $gen_date $gen_time"
git commit -am "$commit_message"
git push &>/dev/null

popd >/dev/null
