" Dracula colorscheme for Neovim
" Maintainer: Alek Borowski (happyRip)
" License: MIT

if exists('g:colors_name')
  highlight clear
endif

if exists('syntax_on')
  syntax reset
endif

lua require('dracula').load()

let g:colors_name = 'dracula'
