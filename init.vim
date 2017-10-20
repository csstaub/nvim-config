" Common settings
set relativenumber
set ruler
set hidden
set timeoutlen=50
set showcmd
set mouse=a

" Configure undo
set undodir=~/.config/nvim/undodir
set undofile
set undolevels=100
set undoreload=1000

" Configure backups
set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/backup
set backupskip=/tmp/*,/private/tmp/*

" Configure tab behavior
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set smartindent

" I like unicode
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" Change cursor shape between insert and normal mode
set termguicolors

" Dein plugin manager
set runtimepath^=~/.config/nvim
set runtimepath^=~/.config/nvim/plugins/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.config/nvim/plugins'))
  call dein#begin(expand('~/.config/nvim/plugins'))
  call dein#add('Shougo/dein.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('jlesquembre/base16-neovim')
  call dein#add('benekastah/neomake')
  call dein#add('fatih/vim-go')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-go', {'build': 'make'})
  call dein#end()
  call dein#save_state()
endif

" fzf (via brew)
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'down': '~20%' }

" Install plugins on startup
if dein#check_install()
  call dein#install()
endif

" Key bindings
noremap <C-j> :bn<CR>
noremap <C-k> :bp<CR>
noremap <C-f> :FZF<CR>
tnoremap <C-j> <C-\><C-n>:bn<CR>
tnoremap <C-k> <C-\><C-n>:bp<CR>
tnoremap <C-f> <C-\><C-n>:FZF<CR>

" Window navigation
" Option + h/j/kl
tnoremap ˙ <C-\><C-N><C-w>h
tnoremap ∆ <C-\><C-N><C-w>j
tnoremap ˚ <C-\><C-N><C-w>k
tnoremap ¬ <C-\><C-N><C-w>l
inoremap ˙ <C-\><C-N><C-w>h
inoremap ∆ <C-\><C-N><C-w>j
inoremap ˚ <C-\><C-N><C-w>k
inoremap ¬ <C-\><C-N><C-w>l
nnoremap ˙ <C-w>h
nnoremap ∆ <C-w>j
nnoremap ˚ <C-w>k
nnoremap ¬ <C-w>l

cabbrev GI GoImport
cabbrev GA GoAlternate
cabbrev GT GoTest
cabbrev GR GoRun
cabbrev GB GoBuild

" Hide quickfix from buffer list so bn/bp doesn't cycle into it
augroup QFix
  autocmd!
  autocmd FileType qf setlocal nobuflisted
augroup END

" Autocompletion
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 3
let g:deoplete#max_list = 10
autocmd! CompleteDone * pclose

" Theme
"highlight WarningMsg ctermbg=3

let g:airline_theme = 'base16_tomorrow'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#checks = ['indent', 'trailing']
let g:neomake_airline = 1
let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_javascript_eslint_maker = {'args': ['--no-color', '--format'], 'errorformat': '%f: line %l\, col %c\, %m'}
let g:neomake_error_sign = {'text':'!','texthl':'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text':'>','texthl':'NeomakeWarningSign'}
let g:neomake_info_sign = {'text':'i','texthl':'NeomakeInfoSign'}
let g:neomake_open_list = 2
let g:neomake_list_height = 5
let g:go_fmt_command = "goimports"

" Base16 tomorrow night terminal colors
let g:terminal_color_0 = "#1d1f21"
let g:terminal_color_1 = "#cc6666"
let g:terminal_color_2 = "#b5bd68"
let g:terminal_color_3 = "#f0c674"
let g:terminal_color_4 = "#81a2be"
let g:terminal_color_5 = "#b294bb"
let g:terminal_color_6 = "#8abeb7"
let g:terminal_color_7 = "#c5c8c6"
let g:terminal_color_8 = "#969896"
let g:terminal_color_9 = "#cc6666"
let g:terminal_color_10 = "#b5bd68"
let g:terminal_color_11 = "#f0c674"
let g:terminal_color_12 = "#81a2be"
let g:terminal_color_13 = "#b294bb"
let g:terminal_color_14 = "#8abeb7"
let g:terminal_color_15 = "#ffffff"
let g:terminal_color_background = "#1d1f21"
let g:terminal_color_foreground = "#c5c8c6"

let base16colorspace=256
colorscheme base16-tomorrow-night

" Syntax highlighing
syntax enable
filetype plugin indent on
autocmd! BufWritePost * Neomake
