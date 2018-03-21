set encoding=utf8

" Set Truecolors
if has("termguicolors")
  set termguicolors
endif

if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Change GuiFonts
" if has("gui_running")
"   set macligatures
" endif

if !has("gui_vimr")
  " let g:spacevim_guifont = 'Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h16'
  let g:spacevim_guifont = 'Iosevka\ X\ Light\ Nerd\ Font\ Complete\ Mono:h16'
endif

" Set window size
if has("gui_running")
  set lines=45 columns=180
  set transparency=3
endif

" add custom plugins.
let g:spacevim_custom_plugins = [
 \ ['ntpeters/vim-better-whitespace', {'merged': 0}],
 \ ['vim-syntastic/syntastic', {'merged': 0}],
 \ ['Yggdroot/indentLine', {'merged': 0}],
 \ ['dracula/vim', {'merged': 0}],
 \ ['ryanoasis/vim-devicons']
 \ ]

" loaded ui layer
call SpaceVim#layers#load('ui')
call SpaceVim#layers#load('lang#go')
call SpaceVim#layers#load('lang#ruby')
call SpaceVim#layers#load('ctrlp')
call SpaceVim#layers#disable('core#statusline')
call SpaceVim#layers#disable('core#tabline')

" Colorscheme
let g:spacevim_colorscheme = "dracula"
let g:spacevim_colorscheme_bg = 'dark'
hi Comment cterm=italic

" Highlight/Underline trailing whitespace
autocmd ColorScheme * hi ExtraWhitespace guifg=#FF2626 gui=underline ctermfg=198 cterm=underline

" Trim whitespace on save
let g:strip_whitespace_on_save = 1

" Enable Syntax checking
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go', 'ruby', 'javascript'] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_scss_checkers = ['compass']

" syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Space/Tab settings
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" Ag for fast file search
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

" Vim-Go Settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

" Set default working folder
cd ~/Code

" Disable VimFiler window on start up
let g:spacevim_enable_vimfiler_welcome = 0

" Enable rails auto complete
let g:rubycomplete_rails = 1

" Change leader to ,
let mapleader = ","

" SpecialKey highlight
" autocmd ColorScheme * hi SpecialKey term=bold ctermfg=16 guifg=#09AA08

" ChooseWin plugin setting
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

let g:deoplete#auto_complete_delay = 150

let g:webdevicons_enable = 1
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_os_fileformat_icon = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_statusline = 1

let g:ctrlp_working_path_mode = 'ra'

set shell=/bin/bash

if $TERM_PROGRAM == 'Apple_Terminal'
  let g:spacevim_enable_guicolors = 1
endif

" Close a buffer without closing the window
" map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>.

let g:spacevim_statusline_unicode_symbols = 1
let g:spacevim_windows_index_type = 3
let g:spacevim_buffer_index_type = 4

let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}

" add jbuilder syntax highlighting
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

let g:indent_guides_enable_on_vim_startup = 1

" Softwrap
set wrap linebreak nolist

" Indentation guides on tabs
set list lcs=tab:\┆\ 
set list