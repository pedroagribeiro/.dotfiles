#!/usr/bin/env bash

BASE_DIR=$(dirname "${BASH_SOURCE[0]:-$0}")
cd "${BASE_DIR}/.." || exit 127

# shellcheck source=../scripts/execs.sh
. scripts/execs.sh
# shellcheck source=../scripts/distro.sh
. scripts/distro.sh
# shellcheck source=../scripts/utils.sh
. scripts/utils.sh

LINUX_FONT_DIR="/usr/share/fonts"
MACOS_FONT_DIR="$HOME/Library/Fonts"

FONT_DIRS=($(ls -d $HOME/.dotfiles/fonts/*/))

for directory in "${FONT_DIRS[@]}"
do
    FONT_FOLDER=$(basename ${directory})
    echo $FONT_FOLDER
    if [[ "$OSTYPE" == "darwin"* ]]; then
        FONTS=($(ls $HOME/.dotfiles/fonts/$FONT_FOLDER/ | grep -E '\.(ttf|otf)$'))
        for font in "${FONTS[@]}"
        do
            cp "$HOME/.dotfiles/fonts/$FONT_FOLDER/$font" "$MACOS_FONT_DIR/$font"
        done
    else
        symlink "$HOME/.dotfiles/fonts/$FONT_FOLDER" "$LINUX_FONT_DIR/$FONT_FOLDER"
    fi
done
