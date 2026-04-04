#!/bin/zsh
# https://github.com/eza-community/eza
if which eza >/dev/null 2>&1; then
    echo "EZA is already installed."
else
    brew install eza
fi
