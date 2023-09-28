set nocompatible
let g:ale_completion_enabled = 1

" Issue https://github.com/vim/vim/issues/11821
if &term =~ 'kitty'
	" <PageUp>
	let &t_kP = "\<ESC>[5;*~" " <PageDown>
	let &t_kN = "\<ESC>[6;*~"
	" <Del>
	let &t_kD = "\<ESC>[3;*~"
	" <Insert>
	let &t_kI = "\<ESC>[2;*~"
	" <F5>
	let &t_k5 = "\<ESC>[15;*~"
	" <F6>
	let &t_k6 = "\<ESC>[17;*~"
	" <F7>
	let &t_k7 = "\<ESC>[18;*~"
	" <F8>
	let &t_k8 = "\<ESC>[19;*~"
	" <F9>
	let &t_k9 = "\<ESC>[20;*~"
	" <F10>
	let &t_k; = "\<ESC>[21;*~"
	" <F11>
	let &t_F1 = "\<ESC>[23;*~"
	" <F12>
	let &t_F2 = "\<ESC>[24;*~"
endif

" Plugins
call plug#begin('~/.vim/plugged')

" Plug 'yuttie/comfortable-motion.vim'
" Plug 'itchyny/lightline.vim'
Plug 'lilydjwg/fcitx.vim'
Plug 'jasonccox/vim-wayland-clipboard'
Plug 'sevko/vim-nand2tetris-syntax'

" Plug 'ycm-core/YouCompleteMe'
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
" Plug 'dense-analysis/ale'
call plug#end()

" basic configurations
set cb^=unnamedplus,unnamed
set ts=4 " tabstop=4
set sw=0 " shiftwidth=tabstop
set sts=-1 " softtabstop=shiftwidth
set et " expandtab
set ls=2 " laststatus=2
set cul " cursorline
set ai " autoindent
set is " incsearch
filetype plugin indent on
set hls " hlsearch
set nu " number
set rnu " relativenumber
set showcmd
syntax enable

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

autocmd filetype javascript set tabstop=2 |
            \ set softtabstop=2 |
            \ set shiftwidth=2

" keymaps
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

" Cpp keymaps
autocmd filetype cpp nnoremap <F8> :w <bar> !g++ -std=c++17 % -o %:r -O2<CR>
autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++17 % -o %:r -Wall -Wextra -Wconversion -Wshadow -Wfatal-errors -fsanitize=undefined -fsanitize=address -g -DEMT<CR>
autocmd filetype cpp nnoremap <F10> :!./%:r<CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

" C keymaps
autocmd filetype c nnoremap <F8> :w <bar> !gcc -std=c99 % -o %:r -O2<CR>
autocmd filetype c nnoremap <F9> :w <bar> !gcc -std=c11 % -o %:r -Wall -Wextra -Wconversion -Wshadow -Wfatal-errors -fsanitize=undefined -fsanitize=address -g -DEMT<CR>
autocmd filetype c nnoremap <F10> :!./%:r<CR>
autocmd filetype c nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

" latex keymaps
autocmd filetype tex nnoremap <F9> :w <bar> !xelatex --shell-escape %<CR>
autocmd filetype tex nnoremap <F10> :!zathura %:r.pdf<CR>

" python keymaps
autocmd filetype py nnoremap <F9> :w <bar> !python3 %<CR>

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
let LineNumber=73
autocmd filetype cpp command! New execute "%d|0r " . DefaultCodePath . "|$|d|" . LineNumber . "|redraw"

" encoding
set fileencodings=ucs-bom,utf-8,cp932,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
