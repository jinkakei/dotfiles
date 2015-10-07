
"Plugins by NeoBundle
"filetype plugin indent off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
end

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'tpope/vim-endwise'
  "ToDo: change autoindent width

call neobundle#end()

filetype plugin indent on


"##### display #####
set number "line number
set title "show file title
"set tabstop=4 "display tab as 4 space
set tabstop=2 "display tab as 2 space ( for ruby coding format)
set shiftwidth=4 "number of space for autoindent
set expandtab "input space when you push tab
set autoindent "based on previous line
"set smartindent "sophisticated autoindent
"set cindent "more sophisticated autoindent for C programming
"set indentexpr "expert autindent with Vim script
set nowrap "do not show long line

"##### search #####
set ignorecase "ignore upper/lower case characters
set smartcase  "don't ignore if keyword contains upper case characters.
set hlsearch " highlight searched characters

"##### cursor #####
set whichwrap=b,s,h,l,<,>,[,] " move linetail to linetop
    " this setting has to put after set nocompatible, compatible
set showmatch "jump to opened kakko if closed kakko is inputed
set scrolloff=8 "display moves with cursor

"##### etc #####
set mouse=a "enable input from mouse
set hidden "enable open another file if unsaved files exist
set history=10000
set clipboard=unnamed,autoselect "use clipboard ( unable in KUDPC default vim)
"ERROR -- set iminsert=2 "off IME when exit from insert mode
"close brackets autmatically
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ` ``<LEFT>
"counter for typo
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap `` ``<LEFT>


"
"nnoremap ruby :!ruby %
nnoremap ruby :write<CR>:!ruby %

"keymap

"##### default in KUDPC ( /etc/vimrc ) #####
" TODO yank whole file and cut confilicting ones
"syntax enable "
"set nocompatible "use vim setting (not vi)
    " !CAUTION!: This resets some settings.
"set showmode "display current mode
"set ruler "show current line & column
"set confirm "confirm before quit if unsaved files exist


