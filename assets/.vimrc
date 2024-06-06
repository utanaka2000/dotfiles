set nocompatible
filetype off

call plug#begin()
" List your plugins here
Plug 'VundleVim/Vundle.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
" lspのpipの場所
" $HOME/.local/share/vim-lsp-settings/servers/pylsp-all/venv/bin/pip3
nnoremap K :<C-u>LspHover<CR>
let g:lsp_settings = {
\   'pyls-all': {
\     'workspace_config': {
\       'pyls': {
\         'configurationSources': ['flake8']
\       }
\     }
\   },
\}
" Hide signcolumn.
let g:lsp_diagnostics_signs_enabled = 0
" Hide virtual text, which is showing according to flake8 but noisy
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_float_cursor = 1
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'

Plug 'vim-denops/denops-helloworld.vim'
Plug 'Shougo/ddc.vim'
" deno が必要
Plug 'vim-denops/denops.vim'

" Install your UIs
Plug 'Shougo/ddc-ui-native'

" Install your sources
Plug 'Shougo/ddc-source-around'
Plug 'shun/ddc-source-vim-lsp'
Plug 'LumaKernel/ddc-file'

" Install your filters
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'Shougo/ddc-converter_remove_overlap'


" easy mostion
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0
xmap <Space><Space> <Plug>(easymotion-s2)
nmap <Space><Space> <Plug>(easymotion-overwin-f2)

Plug 'preservim/nerdtree'
" ツリー幅
let NERDTreeWinSize=24
" ファイル名を指定せず開くとNERDTree, 指定すると開かない
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" NERDTreeをキーマップ
map <C-l> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['^__pycache__$']

Plug 'Yggdroot/indentLine'
" ウインドウサイズの調整
Plug 'simeji/winresizer'
"コメントアウトのプラグイン
Plug 'scrooloose/nerdcommenter'
"git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-surround'
Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0
filetype plugin on

call plug#end()


" 少しだけ変えているhybrid
colorscheme hybrid
set bg=dark
" ここは上書き
autocmd ColorScheme * highlight LineNr ctermfg=23

filetype indent on
" ファイルタイプによっての設定のため
autocmd BufRead,BufNewFile *.py setfiletype python

" setting
syntax on
"文字コードをUFT-8に設定
set fenc=utf-8
set encoding=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

" 見た目系
" 行番号を表示
set number
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
syntax enable


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4
" ビープ音
set vb t_vb=
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
set clipboard+=unnamed
" Ctrl j でノーマルモード
noremap <C-j> <esc>
noremap! <C-j> <esc>
"BSで削除できるものを指定する
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start
" terminalで.bash_profileを読み込ます
nnoremap <leader>t :terminal<CR>source $HOME/.zsh_profile<CR><C-w>r
nnoremap <leader>vt :vert terminal<CR>source $HOME/.zsh_profile<CR><C-w>r
" コマンドモードをtab補完にする
set wildmenu
set wildmode=longest:full,full
set splitbelow
" コマンドモードの移動をCtrlで
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
" use insert mode like emacs
inoremap <C-d> <Del>
inoremap <C-h> <BS>
inoremap <C-a> <home>
inoremap <C-e> <End>
" 論理行じゃなく表示行移動のため
"inoremap <C-p> <Up>
"inoremap <C-n> <Down>
function! ExecExCommand(cmd)
  silent exec a:cmd
  return ''
endfunction
inoremap <silent> <expr> <C-p> "<C-r>=ExecExCommand('normal k')<CR>"
inoremap <silent> <expr> <C-n> "<C-r>=ExecExCommand('normal j')<CR>"
"inoremap <silent> <expr> <C-k> "<C-r>=ExecExCommand('normal d$')<CR>"
inoremap <C-f> <right>
inoremap <C-b> <left>
let mapleader = "\<Space>"
" pythonのハイライトを有効化する?
"let python_highlight_all = 1
" vim diff を見やすくするため
autocmd FilterWritePre * if &diff | setlocal wrap< | endif
" texの数式表示のoff
let g:tex_conceal = ''
" :e %% でbufferのところのpath
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" grepはquickfix-windowで開く
autocmd QuickFixCmdPost *grep* cwindow
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" ddcの設定
" Customize global settings

" You must set the default ui.
" Note: native ui
" https://github.com/Shougo/ddc-ui-native
call ddc#custom#patch_global('ui', 'native')

call ddc#custom#patch_global('sources', ['around', 'file', 'vim-lsp'])

" Use matcher_head and sorter_rank.
" https://github.com/Shougo/ddc-matcher_head
" https://github.com/Shougo/ddc-sorter_rank
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank'],
      \ },
      \ 'vim-lsp': {
      \   'matchers': ['matcher_head'],
      \   'mark': 'lsp',
      \ },
      \ 'file': {
      \   'mark': 'F',
      \   'isVolatile': v:true,
      \   'forceCompletionPattern': '\S/\S*'},
      \ })


" Mappings
" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ pumvisible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()
" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'
" Use ddc.
call ddc#enable()


