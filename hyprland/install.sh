#!/usr/bin/env bash

BASE_DIR=$(dirname "${BASH_SOURCE[0]:-$0}")
cd "${BASE_DIR}/.." || exit 127

# shellcheck source=../scripts/execs.sh
. scripts/execs.sh
# shellcheck source=../scripts/distro.sh
. scripts/distro.sh
# shellcheck source=../scripts/utils.sh
. scripts/utils.sh

ask_for_sudo

symlink "$HOME/.dotfiles/hyprland/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
symlink "$HOME/.dotfiles/hyprland/gamemode.sh" "$HOME/.config/hypr/gamemode.sh"
symlink "$HOME/.dotfiles/hyprland/hyprpaper.conf" "$HOME/.config/hypr/hyprpaper.conf"
symlink "$HOME/.dotfiles/hyprland/macchiato.conf" "$HOME/.config/hypr/macchiato.conf"
