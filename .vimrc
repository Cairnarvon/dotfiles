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

" Obnoxious whitespace should be visible
set list
set listchars=tab:▸\ 

" Filetype associations
au BufRead,BufNewFile *.cilk    set filetype=cilk
au BufRead,BufNewFile *.codan   set filetype=codan
au BufRead,BufNewFile *.mako    set filetype=mako

" Don't undent python comments
au BufEnter           *.py      :inoremap # X<C-H>#

" Automatically make hashbang scripts executable 
au BufWritePost * if getline(1) =~ "^#!" | silent execute "!chmod +x <afile>" | endif

if $TERM == "xterm"
    colorscheme ir_black
endif
