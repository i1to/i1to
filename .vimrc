 1 if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
  2     set fileencodings=utf-8,latin1
  3 endif
  4 
  5 if has('gui_running')
  6     set background=light
  7 else
  8     set background=dark
  9 endif
 10 
 11 if &term=="xterm"
 12 set t_Co=8
 13 set t_Sb=^[[4%dm
 14 set t_Sf=^[[3%dm
 15 endif
 16 
 17 call plug#begin('~/.vim/plugged')
 18 Plug 'tpope/vim-fugitive'
 19 Plug 'brookhong/cscope.vim'
 20 Plug 'yegappan/grep'
 21 call plug#end()
 22 
 23 filetype plugin indent on
 24 syntax on
 25 
 26 set ai
 27 set ruler
 28 set number
 29 set laststatus=2
 30 set hlsearch
 31 set smartcase
 32 set smartindent
 33 set showmatch
 34 set cindent
 35 set tabstop=8
 36 set shiftwidth=4
 37 set backspace=indent,eol,start
 38 set guifont=Courier\ New\ 14
 39 set nocompatible
 40 set foldmethod=marker
 41 set foldmarker=#StartFold,#EndFold
 42 set wildmenu
 43 set incsearch
 44 set matchtime=5
 45 set cpoptions=aABceFsmq
 46 colorscheme desert
 47 
 48 set cscopequickfix=i-,g-,s-,t-,e-,f-,d-,c-
 49 set statusline=%F\ %m%h%r%<%=\ [%{&ff},%{$fenc}]\ [%Y]\ [%l,%v]\ [%L]\ [%p%%]
 50 
 51 set statusline+=%{FugitiveStatusline()}
 52 
 53 let mapleader="."
 54 
 55 "Quit And Save
 56 nnoremap <leader>q :q<CR>
 57 nnoremap <leader>w :w!<CR>
 58 nnoremap <leader>t :!ctags -R<CR>
 59 
 60 "Git operation in vim
 61 nnoremap <leader>gs :Git<CR>
 62 nnoremap <leader>gl :Git log<CR>
 63 nnoremap <leader>gvd :Gvdiffspli<CR>
 64 nnoremap <leader>gd :Git diff<CR>
 65 nnoremap <leader>gb :Git blame<CR>
 66 nnoremap <leader>gl :Gclog .<CR>
 67 nnoremap <leader>gw :Gwrite<CR>
 68 
 69 "Search
 70 let Grep_Run_Async = 0
 71 nnoremap <leader>rg :Rgrep<CR>
 72 let Grep_Default_Filelist='*.[cshS] *.go *.py *.cpp *.hpp *.cc *.js *.in *.ac Makefile configure *.hh *.def'
 73 let Grep_Skip_Files = '*.bak *~ *.so *.i *.a *.o *tags'
 74 let Grep_Default_Options='-i --color=auto'
 75 let Grep_Skip_Dirs='.svn .git'
 76 
 77 " s: Find this C symbol
 78 nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
 79 " g: Find this definition
 80 nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
 81 " d: Find functions called by this function
 82 nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
 83 " c: Find functions calling this function
 84 nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
 85 " t: Find this text string
 86 nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
 87 " e: Find this egrep pattern
 88 nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
 89 " f: Find this file
 90 nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
 91 " i: Find files #including this file
 92 nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
 93 " u: Update cscope DB
 94 nnoremap  <leader>fu :call CscopeUpdateDB()<CR>
~                                                       
 
 
 
 
