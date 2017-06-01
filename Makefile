.PHONY: all install-vim-settings install-config

all: install-vim-settings install-config install-tools

install-vim-settings:
	mkdir -p ~/.vim
	ln -fs ~/.dotfiles/vimrc ~/.vimrc
	vim +PluginInstall +qall
	./compile_ycm.sh

install-config:
	ln -fs ~/.dotfiles/bashrc ~/.bashrc
	ln -fs ~/.dotfiles/screenrc ~/.screenrc
	ln -fs ~/.dotfiles/pdbrc ~/.pdbrc
	ln -fs ~/.dotfiles/pythonrc.py ~/.pythonrc.py
	ln -fs ~/.dotfiles/git-completion.bash ~/.git-completion.bash
	ln -fs ~/.dotfiles/remotecopyrc ~/.remotecopyrc
	ln -fs ~/.dotfiles/gitconfig ~/.gitconfig
	ln -fs ~/.dotfiles/tmux.conf ~/.tmux.conf
	ln -fs ~/.dotfiles/pylintrc ~/.pylintrc

install-tools:
	git submodule update --init
	cd package/bashmarks && make install

build-tmux:
	sh ./tmux_local_install.sh
build-vim:
	sh ./install_vim.sh
