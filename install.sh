#!/bin/sh
git submodule update --init 

cd ..
ln -fs .dotfiles/bashrc .bashrc
ln -fs .dotfiles/screenrc .screenrc

# vim setup
ln -fs .dotfiles/vim .vim
ln -fs .dotfiles/vim/vimrc .vimrc
ln -fs .dotfiles/vim/gvimrc .gvimrc


# xmledit
cd .dotfiles/vim/bundle/xmledit/ftplugin/
ln -fs xml.vim html.vim
ln -fs xml.vim xhtml.vim
