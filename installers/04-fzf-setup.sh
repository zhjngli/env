#!/bin/zsh
# https://github.com/junegunn/fzf
if which fzf >/dev/null 2>&1; then
    echo "FZF is already installed."
else
    brew install fzf
    # git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    # ~/.fzf/install
    source <(fzf --zsh)
fi
