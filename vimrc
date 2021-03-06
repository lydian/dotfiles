" Download vundle if not yet installed
let iCanHazVundle=2
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let iCanHazVundle=0
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Remote copy
Plugin 'fcpg/vim-osc52'

"color scheme
Plugin 'flazz/vim-colorschemes'

" File finder
Plugin 'mhinz/vim-startify'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" folding
Plugin 'tmhedberg/SimpylFold'
Plugin 'roalddevries/yaml.vim'


" display tabline in color
Plugin 'mkitt/tabline.vim'
Plugin 'vim-scripts/taglist.vim'

Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-utils/vim-husk'

" Git
"" Provide handy Gxxx git command
Plugin 'tpope/vim-fugitive'
"" Show git diff
Plugin 'airblade/vim-gitgutter'
Plugin 'gregsexton/gitv'

" Snippet
" Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Python
"" Schema check, debug
Plugin 'klen/python-mode'
"Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'

"" syntax check
" Plugin 'scrooloose/syntastic'
"" run pytest in vim
Plugin 'alfredodeza/pytest.vim'
"" Commenter
Plugin 'scrooloose/nerdcommenter'
" Reviewboard
Plugin 'turlutux/rb-vim'
" Coding
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
" cmdline complete
Plugin 'vim-scripts/CmdlineComplete'
" virtualenv
Plugin 'jmcantrell/vim-virtualenv'
" Rails
Plugin 'tpope/vim-rails'

" tmux-navigator
Plugin 'christoomey/vim-tmux-navigator'


" javascript
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'burnettk/vim-angular'
Plugin 'matthewsimo/angular-vim-snippets'
Plugin 'Shutnik/jshint2.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'mxw/vim-jsx'
Plugin 'marijnh/tern_for_vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'Raimondi/delimitMate'
Plugin 'lukaszb/vim-web-indent'

" html
Plugin 'mattn/emmet-vim'

" puppet
Plugin 'rodjek/vim-puppet'

" jenkinsfile
Plugin 'martinda/Jenkinsfile-vim-syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" General Settings

set nocompatible	" not compatible with the old-fashion vi mode
set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside

" Hybrid linenumber
set number relativenumber
augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
        autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

syntax on		" syntax highlight
set hlsearch		" search highlighting

au BufNewFile,BufRead jenkinsfile,Jenkinsfile,*.jenkinsfile,*.Jenkinsfile setf Jenkinsfile


if has("gui_running")	" GUI color and font settings
  set guifont=Osaka-Mono:h20
  set background=dark
  set t_Co=256          " 256 color mode
  set cursorline        " highlight current line
  colors moria
  highlight CursorLine          guibg=#003853 ctermbg=24  gui=none cterm=none
else
" terminal color settings
  colorscheme candy
  set background=dark
"hi Search cterm=NONE ctermfg=black ctermbg=grey
endif

" Setup spell
autocmd BufNewFile,BufRead *.txt setlocal spell

set clipboard=unnamed	" yank to the system register (*) by default
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu
2
" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set autoindent		" auto indentation
set incsearch		" incremental search
set nobackup		" no *~ backup files

set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" autoreload tab
autocmd BufWritePost .vimrc source %

" Visualize TAB
" highlight tabs and trailing spaces
" highlight SoftTab gui=underline guifg=blue ctermbg=blue
" match SoftTab / \{4\}/

"
" TAB setting{
   set expandtab        "replace <TAB> with spaces
   "set softtabstop=2
   "set shiftwidth=2

   autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
   autocmd FileType Jenkinsfile setlocal tabstop=4|set shiftwidth=4|set softtabstop=4
   autocmd FileType yaml setlocal tabstop=8|set shiftwidth=4| set softtabstop=2|set expandtab
   autocmd FileType scss setlocal shiftwidth=2 tabstop=2 | set softtabstop=2
   autocmd FileType html setlocal shiftwidth=2 tabstop=2 | set softtabstop=2
   autocmd FileType java setlocal tabstop=4|set shiftwidth=4|set expandtab
   autocmd FileType python setlocal tabstop=4|set shiftwidth=4|set expandtab
   autocmd FileType *.sh setlocal tabstop=4|set shiftwidth=4|set expandtab
   autocmd FileType Makefile set noexpandtab
   autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 | set softtabstop=4
   autocmd FileType typescript.tsx setlocal shiftwidth=4 tabstop=4 | set softtabstop=4
   autocmd FileType jasmine.javascript setlocal shiftwidth=4 tabstop=4 | set softtabstop=4
"}


