"----------------------------
"基本設定
"----------------------------
syntax on
set number
set expandtab
set colorcolumn=80
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
set scrolloff=10
set hlsearch
set clipboard+=unnamed
"---------------------------
" markdown
"---------------------------
au BufRead,BufNewFile *.md set filetype=markdown
"---------------------------
"インサートモードキーマップ
"---------------------------
"insert mode時，c-aで行頭に移動
inoremap <c-a> <home>
"insert mode時，c-eで行末に移動
inoremap <c-e> <End>
"insert mode時，c-dでDelete
inoremap <c-d> <del>
"insert mode時，c-kでkill(カーソルから行末まで削除し，クリップボードに貼る)
inoremap <c-k> <esc>lc$
"insert mode時，c-fでカーソルを右に移動させる
inoremap <c-f> <right>
"insert mode時，c-bでカーソルを左に移動させる
inoremap <c-b> <left>
"---------------------------
"コマンドラインモードキーマップ
"---------------------------
cnoremap <C-a> <Home>
" 一文字戻る
cnoremap <C-b> <Left>
" カーソルの下の文字を削除
cnoremap <C-d> <Del>
" 行末へ移動
cnoremap <C-e> <End>
" 一文字進む
cnoremap <C-f> <Right>
" コマンドライン履歴を一つ進む
cnoremap <C-n> <Down>
" コマンドライン履歴を一つ戻る
cnoremap <C-p> <Up>
" 前の単語へ移動
cnoremap <M-b> <S-Left>
" 次の単語へ移動
cnoremap <M-f> <S-Right>
"---------------------------
" バッファ　キーマップ変更
"---------------------------
nnoremap <silent>ls :ls<CR>
nnoremap <silent>bp :bprevious<CR>
nnoremap <silent>bn :bnext<CR>
nnoremap <silent>bb :b#<CR>
nnoremap <silent>bf :bf<CR>
nnoremap <silent>bl :bl<CR>
nnoremap <silent>bm :bm<CR>
nnoremap <silent>bd :bdelete<CR>
"---------------------------
" YankRound.vimキーマップ
"---------------------------
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-i> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
"---------------------------
" 挿入モード時、ステータスラインの色を変更
"---------------------------
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
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
nnoremap <silent><Space>e :NERDTreeToggle<CR>
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

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" ruby・rails系
" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

" vim-surroundの機能を拡張 erb形式のタグを使える
NeoBundle 'tpope/vim-rails'

" markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" 検索効率化
NeoBundle "ctrlpvim/ctrlp.vim"

" slimシンタックスハイライト
NeoBundle "slim-template/vim-slim"

" ヤンクの履歴を管理
NeoBundle 'LeafCage/yankround.vim'

" coffeescriptシンタックスハイライト                                               
NeoBundle 'kchmck/vim-coffee-script' 

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
