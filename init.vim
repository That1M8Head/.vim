" init.vim --- Arsalan Kazmi's Neovim config
" This file is not part of Neovim.

" vim:fdm=expr:fdl=0:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

"# vim-plug
source ~/.config/nvim/packages.vim

"# OS/kernel detection
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

"# Options
"## Colour scheme and font
colorscheme gruvbox
if g:os == "Linux"
    set guifont=JetBrains\ Mono\ NL\ 11
else
    set guifont=JetBrains\ Mono\ NL:h11
endif

"## GUI options
if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions=
endif

"## Tabs and indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent
set modelineexpr

"## Other options
set mouse=a
set number relativenumber
set wildmenu
set nobackup
set cursorline
set autoread
set hidden
set linebreak
set noshowmode
set termguicolors
set t_Co=256
set nocompatible
syntax on
filetype on
let did_install_default_menus = 1
let did_install_syntax_menu = 1

"# Key bindings
"## Set <SPC> as leader key
let mapleader = " "

"## File saving
nmap <leader>fs :w<CR>
nmap <leader>fS :w 

"## Find files
nmap <leader>ff :CtrlP .<CR>
nmap <leader>fr :CtrlPMRU<CR>

"## Find private config
nmap <leader>fp :edit ~/.config/nvim/init.vim<CR>
nmap <leader>fP :edit ~/.config/nvim/<CR>

"## Quitting
nmap q          :q<CR>
nmap <leader>qq :qa<CR>
nmap <leader>qQ :qa!<CR>

" Quitting terminal
tmap <Esc> <C-\><C-n>

"## Buffer switching
nmap <leader>j  :bnext<CR>
nmap <leader>k  :bprevious<CR>

"## Buffer kill
nmap <leader>bd :bd<CR>
nmap <leader>bD :bd!<CR>
nmap <leader>bw :bw<CR>
nmap <leader>bW :bw!<CR>

"## Reload
nmap <leader>rc :source ~/.config/nvim/init.vim<CR>
nmap <leader>pp :source ~/.config/nvim/packages.vim<CR>:PlugInstall<CR>
nmap <leader>pu :source ~/.config/nvim/packages.vim<CR>:PlugUpdate<CR>

"## NERDTree
nmap <leader>nt :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

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

nmap <C-x>2 :vsplit<CR>
nmap <C-x>3 :split<CR>
imap <C-x>2 <C-o>:vsplit<CR>
imap <C-x>3 <C-o>:split<CR>

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


"## Other bindings
nmap <leader>hh :help 
nmap <leader>w  <C-w>
nmap <leader>cs :colorscheme 
nmap <C-q> :Startify<CR>
vnoremap <BS> d
nmap <leader>ot :terminal<CR>
"# Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme="gruvbox"
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
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
let g:startify_commands = [
    \ { 'v': ['Edit vimrc', ':edit ~/.config/nvim/init.vim'] },
    \ { 'p': ['Manage vim-plug packages', ':edit ~/.config/nvim/packages.vim'] }
    \ ]


