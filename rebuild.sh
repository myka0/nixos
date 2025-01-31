#!/bin/bash

set -e
pushd ~/nixos/ > /dev/null

nvim
alejandra . &>/dev/null

git diff -U0 --color=always | gum pager

sudo -v
sudo nixos-rebuild switch --flake ~/nixos/#default &>nixos-switch.log & PID=$! || (
  cat nixos-switch.log | grep --color error && false
)

gum spin -s minidot --title "Rebuilding NixOS..." -- bash -c "
  while kill -0 $PID 2>/dev/null; do
    sleep 1
  done
"

current_gen=$(nixos-rebuild list-generations | grep current)
gen_number=$(echo "$current_gen" | awk '{print $1}')
gen_date=$(echo "$current_gen" | awk '{print $3}')
gen_time=$(echo "$current_gen" | awk '{print $4}')

commit_message="Generation $gen_number $gen_date $gen_time"

git commit -am "$commit_message"
git push

popd > /dev/null
