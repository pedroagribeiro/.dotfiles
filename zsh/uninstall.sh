#!/usr/bin/env sh

rm -rf ~/.oh-my-zsh

unlink ~/.zshrc

chsh -s "$(command -v bash)"