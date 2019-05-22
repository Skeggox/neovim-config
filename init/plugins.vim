" Jan Lotz
" Plugins configuration 

" Setup plugin manager
let g:plug_file = expand('$XDG_CONFIG_HOME/nvim/autoload/plug.vim')

if !filereadable(g:plug_file)
  exec '!curl -fLo '.g:plug_file.' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Configure plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-fugitive'   " Git
Plug 'tpope/vim-rhubarb'    " GitHub
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" TODO: Setup this for Django Plug 'tpope/vim-projectionist'

"Plug 'tpope/sensible'
"Plug 'tpope/sleuth.vim'
"Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-unimpaired'
"Plug 'junegunn/fzf'
"Plug 'junegunn/fzf.vim', { 'do': ['./install --all'] }
"Plug 'sheerun/vim-polyglot'
"Plug 'vim-utils/vim-man'
"Plug 'svermeulen/vim-easyclip'
"Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

" Optional: Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'machakann/vim-highlightedyank'

" UI
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Development
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
" Plug 'neoclide/coc.nvim'
Plug 'neomake/neomake'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': './install.sh' }

" Python
" external requirements:
"    pip install jedi
"    pip install yapf
"    pip install pylint
"    TODO: pip install 'python-language-server'
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'tmhedberg/SimpylFold'

" Markdown
Plug 'SidOfc/mkdx'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

call plug#end()

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

let g:airline_theme='onedark'

let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"
let g:neomake_python_enabled_makers = ['pylint']

"call neomake#configure#automake('nrwi', 500)

"let g:neomake_logfile = expand('$XDG_RUNTIME_DIR/logs/neomake.log')
"let g:neomake_cpp_enabled_makers = ["clang"]

let g:deoplete#enabled_at_startup = 1
"let g:deoplete#sources#clang#autofill_neomake = 1

inoremap <silent><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" source "$XDG_CONFIG_HOME/nvim/init/fzf.vim"
" source "$XDG_CONFIG_HOME/nvim/init/language_client.vim"

"set statusline=%<%f%h%m%r%w%=%y\ %{fugitive#statusline()}%=%b\ 0x%B\ \ %l,%c%V\ %P
