#!/bin/sh
git submodule update --init --recursive 

cd ..
ln -fs ~/.dotfiles/bashrc .bashrc
ln -fs ~/.dotfiles/screenrc .screenrc
ln -fs ~/.dotfiles/tmux.conf .tmux.conf
ln -fs ~/.dotfiles/git-completion.bash .git-completion.bash
ln -fs ~/.dotfiles/remotecopyrc .remotecopyrc
ln -fs ~/.dotfiles/ssh-config .ssh/config
