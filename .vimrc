" == General Congiguartion ==
set nocompatible                    " Disable vi compatibility
set number                          " Always show line numbers
set showmode                        " Always show the mode
set clipboard=unnamedplus           " Use the system clipboard by default
syntax on                           " Enable syntax highlighting

if has("autocmd")                   " Open at the same place we left off
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" ======== Indentation =======
set autoindent                      " Copy indenation from previous line
set shiftwidth=4                    " Set the number of spaces when using >> or <<
set softtabstop=4                   " Backspace deltes entire TABs
set nowrap                          " Don't wrap lines

" ========== Search ==========
set incsearch                       " Find the next match as we type
set hlsearch                        " Highlight searches by default
set ignorecase                      " Ignore case while searching...
set smartcase                       " ... unless we type a captial

" =========== PEP8 ===========
au Bufread,BufNewFile *py,*pyw set expandtab       " TABs are spaces
au Bufread,BufNewFile *py,*pyw set tabstop=4       " Set the width of TAB to 4
highlight BadWhiteSpace ctermbg=red guibg=red       " Highlight bad whitespace
" Highlight tabs at the beginning of a line, and trailing whitespace as bad
au Bufread,BufNewFile *py,*pyw match BadWhiteSpace /^\t\+/
au Bufread,BufNewFile *py,*pyw match BadWhiteSpace /\s\+$/
" Use UNIX (\n) line endings
au Bufread,BufNewFile *py,*pyw set fileformat=unix 
" For full syntax highlighting
let python_highlight_all=1                          

" ========= Markdown =========
autocmd BufNewFile,BufRead *.md set filetype=markdown	    " Treat all .md files as markdown
autocmd FileType markdown set cursorline		    " Highlight the line the cursor is on
autocmd FileType markdown setlocal spell spelllang=en_us    " Set spell check to American English
autocmd FileType markdown set wrap			    " Wrap lines
