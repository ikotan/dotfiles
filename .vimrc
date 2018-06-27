" NeoBunlde.vimで管理してるpluginを読み込む
source ~/.vimrc.bundle

" プラグインに依存するアレ
source ~/.vimrc.plugins_setting

" キャッシュファイル用
set backupdir=/tmp

" crontabをvimで開くため
set backupskip=/tmp/*,/private/tmp/*

"------------------------------------------------------------
" 基本設定 Config
"------------------------------------------------------------
" キーマップリーダー
let mapleader = ","
" スクロール時の余白確保
set scrolloff=5
" 一行に長い文章を書いていても自動折り返しをしない
set textwidth=0
" 他で書き換えられたら自動で読み直す
set autoread
" 編集中でも他のファイルを開けるようにする
set hidden
" バックスペースでなんでも消せるように
set backspace=indent,eol,start
" テキスト整形オプション，マルチバイト系を追加
set formatoptions=lmoq
" viminfoファイルの設定
set viminfo='50,<1000,s100,\"50
" モードラインは無効
set modelines=0

" OSのクリップボードを使用する
set clipboard=unnamed

"------------------------------------------------------------
" 表示 Apperance
"------------------------------------------------------------
" 括弧の対応をハイライト
set showmatch
" 対応する括弧や部レース「% 」で移動
set matchpairs=(:),{:},[:],<:>
" ウィンドウの幅を超える行の折り返し設定"
"set nowrap
" 行番号表示
set number
" 不可視文字表示
set list
" 不可視文字の表示形式
set listchars=tab:>.,trail:_,extends:>,precedes:< 
" コマンドをステータス行に表示
set showcmd
" 現在のモードを表示
set showmode

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" カーソル行をハイライト
set cursorline

" 高速ターミナル接続を行う
set ttyfast

"------------------------------------------------------------
" インデント Indent
"------------------------------------------------------------

" 自動でインデント
set autoindent
" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set smartindent

" <TAB>を空白に変換
set expandtab

" <TAB>を含むファイルを開いた際、<TAB>を何文字の空白に変換するかを設定。
set tabstop=2

" vimが自動でインデントを行った際、設定する空白数。
set shiftwidth=2

" キーボードで<TAB>を入力した際、<TAB>を何文字の空白に変換するかを設定。
set softtabstop=0

if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on

  "各設定内容を読み込み
  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType scss       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType typescript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType coppffee   setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et

endif

" perltidyで全体を整形
map <Space>pt <Esc>:%! perltidy<CR>
" perltidyで指定範囲を整形
map <Space>pp <Esc>:'<,'>! perltidy<CR>

"------------------------------------------------------------
" 補完・履歴 Complete
"------------------------------------------------------------
" コマンド補完を強化
set wildmenu
" コマンド補完を開始するキー
set wildchar=<tab>
" リスト表示，最長マッチ
set wildmode=list:full
" コマンド・検索パターンの履歴数
set history=1000
" 補完に辞書ファイル追加
set complete+=k

"-------------------------------------------------------------------------------
" タグ関連 Tags
"-------------------------------------------------------------------------------
if has("autochdir")
  " 編集しているファイルのディレクトリに自動で移動
  set autochdir
  set tags=tags;
else
  set tags=./tags,./../tags,./*/tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags
endif
set notagbsearch

"-------------------------------------------------------------------------------
" 検索設定 Search
"-------------------------------------------------------------------------------
" 最後まで検索したら先頭へ戻る
set wrapscan
" 大文字小文字無視
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" インクリメンタルサーチ
set incsearch
" 検索文字をハイライト
set hlsearch

"Escの2回押しでハイライト消去
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

"sgでカーソル下のコマンドを検索
nnoremap <expr> sg ':/' . expand('<cword>') . '/'
"選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" Ctrl-iでヘルプ
nnoremap <C-i>  :<C-u>help<Space>
" カーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

"-------------------------------------------------------------------------------
" 移動設定 Move
"-------------------------------------------------------------------------------
" insert mode でjjでesc
inoremap jj <Esc>

" 0, 9で行頭、行末へ
nnoremap 1 ^
nnoremap 9 $

" インサートモードでもhjklで移動（Ctrl押すけどね）
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 最後に編集された位置に移動
nnoremap gb '[
nnoremap gp ']

