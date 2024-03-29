" Jan Lotz
" COC configuration

inoremap <silent><expr><TAB>
    \ pumvisible() ? "\<C-n>" : 
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-r>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>x :CocCommand explorer<CR>
nmap <leader>t :CocCommand terminal.Toggle<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current
" paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature
" of languageserver.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)

xmap ic <Plug>(coc-classcobj-i)
omap ic <Plug>(coc-classcobj-i)
xmap ac <Plug>(coc-classcobj-a)
omap ac <Plug>(coc-classcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h
" coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <s-space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <s-space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <s-space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <s-space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <s-space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <s-space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <s-space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <s-space>p  :<C-u>CocListResume<CR>

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Some custom helper functions
fun! s:switchBetweenHeaderAndImplementation()
    if match(expand('%'), '\.\(c\|cc\|cpp\)$') > 0
        let target = 'header'
        let search_pattern = substitute(expand('%:t'), '\.c\(.*\)$', '.h*', '')
    elseif match(expand('%'), '\.\(h\|hpp\)$') > 0
        let target = 'implementation'
        let search_pattern = substitute(expand('%:t'), '\.h\(.*\)$', '.c*', '')
    else
        echo 'Failed to switch to header or implementation for this file'
        retu
    endif

    let dir_name = fnamemodify(expand('%:p'), ':h')
    let cmd = 'find ' . dir_name .  ' . -type f ' .
    \ '-iname ' . search_pattern . ' -print -quit'
    let file_name = substitute(system(cmd), '\n$', '', '')
    if filereadable(file_name)
    exe 'e ' file_name
    else
    echo 'No ' . target . ' file found for ' . expand('%:t')
    endif
endf
nnoremap <silent> <leader>o :call <SID>switchBetweenHeaderAndImplementation()<CR>

let g:projectionist_heuristics = { "*.c|*.h": {"make": "make -C {project}/build"} }
