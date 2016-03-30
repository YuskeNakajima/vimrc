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
set showcmd
set clipboard=unnamed,autoselect
set list
set listchars=tab:>-,trail:Ω
set wrapscan
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set scrolloff=3
set hlsearch
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
"-------------------------
"NERDTreeToggleのショートカット変更
"-------------------------
nnoremap <silent><C-e> :NERDTreeToggle<CR>
"------------------------
"vim-indent-guides 自動起動
"------------------------
let g:indent_guides_enable_on_vim_startup = 1
"------------------------
"neosnippet設定
"------------------------
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"---------------------------
" neocomplete設定
"---------------------------
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
"---------------------------
"---------------------------
" Start Neobundle Settings.
"---------------------------
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

" git連携
NeoBundle 'tpope/vim-fugitive'

" インデントに色をつけて見やすく
NeoBundle 'nathanaelkane/vim-indent-guides'

" html, css, js見やすく
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'

" tagを囲んで挿入
NeoBundle 'surround.vim'

" 補完
NeoBundle "Shougo/neocomplete.vim"
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" 各言語のlintでシンタックスチェック
NeoBundle 'scrooloose/syntastic'

" コメントアウトをトグルできる
NeoBundle 'tyru/caw.vim'

" ruby・rails系
" vim-surroundの機能を拡張 erb形式のタグを使える
NeoBundle 'tpope/vim-rails'

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
NeoBundleCheck

"-------------------------
"-------------------------
" End Neobundle Settings.
"-------------------------
"-------------------------
