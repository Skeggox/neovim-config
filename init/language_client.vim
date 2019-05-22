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
