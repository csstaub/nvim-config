" Common settings
set relativenumber
set ruler
set hidden
set timeoutlen=50
set showcmd

" Configure undo
set undodir=~/.config/nvim/undodir
set undofile
set undolevels=100
set undoreload=1000

" Configure backups
set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/backup

" Configure tab behavior
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set smartindent

" I like unicode
set termencoding=utf-8
set fileencoding=utf-8

" Change cursor shape between insert and normal mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Dein plugin manager
set runtimepath^=~/.config/nvim
set runtimepath^=~/.config/nvim/plugins/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.config/nvim/plugins'))
call dein#add('Shougo/dein.vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('chriskempson/base16-vim')
call dein#add('benekastah/neomake')
call dein#add('fatih/vim-go')
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-go', {'build': 'make'})
call dein#end()

" Install plugins on startup
if dein#check_install()
  call dein#install()
endif

" Key bindings
noremap <C-j> :bn<CR>
noremap <C-k> :bp<CR>
tnoremap <C-j> <C-\><C-n>:bn<CR>
tnoremap <C-k> <C-\><C-n>:bp<CR>

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
highlight WarningMsg ctermbg=3

let g:airline_theme = 'base16_tomorrow'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#checks = ['indent', 'trailing']
let g:neomake_airline = 1
let g:neomake_error_sign = {'text':'>>','texthl':'ErrorMsg'}
let g:neomake_warning_sign = {'text':'??','texthl':'WarningMsg'}
let g:neomake_open_list = 2
let g:neomake_list_height = 5
let g:go_fmt_command = "goimports"

set background=dark
colorscheme base16-tomorrow

" Syntax highlighing
syntax enable
filetype plugin indent on
autocmd! BufWritePost * Neomake
