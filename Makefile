.PHONY: all install-vim-settings install-config

all: install-vim-settings install-config

install-vim-settings:
	mkdir -p ~/.vim
	ln -fs ~/.dotfiles/vimrc ~/.vimrc
	vim +PluginInstall +qall

install-config:
	ln -fs ~/.dotfiles/bashrc ~/.bashrc
	ln -fs ~/.dotfiles/screenrc ~/.screenrc
	ln -fs ~/.dotfiles/tmux.conf ~/.tmux.conf
	ln -fs ~/.dotfiles/git-completion.bash ~/.git-completion.bash
	ln -fs ~/.dotfiles/remotecopyrc ~/.remotecopyrc
	ln -fs ~/.dotfiles/ssh-config ~/.ssh/config
	ln -fs ~/.dotfiles/gitconfig ~/.ssh/.gitconfig

	
