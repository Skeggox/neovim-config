" Jan Lotz
scriptencoding utf-8

let g:mapleader="\<space>"
let g:maplocalleader='\'

" Setup plugin manager
let g:plug_file = expand('$XDG_DATA_HOME/nvim/site/autoload/plug.vim')
let g:plug_dir = expand('$XDG_DATA_HOME/nvim/plugged')

" TODO: Figure out why this breaks nvim-qt on windows
if !filereadable(g:plug_file)
  exec '!curl -fLo '.g:plug_file.' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  runtime 'plug.vim'
endif

" Configure plugins
call plug#begin(g:plug_dir)

Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'neomake/neomake'
" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'install.ps1' }
Plug 'tweekmonster/deoplete-clang2'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

let g:deoplete#sources#clang#autofill_neomake = 1
let g:neomake_logfile = '/tmp/neomake.log'
let g:neomake_cpp_enabled_makers = ["clang"]

let g:deoplete#enabled_at_startup = 1

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

"" fzf

nnoremap <leader>b :Buffers<cr>
nnoremap <leader>c :History:<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>l :Lines<cr>
nnoremap <leader>m :Maps<cr>
nnoremap <leader>r :Ag<cr>

" fzf-vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'Type'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Character'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" set hidden
"let g:LanguageClient_serverCommands = {
"    \ 'cpp': ['cquery.exe', '--language-server']
"    \ }
"let g:LanguageClient_trace = 'messages'
"let g:LanguageClient_windowLogMessageLevel = 'Info'
"let g:LanguageClient_loggingLevel = 'DEBUG'

"nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

set statusline=%<%f%h%m%r%w%=%y\ %{fugitive#statusline()}%=%b\ 0x%B\ \ %l,%c%V\ %P
set cmdheight=2

" Development 
 
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
" 
" Vim-specific 
if !has('nvim')
    source "$XDG_CONFIG_HOME/nvim/init/vim.vim"
endif

