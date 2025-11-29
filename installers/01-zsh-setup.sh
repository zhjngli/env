#!/bin/sh
# https://ohmyz.sh/
# This check may need to be adjusted if you have a custom install location for ohmyzsh
if [ -d ~/.oh-my-zsh ]; then
    echo "ohmyzsh is already installed."
else
    # run an unattended install of ohmyzsh, and use the `--keep-zshrc` flag if you want to preserve your existing ~/.zshrc
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
    # perform other zsh-related setup....
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
