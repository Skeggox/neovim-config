" Jan Lotz
" Plugins configuration 

" Setup plugin manager
let g:plug_file = expand('$XDG_CONFIG_HOME/nvim/autoload/plug.vim')

" TODO: Figure out why this breaks nvim-qt
"if !filereadable(g:plug_file)
"  exec '!curl -fLo '.g:plug_file.' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"endif

" Configure plugins
call plug#begin('~/.local/share/nvim/plugged')

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
let g:neomake_logfile = expand('$XDG_RUNTIME_DIR/logs/neomake.log')
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


"set hidden
"let g:LanguageClient_serverCommands = {
"    \ 'cpp': ['cquery.exe', '--language-server']
"    \ }
"let g:LanguageClient_trace = messages
"let g:LanguageClient_windowLogMessageLevel = Info
"let g:LanguageClient_loggingLevel = DEBUG

"nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

set statusline=%<%f%h%m%r%w%=%y\ %{fugitive#statusline()}%=%b\ 0x%B\ \ %l,%c%V\ %P
