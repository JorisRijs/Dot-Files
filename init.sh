#! /bin/bash

# get the absolute path of out dotfiles repository
DIR=$(cd `dirname $0` && pwd)`

# overwrite of the existing symlinks of necessary
ln -sf $DIR/.bashrc ~/.bashrc
ln -sf $DIR/.vimrc ~/.vimrc
ln -sf $DIR/.tmux.conf ~/.tmux.conf
ln -sf $DIR/.zshrc ~/.zshrc


# application of the new dot files
. ~/.bashrc
. ~/.vimrc
. ~/.zshrc
. ~/.tmux.conf


