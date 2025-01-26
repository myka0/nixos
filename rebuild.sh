#!/bin/bash

set -e
pushd ~/nixos/

nvim
git diff -U0 *.nix

echo "NixOS Rebuilding..."
sudo nixos-rebuild switch --flake ~/nixos/#default &>nixos-switch.log || (
  cat nixos-switch.log | grep --color error && false
)

current_gen=$(nixos-rebuild list-generations | grep current)
gen_number=$(echo "$current_gen" | awk '{print $1}')
gen_date=$(echo "$current_gen" | awk '{print $3}')
nixos_version=$(echo "$current_gen" | awk '{print $5}')
kernel_version=$(echo "$current_gen" | awk '{print $6}')

commit_message="Generation $gen_number ($nixos_version), kernel $kernel_version - $gen_date"

alejandra . &>/dev/null
git commit -am "$commit_message"
git push

popd
