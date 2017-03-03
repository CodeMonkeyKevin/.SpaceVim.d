" Disable True Colors
let g:spacevim_enable_guicolors = 0

" Chane GuiFonts
set guifont=Source\ Code\ Pro\ for\ Powerline:h16

" add custom plugins.
let g:spacevim_custom_plugins = [
 \ ['flazz/vim-colorschemes'],
 \ ['ntpeters/vim-better-whitespace', {'merged': 0}],
 \ ['vim-syntastic/syntastic', {'merged': 0}],
 \ ]

" Set Color
let g:spacevim_colorscheme = "codeschool"

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
  set lines=38 columns=110
endif

" Set default working folder
cd ~/Code

" Disable VimFiler window on start up
let g:spacevim_enable_vimfiler_welcome = 0
