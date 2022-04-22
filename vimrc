" vimrc --- Arsalan Kazmi's Vim config
" This file is not part of Vim.

" vim:fdm=expr:fdl=0:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

"# Detect OS (technically the kernel if uname)
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

"# vim-plug
if g:os == "Windows"
    source ~/vimfiles/packages.vim
else
    source ~/.vim/packages.vim
endif

"# Options

" Colour scheme and font
colorscheme dracula
if g:os == "Linux"
    set guifont=Iosevka\ Extended\ 11
else
    set guifont=Iosevka\ Extended:h11
endif

" GUI options
if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions=
endif

" Tabs and indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent
set modelineexpr

" Other options
set nocompatible
set number relativenumber
set wildmenu
set nobackup
set cursorline
set autoread
set hidden
set linebreak
set noshowmode
set termguicolors
syntax on
filetype on
let did_install_default_menus = 1
let did_install_syntax_menu = 1
set t_Co=256

"# Key bindings

"## Set <SPC> as leader key
let mapleader = " "

"## File saving
nmap <leader>fs :w<CR>
nmap <leader>fS :w 

"## Find files
nmap <leader>ff :CtrlP<CR>
nmap <leader>fr :CtrlPMRU<CR>

"## Find private config
if g:os == "Windows"
	nmap <leader>fp :edit ~/vimfiles/vimrc<CR>
	nmap <leader>fP :edit ~/vimfiles/<CR>
else
	nmap <leader>fp :edit ~/.vim/vimrc<CR>
	nmap <leader>fP :edit ~/.vim/<CR>
endif

"## Quitting
nmap <leader>qq :qa<CR>
nmap <leader>qQ :qa!<CR>

"## Buffer switching
nmap <leader>j  :bnext<CR>
nmap <leader>k  :bprevious<CR>

"## Buffer kill
nmap <leader>bd :bd<CR>
nmap <leader>bD :bd!<CR>
nmap <leader>bw :bw<CR>
nmap <leader>bW :bw!<CR>
"## Reload
if g:os == "Windows"
    nmap <leader>rc :source ~/vimfiles/vimrc<CR>
else
    nmap <leader>rc :source ~/.vim/vimrc<CR>
endif
if g:os == "Windows"
    nmap <leader>pp :source ~/vimfiles/packages.vim<CR>:PlugInstall<CR>
else
    nmap <leader>pp :source ~/.vim/packages.vim<CR>:PlugInstall<CR>
endif
if g:os == "Windows"
    nmap <leader>pu :source ~/vimfiles/packages.vim<CR>:PlugUpdate<CR>
else
    nmap <leader>pu :source ~/.vim/packages.vim<CR>:PlugUpdate<CR>
endif

"## NERDTree
nmap <leader>nt :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR><C-w>l

"## Other leader bindings
nmap <leader>hh :help 
nmap <leader>w  <C-w>
nmap <leader>cs :colorscheme 

"## Emacs-style bindings

imap <C-p> <up>
imap <C-n> <down>
imap <C-b> <left>
imap <C-f> <right>
imap <C-a> <home>
imap <C-e> <end>
imap <C-d> <del>
cmap <C-g> <ESC>

nmap <M-x> :
imap <M-x> <C-o>:

nmap <C-x><C-s> :w<CR>
imap <C-x><C-s> <C-o>:w<CR>
nmap <C-x><C-w> :w 
imap <C-x><C-w> <C-o>:w 
nmap <C-x><C-f> :w<CR>
imap <C-x><C-f> <C-o>:w<CR>

imap <M-w> <C-o>"+Y
imap <C-y> <C-o>"+p
imap <C-k> <C-o>"+D

nmap <M-=> g<C-g>

nnoremap y "+y
vnoremap y "+y
nnoremap p "+p
vnoremap p "+p
nnoremap d "+d
vnoremap d "+d
nnoremap Y "+Y
vnoremap Y "+Y
nnoremap P "+P
vnoremap P "+P
nnoremap D "+D
vnoremap D "+D

if has("win32")
    nmap <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
    imap <F11> <C-o>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif

nmap <C-q> :Startify<CR>
vnoremap <BS> d

"# Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.readonly = 'locked'
let g:airline_section_warning = ''
let g:airline_section_y = '%{strftime("%r")} %{strftime("%p")}'
let g:airline_section_z = '%l:%c'

"# Startify
let g:startify_lists = [
	\ { 'type': 'files',     'header': ['   Recent']         },
	\ { 'type': 'sessions',  'header': ['   Sessions']       },
	\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
	\ { 'type': 'commands',  'header': ['   Commands']       },
	\ ]
if g:os == "Windows"
    let g:startify_commands = [
        \ { 'v': ['Edit vimrc', ':edit ~/vimfiles/vimrc'] },
        \ { 'p': ['Manage vim-plug packages', ':edit ~/vimfiles/packages.vim'] }
        \ ]
else
    let g:startify_commands = [
        \ { 'v': ['Edit vimrc', ':edit ~/.vim/vimrc'] },
        \ { 'p': ['Manage vim-plug packages', ':edit ~/.vim/packages.vim'] }
        \ ]
endif

"# Encoding
if !has('nvim')
    set renderoptions=type:directx
endif
set encoding=UTF-8

