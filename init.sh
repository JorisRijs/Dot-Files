#! /bin/bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# overwrite of the existing symlinks of necessary
ln -sf ~/Dot-Files/.bashrc ~/.bashrc
ln -sf ~/Dot-Files/.vimrc ~/.vimrc
ln -sf ~/Dot-Files/.tmux.conf ~/.tmux.conf
ln -sf ~/Dot-Files/.zshrc ~/.zshrc


# application of the new dot files
source ~/.bashrc
source ~/.vimrc
source ~/.zshrc
source ~/.tmux.conf


