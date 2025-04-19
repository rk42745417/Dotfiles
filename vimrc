set nocompatible

" Issue https://github.com/vim/vim/issues/11821
" if &term =~ 'kitty'
" 	" <PageUp>
" 	let &t_kP = "\<ESC>[5;*~"
" 	" <PageDown>
" 	let &t_kN = "\<ESC>[6;*~"
" 	" <Del>
" 	let &t_kD = "\<ESC>[3;*~"
" 	" <Insert>
" 	let &t_kI = "\<ESC>[2;*~"
" 	" <F5>
" 	let &t_k5 = "\<ESC>[15;*~"
" 	" <F6>
" 	let &t_k6 = "\<ESC>[17;*~"
" 	" <F7>
" 	let &t_k7 = "\<ESC>[18;*~"
" 	" <F8>
" 	let &t_k8 = "\<ESC>[19;*~"
" 	" <F9>
" 	let &t_k9 = "\<ESC>[20;*~"
" 	" <F10>
" 	let &t_k; = "\<ESC>[21;*~"
" 	" <F11>
" 	let &t_F1 = "\<ESC>[23;*~"
" 	" <F12>
" 	let &t_F2 = "\<ESC>[24;*~"
" endif

" basic configurations
set ts=4 " tabstop=4
set sw=4 " shiftwidth=4
set sts=4 " softtabstop=4
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
colo desert

" additional configurations
" colo molokayo
set mouse=n
set autochdir

" Set true color
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

" encoding
set fileencodings=ucs-bom,utf-8,cp932,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
