#!/usr/bin/env bash

BASE_DIR=$(dirname "${BASH_SOURCE[0]:-$0}")
cd "${BASE_DIR}/.." || exit 127

# shellcheck source=../scripts/execs.sh
. scripts/execs.sh
# shellcheck source=../scripts/distro.sh
. scripts/distro.sh
# shellcheck source=../scripts/utils.sh
. scripts/utils.sh

MACOS_1PASSWORD_DIR="/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
LINUX_1PASSWORD_DIR="/opt/1Password/op-ssh-sign"

if [[ "$OSTYPE" == "darwin"* ]]; then
    symlink "$MACOS_1PASSWORD_DIR" "$LINUX_1PASSWORD_DIR"
fi

symlink_dir ~/.dotfiles/1Password/ssh ~/.config/1Password/ssh