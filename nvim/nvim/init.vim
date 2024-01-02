" 
" TODO
" * change color scheme
"

" Vim scripts
source $HOME/.config/nvim/vimscripts/keybindings.vim

" Lua scripts
source $HOME/.config/nvim/lua/lsp.lua
source $HOME/.config/nvim/lua/preferences.lua
source $HOME/.config/nvim/lua/plugins.lua

" Colors
"
" Reference: 
"   Pmenu – normal item
"   PmenuSel – selected item
"   PmenuSbar – scrollbar
"   PmenuThumb – thumb of the scrollbar
"

colorscheme wal
set background=light
highlight Pmenu ctermbg=LightCyan guibg=White
highlight StatusLine ctermbg=LightCyan
highlight Syntax ctermbg=LightCyan
"highlight IncSearch ctermbg=white guibg=black
"set background=dark
"syntax enable
"highlight  ctermbg=LighMagenta
"highlight SpellBad ctermbg=dsfs

set number
set nowrap
