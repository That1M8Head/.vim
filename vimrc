""" vimrc --- Arsalan Kazmi's Vim config
"" This file is not part of Vim.

"" vim-plug
if has('win32')
    source ~/vimfiles/packages.vim
else
    source ~/.vim/packages.vim
endif

"" Options

" Colour scheme and font
set guifont=Cascadia\ Code\ PL\ 11
colorscheme hatsunemiku

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

" Other options
set nocompatible
set number relativenumber
set wildmenu
set nobackup
set cursorline
set autoread
set hidden
syntax on
filetype on
let did_install_default_menus = 1
let did_install_syntax_menu = 1
set t_Co=25

"" Key bindings

" Set <SPC> as leader key
let mapleader = " "

" File saving
nmap <leader>fs :w<CR>
nmap <leader>fS :w 

" Find files
nmap <leader>ff :edit 
nmap <leader>fr :browse oldfiles<CR>

" Find private config
if has('win32')
	nmap <leader>fp :edit ~/vimfiles/vimrc<CR>
	nmap <leader>fP :edit ~/vimfiles/<CR>
else
	nmap <leader>fp :edit ~/.vim/vimrc<CR>
	nmap <leader>fP :edit ~/.vim/<CR>
endif

" Quitting
nmap <leader>qq :qa<CR>
nmap <leader>qQ :qa!<CR>

" Vimium-style buffer switching
nmap <leader>j  :bprevious<CR>
nmap <leader>k  :bnext<CR>

" Buffer kill
nmap <leader>bk :bw<CR>
nmap <leader>bK :bw!<CR>

" Reload config (rc)
if has('win32')
    nmap <leader>rc :source ~/vimfiles/packages.vim<CR>:PlugInstall<CR>:source ~/vimfiles/vimrc<CR>q
else
    nmap <leader>rc :source ~/.vim/packages.vim<CR>:PlugInstall<CR>:source ~/.vim/vimrc<CR>q
endif

" Other leader bindings
nmap <leader>hh :help 
nmap <leader>w  <C-w>
nmap <leader>nt :NERDTreeToggle<CR>
nmap <leader>cs :colorscheme 

"" Emacs-style bindings

" Navigation
imap <C-p> <up>
imap <C-n> <down>
imap <C-b> <left>
imap <C-f> <right>
imap <C-a> <home>
imap <C-e> <end>

" M-x
nmap <M-x> :
imap <M-x> <C-o>:

" C-x shortcuts
nmap <C-x><C-s> :w<CR>
imap <C-x><C-s> <C-o>:w<CR>
nmap <C-x><C-w> :w 
imap <C-x><C-w> <C-o>:w 
nmap <C-x><C-f> :w<CR>
imap <C-x><C-f> <C-o>:w<CR>

" Clipboard stuff
nnoremap y "+y
vnoremap y "+y
nnoremap p "+p
vnoremap p "+p
nnoremap d "+d
vnoremap d "+d

" Fullscreen
if has("win32")
    nmap <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
    imap <F11> <C-o>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif

" Other bindings
nmap <C-q> :Startify<CR>
vnoremap <BS> d

"" Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.readonly = 'locked'
let g:airline_section_warning = ''
let g:airline_section_y = '%{strftime("%r")}'
let g:airline_section_z = '%l:%c'

"" Startify
let g:startify_lists = [
	\ { 'type': 'files',     'header': ['   Recent']         },
	\ { 'type': 'sessions',  'header': ['   Sessions']       },
	\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
	\ { 'type': 'commands',  'header': ['   Commands']       },
	\ ]
if has("win32")
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


