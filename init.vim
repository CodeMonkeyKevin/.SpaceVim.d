if has("termguicolors")
  set termguicolors
endif

" Chane GuiFonts
" set guifont=SauceCodePro\ Nerd\ Font:h16
let g:spacevim_guifont = 'SauceCodePro\ Nerd\ Font:h16'

" loaded ui layer
call SpaceVim#layers#load('ui')
call SpaceVim#layers#load('lang#go')

" Highlight/Underline trailing whitespace
autocmd ColorScheme * hi ExtraWhitespace guifg=#FF2626 gui=underline ctermfg=198 cterm=underline

" Trim whitespace on save
let g:strip_whitespace_on_save = 1

" Enable Syntax checking
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go', 'ruby', 'javascript'] }
let g:syntastic_javascript_checkers = ['jshint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Space/Tab settings
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" Vim-Go Settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

" Set window size
if has("gui_running")
  set lines=45 columns=200
  set transparency=3
endif

" add custom plugins.
let g:spacevim_custom_plugins = [
 \ ['flazz/vim-colorschemes'],
 \ ['ntpeters/vim-better-whitespace', {'merged': 0}],
 \ ['vim-syntastic/syntastic', {'merged': 0}],
 \ ['ryanoasis/vim-devicons'],
 \ ]

let g:spacevim_colorscheme_bg = 'dark'
let g:one_allow_italics = 1
let g:spacevim_colorscheme = "one"

" Set default working folder
cd ~/Code

" Disable VimFiler window on start up
let g:spacevim_enable_vimfiler_welcome = 0

" Enable rails auto complete
let g:rubycomplete_rails = 1

" Change leader to ,
let mapleader = ","

" Vim Airline theme
let g:airline_theme='one'
let g:airline_powerline_fonts = 1

" Indentation guides
set listchars=tab:\¦\ 
set list

" SpecialKey highlight
autocmd ColorScheme * hi SpecialKey term=bold ctermfg=16 guifg=#09AA08

" ChooseWin plugin setting
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

set transparency=3

let g:deoplete#auto_complete_delay = 150
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_os_fileformat_icon = 1

let g:ctrlp_working_path_mode = 'ra'

set shell=/bin/bash

let g:webdevicons_enable_vimfiler = 1