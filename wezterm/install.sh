#!/usr/bin/env bash

BASE_DIR=$(dirname "${BASH_SOURCE[0]:-$0}")
cd "${BASE_DIR}/.." || exit 127

# shellcheck source=../scripts/distro.sh
. ./scripts/distro.sh
# shellcheck source=../scripts/execs.sh
. ./scripts/execs.sh
# shellcheck source=../scripts/utils.sh
. ./scripts/utils.sh

# Install the aerospace package

symlink "$HOME/.dotfiles/wezterm/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"