#!/usr/bin/env bash

BASE_DIR=$(dirname "${BASH_SOURCE[0]:-$0}")
cd "${BASE_DIR}/.." || exit 127

# shellcheck source=../scripts/execs.sh
. scripts/execs.sh
# shellcheck source=../scripts/distro.sh
. scripts/distro.sh
# shellcheck source=../scripts/utils.sh
. scripts/utils.sh

symlink ~/.dotfiles/gnome/gtkrc-2.0 ~/.gtkrc-2.0

symlink_dir ~/.dotfiles/gnome/gtk-3.0 ~/.config/gtk-3.0

symlink_dir ~/.dotfiles/gnome/gtk-4.0 ~/.config/gtk-4.0