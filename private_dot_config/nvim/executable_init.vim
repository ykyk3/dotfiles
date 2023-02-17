filetype plugin on
set mouse=a
set helplang=ja,en

" Install Plugin
call plug#begin('~/.vim/plugged')
Plug 'vim-denops/denops.vim'

Plug 'lambdalisue/fern.vim'
  Plug 'yuki-yano/fern-preview.vim'
  Plug 'lambdalisue/fern-renderer-nerdfont.vim'
  Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/gin.vim'
Plug 'vim-jp/vimdoc-ja'
" Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', {'dir': '~/.fzf_bin', 'do': './install --all'}
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'skanehira/jumpcursor.vim'
Plug 'thinca/vim-quickrun'

Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'

Plug 'tomasr/molokai'
" アイコンフォント
Plug 'lambdalisue/nerdfont.vim'
  Plug 'lambdalisue/glyph-palette.vim'
call plug#end()

" set options
set termguicolors

" map prefix
let g:mapleader = "\<Space>"
nnoremap <Leader> <Nop>
xnoremap <Leader> <Nop>
nnoremap [dev]    <Nop>
xnoremap [dev]    <Nop>
nmap     m        [dev]
xmap     m        [dev]
nnoremap [ff]     <Nop>
xnoremap [ff]     <Nop>
nmap     z        [ff]
xmap     z        [ff]


" auto reload init.vim
" augroup source-vimrc
"   autocmd!
"   autocmd BufWritePost *init.vim source $MYVIMRC | set foldmethod=marker
" augroup END

colorscheme molokai

" use rip grep
if executable('rg')
  let &grepprg = 'rg --vimgrep --hidden'
  set grepformat=%f:%l:%c:%m
endif

" ファイルツリーの表示形式、1にするとls -laのような表示になります
let g:netrw_liststyle=1
" ヘッダを非表示にする
" let g:netrw_banner=0
" サイズを(K,M,G)で表示する
let g:netrw_sizestyle="H"
" 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
" プレビューウィンドウを垂直分割で表示する
let g:netrw_preview=1

" 設定ファイルを開く
nmap <F1> :tabnew $MYVIMRC<CR>

"vimが出力するファイルの出力先
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
if !has('nvim')
  let viminfo+=n~/.vim/.viminfo.txt
endif

" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
"set nobackup
" スワップファイルを作らない
"set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

" 見た目系
" 行番号を表示
set number
" 行数表示を早退的に
set relativenumber!
" 絶対表示とトグルする
map <F12> :set relativenumber!<CR>

" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2

" Tab系
if !exists('g:vscode')
  " コマンドラインの補完
  " set wildmode=list:longest
  set wildmode=longest,list,full
  set wildmenu
  " 全角文字が崩れる対応
  set ambiwidth=double

  " Tab系
  " Tab文字を半角スペースにする
  set expandtab
  " 行頭以外のTab文字の表示幅（スペースいくつ分）
  set tabstop=2
  " 行頭でのTab文字の表示幅
  set shiftwidth=2
endif


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" クリップボード
set clipboard+=unnamed

" ヤンクした時にハイライトする
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup END

" nnoremap g V :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
" nnoremap g S :split<CR> :exe("tjump ".expand('<cword>'))<CR>

syntax on

" 可視化
if !exists('g:vscode')
  " ordinary neovim
   set list
   set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
endif

" S bind
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

" terminal settings
tnoremap <silent> <ESC> <C-\><C-n>
set sh=zsh

" " ================ Source other Configs ====================
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif
runtime! test.vim
runtime! plugins/*.vim