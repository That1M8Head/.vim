""" vimrc --- Arsalan Kazmi's Vim config
"" This file is not part of Vim.

" vim-plug
if has('win32')
    source ~\vimfiles\packages.vim
else
    source ~\.vim\packages.vim
endif

" GUI options
if has("gui_running")
    set guioptions-=l
    set guioptions-=r
    set guioptions-=T
    set guioptions-=m
	colorscheme onedark
endif

" Tabs and indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent

" Other options
set guifont=Cascadia\ Code\ PL:h11
set nocompatible
set number
set wildmenu
set nobackup
set cursorline
set autoread
syntax on
filetype on
let did_install_default_menus = 1
let did_install_syntax_menu = 1

" Leader key, because Doom Emacs muscle memory
let mapleader = " "
nmap <leader>fs :w<CR>
nmap <leader>fS :w
nmap <leader>qq :qa<CR>
nmap <leader>ff :edit 
if has('win32')
	nmap <leader>fp :edit ~/vimfiles/vimrc<CR>
	nmap <leader>fP :edit ~/vimfiles/<CR>
else
	nmap <leader>fp :edit ~/.vim/vimrc<CR>
	nmap <leader>fP :edit ~/.vim/<CR>
endif
nmap <leader>fr :browse oldfiles<CR>
nmap <leader>bk :bw<CR>:echo "Buffer killed"<CR> 
nmap <leader>bK :bw!<CR>:echo "Buffer force killed"<CR> 
nmap <leader>hh :help 
nmap <leader>w  <C-w>

" Emacs-style bindings
imap <C-p> <up>
imap <C-n> <down>
imap <C-b> <left>
imap <C-f> <right>
map <C-a> <home>
map <C-e> <end>
nmap <M-x> :
imap <M-x> <ESC>:

" Clipboard stuff
nnoremap y "+y
vnoremap y "+y
nnoremap p "+p
vnoremap p "+p
nnoremap d "+d
vnoremap d "+d

" Other bindings
nmap <ESC> :echo "You're already in Normal mode."<CR>
vmap <TAB> >
vmap <S-TAB> <
nmap <C-q> :Startify<CR>
vnoremap <BS> d

" Airline
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ' L:'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.colnr = ' C:'
if has("gui_running")
	let g:airline_theme='onedark'
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.readonly = 'locked'
endif
let g:airline_section_warning = ''

" Startify
let g:startify_lists = [
	  \ { 'type': 'files',     'header': ['   Recent']         },
	  \ { 'type': 'sessions',  'header': ['   Sessions']       },
	  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
	  \ { 'type': 'commands',  'header': ['   Commands']       },
	  \ ]

" Fullscreen
nmap <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
imap <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>i

