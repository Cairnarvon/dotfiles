" General
syntax on			" Syntax highlighting
set background=dark
set number			" Line numbers
set ruler
set showmatch		" Highlight matching brace
set hlsearch		" Highlight all search results
set matchpairs+=<:>
set mouse=a
set pastetoggle=<F9>

" Formatting
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set formatoptions+=t

" Filetype associations
au BufRead,BufNewFile *.cilk    set filetype=cilk
au BufRead,BufNewFile *.codan   set filetype=codan

colorscheme ir_black
