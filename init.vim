" Common settings
set relativenumber
set ruler
set hidden
set timeoutlen=50

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

" Dein plugin manager
set runtimepath^=~/.config/nvim
set runtimepath^=~/.config/nvim/plugins/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.config/nvim/plugins'))
call dein#add('Shougo/dein.vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('benekastah/neomake')
call dein#add('fatih/vim-go')
call dein#end()

" Install plugins on startup
if dein#check_install()
  call dein#install()
endif

" Key bindings
noremap <C-j> :bn<CR>
noremap <C-k> :bp<CR>

" Theme
let g:solarized_base16 = 1
let g:airline_theme = 'custom_solarized'
let g:airline_solarized_bg = 'dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#checks = ['indent', 'trailing']
let g:neomake_airline = 1
let g:neomake_error_sign = {'text':'>>','texthl':'ErrorMsg'}
let g:neomake_warning_sign = {'text':'>>','texthl':'ErrorMsg'}
let g:neomake_open_list = 2
let g:neomake_list_height = 5

colorscheme solarized
set background=dark

" Syntax highlighing
syntax enable
filetype plugin indent on
autocmd! BufWritePost * Neomake
