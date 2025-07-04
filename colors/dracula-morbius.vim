" Dracula Morbius colorscheme for Neovim
" Maintainer: Alek Borowski (happyRip)
" License: MIT

if exists('g:colors_name')
  highlight clear
endif

if exists('syntax_on')
  syntax reset
endif

lua require('dracula').morbius()

let g:colors_name = 'dracula-morbius'