" " status line {
" set laststatus=2
" set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
" set statusline+=\ \ \ [%{&ff}/%Y]
" set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
" set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L
"
"
" "
"
" function! CurDir()
"     let curdir = substitute(getcwd(), $HOME, "~", "")
"     return curdir
" endfunction
"
" function! HasPaste()
"     if &paste
"         return '[PASTE]'
"     else
"         return ''
"     endif
" endfunction
"
"}

" code folding
set foldmethod=indent
set foldlevel=99

" Highlight after 80
" highlight ColorColumn ctermbg=
let &colorcolumn=join(range(89,90),",")

" C/C++ specific settings
autocmd FileType c,cpp,cc  set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30


"trailing whitespace
function! TrimWhiteSpace()
	%s/\s\+$//e
endfunction
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()


"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"---------------------------------------------------------------------------
" Tip #382: Search for <cword> and replace with input() in all open buffers
"---------------------------------------------------------------------------
fun! Replace()
    let s:word = input("Replace " . expand('<cword>') . " with:")
    :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge'
    :unlet! s:word
endfun

"---------------------------------------------------------------------------
" ENCODING SETTINGS
"---------------------------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
	set encoding=utf-8
	set termencoding=big5
endfun

fun! UTF8()
	set encoding=utf-8
	set termencoding=big5
	set fileencoding=utf-8
	set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
	set encoding=big5
	set fileencoding=big5
endfun

"---------------------------------------------------------------------------
" USEFUL SHORTCUTS
"---------------------------------------------------------------------------
" set leader to ,
let mapleader=","
let g:mapleader=","

" Bash like keys for insert mode
imap <C-A> <Home>
imap <C-E> <End>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

"space to toggle function folding
nnoremap <space> za
vnoremap <space> zf

"Switch Split from horizontal to vertical
nnoremap <C-V> <C-W>t<C-W>H
"Switch Split from vertical to horizontal
nnoremap <C-H> <C-W>t<C-W>K

"Go to definition
map <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>gr :YcmCompleter GoToReferences<CR>
"map <leader>d :RopeGotoDefinition<CR>
"map <leader>r :RopeRename<CR>

"---------------------------------------------------------------------------
" PLUGIN SETTINGS
"---------------------------------------------------------------------------
" Unite
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <C-p> :Unite -start-insert file_rec<CR>

"ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" faster grep, The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Ctrl+N to Toggle Nerdtree
map <C-n> :NERDTreeToggle<CR>

" map <leader>f :bprevious<CR>
" map <leader>n :bnext<CR>
" Do not show preview window for autocomplete
set completeopt-=preview

" Airline config
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"YouCompleteMe
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_goto_buffer_command = 'horizontal-split'
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
" Do not show preview window for autocomplete
set completeopt-=preview

"jedi-vim
"" disable everything only keep the argument completion helpers
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0

" virtualenv
let g:virtualenv_auto_activate = 1

" virtualenv
let g:virtualenv_auto_activate = 1

" Python-mode
let g:pymode_python = 'python'
" turn-off plugin's warning
let g:pymode_warnings = 0
" Auto Detect virtualenv
let g:pymode_virtualenv = 1
let g:pymode_virtualenv_path = 'virtualenv_run'
" Enable pymode folding
let g:pymode_folding = 1
" Enable pymode motion
let g:pymode_motion = 1
" code check
let g:pymode_lint_checkers = ['pyflakes']
let g:pymode_lint_ignore = "W"
" trim whitespace on save
let g:pymode_trim_whitespace = 1
" disable rope completion
let g:pymode_rope_autoimport = 0
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
"let g:pymode_rope_completion = 1
"let g:pymode_rope_goto_definition_bind = '<leader>d'
"let g:pymode_rope_rename_bind = '<leader>r'
"let g:pymode_rope_rename_module_bind = '<leader>rm'

" code folding
let g:SimpylFold_docstring_preview=1
set foldmethod=indent
set foldlevel=99

" py.test
nmap <leader>tf :Pytest file<CR>
nmap <leader>tc :Pytest class<CR>
nmap <leader>tm :Pytest method<CR>

"jshint2
let jshint2_save = 1

"Tmux integration
let g:tmux_navigator_no_mappings = 1

"comment
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'start'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1


"syntax
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_python_exec='python3'
let g:syntastic_python_checkers = ['python', 'flake8', 'pyflakes', 'pylint']
"let g:syntastic_python_pylint_exec ='virtualenv_run/bin/pylint'
let g:syntastic_aggregate_errors = 1

if !filereadable("virtualenv_run/bin/pylint") && isdirectory('virtualenv_run')
        execute getcwd() + "/virutalenv_run/bin/pip install pylint"
endif


nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
"nnoremap <silent> <c-p> :TmuxNavigatePrevious<cr>

"---------------------------------------------------------------------------
" PROGRAMMING SHORTCUTS
"---------------------------------------------------------------------------
" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

let g:SuperTabDefaultCompletionType = "context"


"set cot-=preview "disable doc preview in omnicomplete
" make CSS omnicompletion work for SASS and SCSS
autocmd BufEnter /usr/share/vim/vim73/doc/*.txt  set nospell
autocmd BufLeave /usr/share/vim/vim73/doc/*.txt  set spell

xmap <Leader>y y:call SendViaOSC52(getreg('"'))<cr>
" copy the current text selection to the system clipboard
" if has('gui_running') || has('nvim') && exists('$DISPLAY')
"  noremap <Leader>y "+y
"else
  " copy to attached terminal using the yank(1) script:
""  noremap <Leader>y y:call system('~/.local/bin/yank > /dev/tty', @0)<Return>
"endif
