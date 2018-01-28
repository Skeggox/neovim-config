" Jan Lotz
scriptencoding utf-8

let g:mapleader='\<space>'
let g:maplocalleader='\'

if executable('git')
    source $XDG_CONFIG_HOME/nvim/init/plugins.vim
else
    set statusline=%<%f%h%m%r%w%=%y%=%b\ 0x%B\ \ %l,%c%V\ %P
endif

" Vim-specific 
if !has('nvim')
    source $XDG_CONFIG_HOME/nvim/init/vim.vim
endif

set cmdheight=2

" Development 
" Python 
"let g:python_host_prog = 'c:\Python27\python.exe'
"let g:python3_host_prog = 'c:\Python36\python.exe'
 
" Spaces & Tabs 
set tabstop=4		    " 4 space tabs
set softtabstop=4
set shiftwidth=4
set expandtab		    " Use spaces for tabs
set modelines=1		    " Number of lines in header comments to check for Vim commands

" UI Layout 
set number		        " Show line numbers
set nocursorline	    " Highlight current line instead of cursor
set lazyredraw		    " Don't redraw the screen during macros or unexecuted commands
set showmatch		    " Highlight matching parenthesis
 
" Searching 
set ignorecase		    " Ignore case when searching
 
" Folding 
set foldmethod=indent	" fold based on indent level
set foldnestmax=10	    " Max of 10 folds
set foldenable		    " Don't fold files by default on open
set foldlevelstart=10	" start with a fold level of 1?

" Remap Shortcuts 
 
"nnoremap <expr> j v:count ? 'j' : 'gj'
"nnoremap <expr> k v:count ? 'k' : 'gk'
"nnoremap gj j
"nnoremap gk k
nnoremap <esc><esc> :nohlsearch<cr>
nnoremap Y y$

" Leader Shortcuts 
nnoremap <leader>y "+y  
nnoremap <leader>p "+p  
nnoremap <leader>json :%!jjson --vim-plugin-mode -i 4 -f %<cr>
 
" Autogroups 
"augroup configgroup
"	autocmd!
"	autocmd VimEnter * highlight clear SignColumn		" Clear any signs (like breakpoint icons) in the left column
"augroup END
" 
" Backups 
" set backupskip=/tmp/*,/private/tmp/*
 

