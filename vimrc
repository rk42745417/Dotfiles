set nocompatible

" Plugins
call plug#begin('~/.vim/plugged')

" Plug 'yuttie/comfortable-motion.vim'
" Plug 'itchyny/lightline.vim'
" Plug 'rlue/vim-barbaric'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'fmoralesc/molokayo'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bfrg/vim-cpp-modern'
Plug 'tribela/vim-transparent'
call plug#end()

" basic configurations
set cb^=unnamedplus,unnamed
set ts=4 " tabstop=4
set sw=4 " shiftwidth=4
set ls=2 " laststatus=2
set cul " cursorline
set ai " autoindent
set is " incsearch
filetype plugin indent on
set hls " hlsearch
set rnu " relativenumber
set showcmd
syntax enable
" colo 

" additional configurations
colo molokayo
let g:airline_theme='molokai'
set mouse=n
set autochdir
set ttimeoutlen=0
" enable powerline symbols
let g:airline_powerline_fonts = 1
" do not hightlight my function
let g:cpp_function_highlight = 0
" vim markdown settings
let g:vim_markdown_math = 1

" keymaps
autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++17 % -o %:r -Wall -Wextra -Wconversion -Wshadow -Wfatal-errors -fsanitize=undefined -fsanitize=address -g -DEMT <CR>
autocmd filetype cpp nnoremap <F10> :!./%:r <CR>
autocmd filetype cpp nnoremap <F11> :!./%:r < input.txt > output.txt <CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

" latex keymaps
autocmd filetype tex nnoremap <F9> :w <bar> :!xelatex % <CR>
autocmd filetype tex nnoremap <F10> :!okular %:r.pdf <CR>

" Set true color
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" NERDTree settings
" F5 to toggle and put the cursor back in the othe window.
nnoremap <F5> :NERDTreeToggle \| wincmd p<CR>
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDTreeWinSize=20

" Refresh defaut code
let DefaultCodePath="~/Programming/template/default.cpp"
let LineNumber=62
autocmd filetype cpp command! New execute "%d|0r " . DefaultCodePath . "|$|d|" . LineNumber . "|redraw"

" encoding
set fileencodings=ucs-bom,utf-8,cp932,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
