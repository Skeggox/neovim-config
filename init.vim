" Jan Lotz
scriptencoding utf-8

" let g:mapleader='\<space>'
" let g:maplocalleader='\'
nmap <Space> <leader>

let $CONFIG_DIR=stdpath("config")
let $DATA_DIR=stdpath("data")

if executable('git')
    source $CONFIG_DIR/init/plugins.vim
else
    set statusline=%<%f%h%m%r%w%=%y%=%b\ 0x%B\ \ %l,%c%V\ %P
endif

" Vim-specific
if !has('nvim')
    source $CONFIG_DIR/init/vim.vim
endif

" Setup providers
" let g:node_host_prog = '/usr/lib/node_modules/neovim/bin/cli.js'

" Keyboard: this assumes you have a multi-media keyboard (like Logitech K350) and used showkey to
" create a unique keyboard map

" Music
" noremap <C-Space> :silent !mpc -q toggle<CR>

syntax on

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Spaces & Tabs
set tabstop=4           " 4 space tabs
set softtabstop=4
set shiftwidth=4
set expandtab           " Use spaces for tabs
set modelines=1         " Number of lines in header comments to check for Vim commands
set list                " Show trailing whitespace

" UI Layout
set number              " Show line numbers
set nocursorline        " Highlight current line instead of cursor
set lazyredraw          " Don't redraw the screen during macros or unexecuted commands
set showmatch           " Highlight matching parenthesis

" Searching
set ignorecase          " Ignore case when searching

" Folding
set foldmethod=syntax   " fold based on syntax
set foldnestmax=10      " Max of 10 folds
set foldenable          " Don't fold files by default on open
set foldlevelstart=10   " start with a fold level of 1?


" Development

" Remap Shortcuts

" This will copy the paragraph you are on, then paste a copy of it just below
noremap cp yap<S-}>p
" This will align/indent your current paragraph
noremap <leader>e =ip

" Remap ex-mode as playing a macro back
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Change tabs using shift direction
noremap <S-l> gt
noremap <S-h> gT

" Change panes with alt+direction
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Save and Quit shortcuts
noremap <leader>q :q<cr>
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

" Terminal mode
tnoremap <Esc> <C-\><C-n>
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

"nnoremap <expr> j v:count ? 'j' : 'gj'
"nnoremap <expr> k v:count ? 'k' : 'gk'
"nnoremap gj j
"nnoremap gk k
nnoremap <esc><esc> :nohlsearch<cr>
nnoremap Y y$

nnoremap <C-Right> :cnext<cr>
nnoremap <C-Left> :cprev<cr>

" Leader Shortcuts
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>json :%!jjson --vim-plugin-mode -i 4 -f %<cr>
nnoremap <leader>m :make<CR>
nnoremap <silent> <C-X> :close<CR>

autocmd FileType c,cpp,python autocmd BufWritePre <buffer> %s/\s\+$//e

" Autogroups
augroup configgroup
   autocmd!
   autocmd VimEnter * highlight clear SignColumn       " Clear any signs (like breakpoint icons) in the left column
augroup END

" Backups
" set backupskip=/tmp/*,/private/tmp/*


