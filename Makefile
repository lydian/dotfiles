.PHONY: all install-vim-settings install-config

all: install-vim-settings install-config install-tools

install-vim-settings:
	mkdir -p ~/.vim
	ln -fs ~/.dotfiles/vimrc ~/.vimrc
	vim +PluginInstall +qall

install-config:
	ln -fs ~/.dotfiles/bashrc ~/.bashrc
	ln -fs ~/.dotfiles/git-completion.bash ~/.git-completion.bash
	ln -fs ~/.dotfiles/tmux.conf ~/.tmux.conf

install-tools:
	git submodule update --init
	cd package/bashmarks && make install

build-tmux:
	sh ./tmux_local_install.sh
build-vim:
	sh ./install_vim.sh
	cp package/fasd/fasd ~/.local/bin

compile-ycm:
	./compile_ycm.sh
