#!/usr/bin/env bash

BASE_DIR=$(dirname "${BASH_SOURCE[0]:-$0}")
cd "${BASE_DIR}/.." || exit 127

# shellcheck source=../scripts/execs.sh
. scripts/execs.sh
# shellcheck source=../scripts/distro.sh
. scripts/distro.sh
# shellcheck source=../scripts/utils.sh
. scripts/utils.sh


LINUX_CONF_DIR="$HOME/.config/Code/User"
MACOS_CONF_DIR="$HOME/Library/Application\ Support/Code/User"

EXTENSIONS=()

while IFS= read -r line; do
    EXTENSIONS+=("$line")
done < "$HOME/.dotfiles/vscode/extensions.txt"

# for extension in "${EXTENSIONS[@]}"; do
#     code --install-extension $extension
# done

if [[ "$OSTYPE" == "darwin"* ]]; then
    mkdir -p $MACOS_CONF_DIR
    symlink "$HOME/.dotfiles/vscode/settings.json" "$MACOS_CONF_DIR/settings.json"
else
    mkdir -p $LINUX_CONF_DIR
    symlink "$HOME/.dotfiles/vscode/settings.json" "$LINUX_CONF_DIR/settings.json"
fi
