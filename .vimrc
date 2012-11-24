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
au BufRead,BufNewFile *.rkt,*.rktl  set filetype=racket
au BufRead,BufNewFile Makefile  set noexpandtab

" Don't undent python comments
au BufEnter           *.py      :inoremap # X<C-H>#

" Two-space indent for Ruby
au BufEnter           *.rb      set sts=2 | set sw=2

" Automatically make hashbang scripts executable 
au BufWritePost * if getline(1) =~ "^#!" | silent execute "!chmod +x <afile>" | endif

" Get ;p to open a Python shell and load the current file as a module
function! PyShellLoad()
    if @% !~# '\.py$'
        echo 'Not editing a Python module.'
        return
    endif
    let l:module = substitute(expand('%:t'), '\.py$', '', '')
    let l:wd = expand('%:p:h')
    execute '!PYTHONPATH="$PYTHONPATH:' . l:wd .
          \ '" python -i -c "print \">>> import ' . l:module .
          \ '\"; import ' . l:module . '"'
endfunction
nmap <silent> ;p :call PyShellLoad()<CR>

colorscheme ir_black
