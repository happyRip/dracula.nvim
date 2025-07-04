" Dracula Van Helsing colorscheme for Neovim
" Maintainer: Alek Borowski (happyRip)
" License: MIT

if exists('g:colors_name')
  highlight clear
endif

if exists('syntax_on')
  syntax reset
endif

lua require('dracula').van_helsing()

let g:colors_name = 'dracula-van_helsing'
