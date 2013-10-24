#!/bin/sh
git submodule update --init --recursive 

cd ..
ln -fs .dotfiles/bashrc .bashrc
ln -fs .dotfiles/screenrc .screenrc
ln -fs .dotfiles/tmux.conf .tmux.conf
ln -fs .dotfiles/git-completion.bash .git-completion.bash

# vim setup
ln -fs .dotfiles/vim .vim
ln -fs .dotfiles/vim/vimrc .vimrc
ln -fs .dotfiles/vim/gvimrc .gvimrc


# xmledit
cd .dotfiles/vim/bundle/xmledit/ftplugin/
ln -fs xml.vim html.vim
ln -fs xml.vim xhtml.vim
