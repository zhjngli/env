#!/bin/sh
# https://github.com/VundleVim/Vundle.vim
# This check may need to be adjusted if you have a custom install location for vim
if [ -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Vundle is already installed."
else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    git clone https://github.com/flazz/vim-colorschemes.git ~/.vim/bundle/vim-colorschemes
    # perform other vim-related setup....
    vim +PluginInstall +qall
fi
