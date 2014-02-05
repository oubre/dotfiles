call pathogen#infect()

" status bar
" set statusline=%F%m%r%h%w\  "fullpath and status modified sign
set statusline=%f%m%r%h%w\  "path and status modified sign
set statusline+=\ %y "filetype
set statusline+=%=
set statusline+=\ [%l\/%L:\%v] "line number and column number

" auto load files if vim detects they have been changed outside of Vim
set autoread

set nocompatible

" allow unsaved background buffers and remember marks/undo for them
set hidden

" remember more commands and search history
set history=1000

" always show the status line
set laststatus=2

" Don't use spacing when hitting the tab key
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" show search matches as I type
set showmatch
set incsearch
set hlsearch

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" display incomplete commands
set showcmd

" Enable highlighting for syntax
syntax on

" Enable file type detection.
filetype plugin indent on

" Better tab completion
set wildmode=longest,list

" Line numbers
set number

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" pretty colours
set term=xterm-256color
colorscheme solarized
set background=dark
"set t_Co=256
" Colors for vim-airline
let g:airline_theme='solarized'

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Set up vertical ruler at 80 characters in
if exists('+colorcolumn')
	set colorcolumn=80
else
	" au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Handle SISTEM Managers crazy file types
au BufNewFile,BufRead *.phph set filetype=php
au BufNewFile,BufRead *.php3 set filetype=php
au BufNewFile,BufRead *.html set filetype=php
au BufNewFile,BufRead *.phtml set filetype=php
au BufNewFile,BufRead *.rgt setf rgt

" Json is just javasccript
autocmd BufNewFile,BufRead *.json set ft=javascript
" Try to fine the tags file
set tags=tags\ /usr/lib/tags\ ../tags\ public/tags\ ./public/tags
"
" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>
