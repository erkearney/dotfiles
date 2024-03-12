
" == General Congiguartion ==
set number                          " Always show line numbers
set showmode                        " Always show the mode
syntax on                           " Enable syntax highlighting
set textwidth=80		    " Default to 80 chracters
set noswapfile			    " Don't create swap files
set nobackup nowritebackup	    " Turn off annoying backup files

if has("autocmd")                   " Open at the same place we left off
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" ======== Indentation =======
set autoindent                      " Copy indenation from previous line
"set smartindent			    " React to syntax/style of code we're editing
set shiftwidth=4                    " Set the number of spaces when using >> or <<
set softtabstop=4                   " Backspace deltes entire TABs
set expandtab			    " TABs are spaces

" ========== Search ==========
set incsearch                       " Find the next match as we type
set hlsearch                        " Highlight searches by default
set ignorecase                      " Ignore case while searching...
set smartcase                       " ... unless we type a captial

" ======== Python PEP8 ========
au Bufread,BufNewFile *py,*pyw set tabstop=4       " Set the width of TAB to 4
highlight BadWhiteSpace ctermbg=red guibg=red       " Highlight bad whitespace
" Highlight tabs at the beginning of a line, and trailing whitespace as bad
au Bufread,BufNewFile *py,*pyw match BadWhiteSpace /^\t\+/
au Bufread,BufNewFile *py,*pyw match BadWhiteSpace /\s\+$/
" Use UNIX (\n) line endings
au Bufread,BufNewFile *py,*pyw set fileformat=unix 
" For full syntax highlighting
au Bufread,BufNewFile *py,*pyw let python_highlight_all=1                          
au Bufread,BufNewFile *py,*pyw set textwidth=79

" =========== Java ==========
autocmd FileType java setlocal showmatch		    " Show matching brackets
autocmd FileType java setlocal textwidth=80		    " Warp lines at 80 characters
autocmd FileType java setlocal breakindent

" ======== JavaScript ========
au Bufread,BufNewFile *js set expandtab			    " TABs are spaces
au Bufread,BufNewFile *js set tabstop=2			    " Set the width of TAB to 2
au BufRead,BufNewFile *js set textwidth=80

" ========= Markdown =========
autocmd BufNewFile,BufRead *.md set filetype=markdown	    " Treat all .md files as markdown
autocmd BufNewFile,BufRead *.Rmd set filetype=markdown	    " Treat all .Rmd files as markdown
autocmd FileType markdown set cursorline		    " Highlight the line the cursor is on
autocmd FileType markdown setlocal spell spelllang=en_us    " Set spell check to American English

autocmd FileType tex setlocal spell spelllang=en_us	    " Set spell check to American English

if v:version < 802
    packadd! dracula
endif
syntax enable
colorscheme dracula
