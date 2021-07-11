" Jan Lotz
" Plugins configuration

" Setup plugin manager
let g:plug_file = expand('$CONFIG_DIR/autoload/plug.vim')

if !filereadable(g:plug_file)
  exec '!curl -fLo '.g:plug_file.' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

let g:vimspector_enable_mappings = 'HUMAN'

" Configure plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-fugitive'   " Git
Plug 'tpope/vim-rhubarb'    " GitHub
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'wsdjeg/vim-fetch'
Plug 'vim-scripts/CRefVim'

"Plug 'martinda/Jenkinsfile-vim-syntax'

Plug 'tpope/vim-projectionist'

"Plug 'tpope/sensible'
"Plug 'tpope/sleuth.vim'
"Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'sheerun/vim-polyglot'
"Plug 'vim-utils/vim-man'
"Plug 'svermeulen/vim-easyclip'
"Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

" Optional: Plug 'terryma/vim-multiple-cursors'
"Plug 'scrooloose/nerdtree'
Plug 'machakann/vim-highlightedyank'

" UI
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Development
" Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': { -> coc#util#install()} }
Plug 'puremourning/vimspector'

Plug 'jackguo380/vim-lsp-cxx-highlight'
"Plug 'neomake/neomake'
"Plug 'Shougo/neoinclude.vim'
"Plug ''
"Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': './install.sh' }

" Python
" external requirements:
"    pip install jedi
"    pip install yapf
"    pip install pylint
"    TODO: pip install 'python-language-server'
" Plug 'davidhalter/jedi-vim'
" Plug 'zchee/deoplete-jedi'
" Plug 'tmhedberg/SimpylFold'
" Plug 'jmcomets/vim-pony'

" Markdown
Plug 'SidOfc/mkdx'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

call plug#end()

source $CONFIG_DIR/init/coc.vim
source $CONFIG_DIR/init/vimspector.vim
source $CONFIG_DIR/init/fzf.vim
source $CONFIG_DIR/init/crefvim.vim

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

let g:airline_theme='onedark'

" let g:jedi#completions_enabled = 0
" let g:jedi#use_splits_not_buffers = "right"
" let g:neomake_python_enabled_makers = ['pylint']

" call neomake#configure#automake('nrwi', 500)
" let g:neomake_python_pylint_args = ['--load-plugins=pylint_django']
" let g:neomake_open_list = 0
" let g:neomake_place_signs = 1

"let g:neomake_logfile = expand('$DATA_DIR/logs/neomake.log')
"let g:neomake_cpp_enabled_makers = ["clang"]

"let g:deoplete#enabled_at_startup = 1
"let g:deoplete#sources#clang#autofill_neomake = 1

" source init/fzf.vim
" source init/language_client.vim

"set statusline=%<%f%h%m%r%w%=%y\ %{fugitive#statusline()}%=%b\ 0x%B\ \ %l,%c%V\ %P