" 最後に変更されたテキストを選択する
nnoremap gc  `[v`]
vnoremap gc <C-u>normal gc<Enter>
onoremap gc <C-u>normal gc<Enter>

" 対応する括弧に移動
nnoremap ' %

" 矩形選択で自由に移動する
set virtualedit+=block

"ビジュアルモード時vで行末まで選択
vnoremap v $h

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Shift-hjklでフレームサイズ調整
nnoremap <S-j> <C-w>+
nnoremap <S-k> <C-w>-
nnoremap <S-l> <C-w>>
nnoremap <S-h> <C-w><

"-------------------------------------------------------------------------------
" カラー関連 Colors
"-------------------------------------------------------------------------------
" ハイライト on
syntax enable

" 背景のメインをdark
set background=dark

colorscheme molokai

" let g:solarized_termtrans=1
" colorscheme solarized

"-------------------------------------------------------------------------------
" 編集関連 Edit
"-------------------------------------------------------------------------------

" yeでそのカーソル位置にある単語をレジスタに追加
nnoremap ye :let @"=expand("<cword>")<CR>

"  Insert mode中で単語単位/行単位の削除をアンドゥ可能にする
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>

" ペーストモード
nnoremap sp :set paste!<Enter>

" カーソル位置の単語をyankする
nnoremap vw viw

" カーソルから行頭まで削除
nnoremap <silent> <C-d> d0

" カーソル下の単語削除
nnoremap de diw

" カーソル下のブロック削除
nnoremap dp dap

" カーソル下のブロックコピー
nnoremap vp vip

" 全行選択
nnoremap val ggVG

" 全行整形
nnoremap qt gg=G

" 括弧を自動補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>

" 保存時に行末の空白を除去する
" autocmd BufWritePre * :%s/\s\+$//ge

" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge

" ビジュアルモードでインデント移動
vnoremap > >gv
vnoremap < <gv

noremap <space>pf :!yapf -i %<Enter>

"-------------------------------------------------------------------------------
" エンコーディング関連 Encoding
"-------------------------------------------------------------------------------
" 改行文字
set ffs=unix,dos,mac
" デフォルトエンコーディング
set encoding=utf-8
scriptencoding utf-8
" 文字コードの変換ショートカット
noremap <space>utf :e ++enc=utf-8

" cvsの時は文字コードをeuc-jpに設定
autocmd FileType cvs :set fileencoding=euc-jp
" 以下のファイルの時は文字コードをutf-8に設定
autocmd FileType svn   :set fileencoding=utf-8
autocmd FileType js    :set fileencoding=utf-8
autocmd FileType css   :set fileencoding=utf-8
autocmd FileType scss  :set fileencoding=utf-8
autocmd FileType html  :set fileencoding=utf-8
autocmd FileType xml   :set fileencoding=utf-8
autocmd FileType java  :set fileencoding=utf-8
autocmd FileType scala :set fileencoding=utf-8
autocmd FileType perl  :set fileencoding=utf-8
autocmd FileType ruby  :set fileencoding=utf-8
autocmd FileType sql   :set fileencoding=utf-8
autocmd FileType vim   :set fileencoding=utf-8
autocmd FileType yaml  :set fileencoding=utf-8
autocmd FileType zsh   :set fileencoding=utf-8

" ワイルドカードで表示するときに優先度を低くする拡張子
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
" ファイルタイプの変換ショートカット
noremap <space>ap     :setfiletype apache
noremap <space>css    :setfiletype css
noremap <space>scss   :setfiletype scss
noremap <space>diff   :setfiletype diff
noremap <space>eruby  :setfiletype eruby
noremap <space>html   :setfiletype html
noremap <space>java   :setfiletype java
noremap <space>js     :setfiletype javascript
noremap <space>perl   :setfiletype perl
noremap <space>php    :setfiletype php
noremap <space>python :setfiletype python
noremap <space>ruby   :setfiletype ruby
noremap <space>sh     :setfiletype sh
noremap <space>sql    :setfiletype sql
noremap <space>vim    :setfiletype vim
noremap <space>xml    :setfiletype xml
noremap <space>zsh    :setfiletype zsh
noremap <space>scala  :setfiletype scala
noremap <space>ng     :setfiletype nginx
noremap <space>ts     :setfiletype typescript
noremap <space>md     :setfiletype markdown
