if !hasmapto('<Plug>CRV_CRefVimVisual')
    vmap <silent> <unique> <Leader>rr <Plug>CRV_CRefVimVisual
endif
if !hasmapto('<Plug>CRV_CRefVimNormal')
    nmap <silent> <unique> <Leader>rr <Plug>CRV_CRefVimNormal
endif
if !hasmapto('<Plug>CRV_CRefVimAsk')
    map <silent> <unique> <Leader>rw <Plug>CRV_CRefVimAsk
endif
if !hasmapto('<Plug>CRV_CRefVimInvoke')
    map <silent> <unique> <Leader>rc <Plug>CRV_CRefVimInvoke
endif

