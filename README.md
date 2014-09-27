# Bash 

Author: Lydian 


## Installation

	cd ~/ 
	git clone git@bitbucket.org:lydian/dotfiles.git 
	cd .dotfiles
	make


## bashrc
* Display branch name when you are inside a git repo
* serveral shortcut for yelp daily programming work

## tmux.conf
* Display label of each screen at the bottom 
* Update the keymap to be exactly the same as screen, i.e., use ^a instead of ^b
* Use <shift> + A to rename screen
* forwarding ssh agent while reconnecting to the session
  (if forwoarding failed, use `refresh_ssh_agent`)

ref: [source|https://github.com/tsung/config/blob/master/shell/tmux.conf]

## remotecopy
* use remotecopy so that I can sync up remote clipboard to local
* I also modified some code so that I can defined a shared password
[ref: http://endot.org/2011/12/04/remotecopy-copy-from-remote-terminals-into-your-local-clipboard/]

## git autocomplete
* auto complete git commands and branch names

ref: [source|https://github.com/git/git/blob/master/contrib/completion/git-completion.bash]

## vim

### PLUGINS
* Plugins are managed by vundle. 

# vim-color-schems: collection of all color schemes. [https://github.com/flazz/vim-colorschemes]
# Ctrl-P: Fuzzy file finder [https://github.com/kien/ctrlp.vim]
# NERDTree: Display directory [https://github.com/scrooloose/nerdtree]
# easymotion: Show shortcut to help you move cursor. [https://github.com/Lokaltog/vim-easymotion]
# tabline: Show tabline in color [https://github.com/mkitt/tabline.vim] 
# taglist: Show ctags list to help you view structure of the code. [https://github.com/vim-scripts/taglist.vim] 
# fugitive: better git support [https://github.com/tpope/vim-fugitive]
# gitgutter: show change on file [https://github.com/airblade/vim-gitgutter]
# neocomplcache: [https://github.com/Shougo/neocomplcache]
# python-mode: almost everything you need to code in python [https://github.com/klen/python-mode]
# pytest.vim [https://github.com/alfredodeza/pytest.vim]
# syntax checking for all language [https://github.com/scrooloose/syntastic]
# pytest: pytest support in vim [https://github.com/alfredodeza/pytest.vim]
# nerdcommenter: quickly toggle comment [https://scrooloose/nerdcommenter]
# supertab: autocomplete by click tab [https://ervandew/supertab]
# airline: powerful status bar [https://github.com/bling/vim-airline]
# cmdline-complete: line complete in cmd [https://github.com/vim-scripts/CmdlineComplete]
# rails: [https://github.com/tpope/vim-rails]

Other good references
---------------------

* http://amix.dk/vim/vimrc.html
* http://spf13.com/post/perfect-vimrc-vim-config-file
