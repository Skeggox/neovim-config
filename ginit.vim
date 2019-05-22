" Jan Lotz

" Colors 
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

let g:rehash256 = 1
colorscheme molokai

" Guifont DejaVuSansMonoForPowerline\ NF:h12
GuiFont Hack:h12

" Menu
"set guioptions+=M
