
" ToDo: use Dein.vim instead of NeoBundle @ 2017-12-11
"  active development of NeoBundle is stopped
"
" Plugins by NeoBundle
"  How to add NeoBundle
"    $ mkdir -p ~/.vim/bundle
"    $ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
"    in vim
"      :NeoBundleInstall
"      :NeoBundleUpdate
" filetype plugin indent off
"
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
end

call neobundle#begin(expand('~/.vim/bundle/'))

" begin -- 2017-12-11: add neobudle
"     based on https://qiita.com/mktktmr/items/469654b8adc1e02a3956

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" convert from result of vimgrep
NeoBundle 'thinca/vim-qfreplace'

" previm
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" static analysis
NeoBundle 'scrooloose/syntastic'

" refer to document
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
 
" jump to point where method is defined
NeoBundle 'szw/vim-tags'
"
" show file tree
NeoBundle 'scrooloose/nerdtree'
"
" indent for yaml
NeoBundle 'chase/vim-ansible-yaml'
""
" navigation of Rails project
NeoBundle 'tpope/vim-rails'
""
" comment out
NeoBundle 'tpope/vim-commentary'
""
" color scheme
NeoBundle 'cocopon/iceberg.vim'

" highlight speace on linetail
NeoBundle 'bronson/vim-trailing-whitespece'

" visualize indent
NeoBundle 'Yggdroot/indentLine'

"
"NeoBundle
"

"NeoBundle
"

"NeoBundle
"
"
" end   -- 2017-12-11: add neobudle

" automatically insert end of block
NeoBundle 'tpope/vim-endwise'
" ToDo: change autoindent width

call neobundle#end()

filetype plugin indent on


" begin -- 2017-12-11: add neobudle settings
"-------------------------------------------------------------------------------
" NERDTree:

" .display file ( 1: display )
let NERDTreeShowHidden=1
" .display bookmark ( 1: display )
let g:NERDTreeShowBookmarks=1
" open NERDTree if ignite without arguments
" autocmd vimenter * if !argc() | NERDTree | endif
"
" switch on/off
nmap <silent> <C-n><C-t>      :NERDTreeToggle<CR>



"-------------------------------------------------------------------------------
" Previm:

"let g:previm_open_cmd = 'open -a FirefoxDeveloperEdition'
let g:previm_open_cmd = 'open -a iceweasal'

augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END



"-------------------------------------------------------------------------------
" rubocop:
" If syntastic_mode_map is active, run syntastic when save buffer
" order file type to active_filetypes in save file

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']



"-------------------------------------------------------------------------------
" refe:
let g:ref_refe_cmd = $HOME.'/.rbenv/shims/refe' "path of refe command
" !Caution! there is no such directory by k247 2017-12-11


" end   -- 2017-12-11: add neobudle settings


"##### display #####
set number "line number
set title "show file title
"set tabstop=2 "display tab as 2 space ( for ruby coding format)
set tabstop=4 "display tab as 4 space
set shiftwidth=4 "number of space for autoindent
set softtabstop=4 "display tab as 4 space
set expandtab "input space when you push tab
set autoindent "based on previous line
set smartindent "sophisticated autoindent
"set cindent "more sophisticated autoindent for C programming
"set indentexpr "expert autindent with Vim script
set nowrap "do not show long line

" 2017-12-11 add fileTypeIndent
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END


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



" #### highlight 2-byte space #####
""  add 2017-12-24
""  https://qiita.com/tmsanrinsha/items/d6c11f2b7788eb24c776
""  !Warning! this statement has to be done before colorscheme

" 不可視文字の表示
set list
" tab: »-
" 行末の空白: ･
" ノーブレークスペース: ⍽
" 画面の右側に文字があるとき: »
" 画面の左側に文字があるとき: «
set listchars=tab:»-,trail:･,nbsp:⍽,extends:»,precedes:«

augroup MyVimrc
    autocmd!
augroup END

augroup MyVimrc
    autocmd ColorScheme * highlight UnicodeSpaces cterm=underline ctermfg=59 ctermbg=16 gui=underline guifg=#465457 guibg=#000000
    autocmd VimEnter,WinEnter * match UnicodeSpaces /\%u180E\|\%u2000\|\%u2001\|\%u2002\|\%u2003\|\%u2004\|\%u2005\|\%u2006\|\%u2007\|\%u2008\|\%u2009\|\%u200A\|\%u2028\|\%u2029\|\%u202F\|\%u205F\|\%u3000/
augroup END

"" End: #### highlight 2-byte space ####



"##### key-mapping #####
"escape from insert mode
inoremap <silent> jj <ESC>
"inoremap <silent> <C-j> j "?
"inoremap <silent> kk <ESC>
"inoremap <silent> <C-k> k
"Consideration of key mapping: https://gist.github.com/deris/550128
nnoremap ; :
"nnoremap : ;
noremap <Space>h ^
noremap <Space>l $
noremap <Space>/ *
noremap <Space>m %
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
inoremap =b =begin<CR>=end

" begin -- add 2017-12-11
" insert yyyy/MM/dd
cnoremap date <ESC>a<C-r>=strftime("%Y/%m/%d")<CR><ESC>
" insert yyyy/MM/dd hh:mm:ss
cnoremap datetime <ESC>a<C-r>=strftime("%Y/%m/%d %H:%M:%S")<CR><ESC>
" 
" My arrange
inoremap date <C-r>=strftime("%Y/%m/%d")<CR>
inoremap datet <C-r>=strftime("%Y/%m/%d %H:%M:%S")<CR>
" End: My arrange for insert date
"
" check spell
"set spell
"set spelllang=en
"set spelllang=en,cjk
"  cannot download cjk
" matchit.vim
runtime macros/matchit.vim
" color
colorscheme iceberg
" end   -- add 2017-12-11

"keymap
"

"##### default in KUDPC ( /etc/vimrc ) #####
" TODO yank whole file and cut confilicting ones
syntax enable "
"set nocompatible "use vim setting (not vi)
    " !CAUTION!: This resets some settings.
set showmode "display current mode
set ruler "show current line & column
set confirm "confirm before quit if unsaved files exist

