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
"Plug 'tpope/sensible'
"Plug 'tpope/sleuth.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim', { 'do': ['./install --all'] }
Plug 'sheerun/vim-polyglot'
Plug 'vim-utils/vim-man'
Plug 'svermeulen/vim-easyclip'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

" UI
" Plug 'joshdick/onedark.vim'
" Plug 'vim-airline'

" Development
" Plug 'sakhnik/nvim-gdb', { 'do': './install.sh' } problems installing
" luarocks
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
" Plug 'neoclide/coc.nvim'
Plug 'neomake/neomake'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': './install.sh' }

" Language specific
Plug 'SidOfc/mkdx'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

call plug#end()

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"let g:neomake_logfile = expand('$XDG_RUNTIME_DIR/logs/neomake.log')
"let g:neomake_cpp_enabled_makers = ["clang"]
" Pick one of following
" When writing a buffer (no delay).
 "call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
 "call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
 "call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
"call neomake#configure#automake('nrwi', 500)

let g:deoplete#enabled_at_startup = 1
"let g:deoplete#sources#clang#autofill_neomake = 1

inoremap <silent><expr><TAB> 
    \ pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr><S-TAB> 
    \ pumvisible() ? "\<C-p>" : "\<S-TAB>"

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

    function LC_maps()
      if has_key(g:LanguageClient_serverCommands, &filetype)
        nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
        nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
        nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
        set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
      endif
    endfunction

    " autocmd FileType * call LC_maps()

let g:LanguageClient_serverCommands = {}
" Language Servers

if executable('ccls')
    let g:LanguageClient_serverCommands['c']    = ['ccls', '--log-file=/tmp/ccls.log']
    let g:LanguageClient_serverCommands['cpp']  = ['ccls', '--log-file=/tmp/ccls.log'] 
    let g:LanguageClient_serverCommands['cuda'] = ['ccls', '--log-file=/tmp/ccls.log'] 
    let g:LanguageClient_serverCommands['objc'] = ['ccls', '--log-file=/tmp/ccls.log']
    let g:LanguageClient_hasSnippetSupport = 0
    nnoremap <silent>xh :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'L'})<cr>
    nnoremap <silent>xj :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'D'})<cr>
    nnoremap <silent>xk :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'U'})<cr>
    nnoremap <silent>xl :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'R'})<cr>
" bases
nn <silent> xb :call LanguageClient#findLocations({'method':'$ccls/inheritance'})<cr>
" bases of up to 3 levels
nn <silent> xB :call LanguageClient#findLocations({'method':'$ccls/inheritance','levels':3})<cr>
" derived
nn <silent> xd :call LanguageClient#findLocations({'method':'$ccls/inheritance','derived':v:true})<cr>
" derived of up to 3 levels
nn <silent> xD :call LanguageClient#findLocations({'method':'$ccls/inheritance','derived':v:true,'levels':3})<cr>

" caller
nn <silent> xc :call LanguageClient#findLocations({'method':'$ccls/call'})<cr>
" callee
nn <silent> xC :call LanguageClient#findLocations({'method':'$ccls/call','callee':v:true})<cr>

" $ccls/member
" nested classes / types in a namespace
nn <silent> xs :call LanguageClient#findLocations({'method':'$ccls/member','kind':2})<cr>
" member functions / functions in a namespace
nn <silent> xf :call LanguageClient#findLocations({'method':'$ccls/member','kind':3})<cr>
" member variables / variables in a namespace
nn <silent> xm :call LanguageClient#findLocations({'method':'$ccls/member'})<cr>

nn xx x

fu! C_init()
  setl formatexpr=LanguageClient#textDocument_rangeFormatting()
endf
au FileType c,cpp,cuda,objc :call C_init()

elseif executable('cquery')
    let g:LanguageClient_serverCommands['cpp'] = ['cquery', '--language-server'] 
endif

" https://github.com/angelozerr/lsp4xml
" https://github.com/EmmyLua/EmmyLua-LanguageServer

if executable('bash-language-server')
" npm i -g bash-language-server
    let g:LanguageClient_serverCommands['sh'] = ['bash-language-server', 'start']
endif

" let g:LanguageClient_trace = messages
" let g:LanguageClient_windowLogMessageLevel = Info
" let g:LanguageClient_loggingLevel = DEBUG

" autocmd CursorHold * silent call LanguageClient#textDocument_hover()
nnoremap <silent> <leader>lr :call LanguageClient#textDocument_references({'includeDeclaration': v:false})<CR>

nnoremap <silent> <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <C-R>      :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <leader>lf :call LanguageClient#textDocument_documentSymbol()<CR>

set statusline=%<%f%h%m%r%w%=%y\ %{fugitive#statusline()}%=%b\ 0x%B\ \ %l,%c%V\ %P
