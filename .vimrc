"----------------------------
"基本設定
"----------------------------
syntax on
set number
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set showtabline=2
set autoindent
set smartindent
set nobackup
set noswapfile
set noundofile
set clipboard=unnamed,autoselect
set list
set listchars=tab:>-,trail:.
" set transparency=5
set imdisable
set guioptions-=T
set antialias
set visualbell t_vb=
set nowrapscan
set columns=100
set lines=48
"----------------------------
"要らないファイル
"----------------------------
set directory=/tmp
set directory=~/.vim/tmp
set directory=.
set backupdir=/tmp
set backupdir=~/.vim/tmp
set backupdir=.
set undodir=~/.vim/tmp


"----------------------------
"** カラースキーマ設定 **
"----------------------------
set t_Co=256
colorscheme summerfruit256
"let g:molokai_original=1
"set background=light

"-------------------------
"NERDTreeToggleのショートカット変更
"-------------------------
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"

" NERDTreeを設定
NeoBundle 'scrooloose/nerdtree'

" autoclose 自動閉じ括弧
NeoBundle 'Townk/vim-autoclose'

" emmet
NeoBundle 'mattn/emmet-vim'

" autosave
" NeoBundle 'vim-scripts/vim-auto-save'

" git連携
NeoBundle 'tpope/vim-fugitive'

" インデントに色をつけて見やすく
NeoBundle 'nathanaelkane/vim-indent-guides'

" html, css, js見やすく
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
" NeoBundle 'vim-javascript'

" tagを囲んで挿入
NeoBundle 'surround.vim'

" 補完
NeoBundle "Shougo/neocomplete.vim"

" 各言語のlintでシンタックスチェック
NeoBundle 'scrooloose/syntastic'

" コメントアウトをトグルできる
NeoBundle 'tyru/caw.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------
"------------------------
" 自動保存
"------------------------
" let g:auto_save = 1
"------------------------
"vim-indent-guides 自動起動
"------------------------
let g:indent_guides_enable_on_vim_startup = 1

