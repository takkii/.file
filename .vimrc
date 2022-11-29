" Defx Config Setting----------------------

let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2
let g:defx_icons_directory_icon = '📁'
let g:defx_icons_mark_icon = '*'
let g:defx_icons_parent_icon = '📂'
let g:defx_icons_default_icon = '📁'
let g:defx_icons_directory_symlink_icon = '📂'

" Defx Config Setting----------------------

" IME
function! s:skkeleton_init() abort
    call skkeleton#config({
    \ 'eggLikeNewline': v:true
    \ })
    call skkeleton#register_kanatable('rom', {
    \ "z\<Space>": ["\u3000", ''],
    \ })
endfunction
  augroup skkeleton-initlaize-pre
  autocmd!
  autocmd User skkeleton-initialize-pre call s:skkeleton_init()
augroup END

augroup skkeleton-mode-changed
  autocmd!
  autocmd User skkeleton-mode-changed redrawstatus
augroup END

" Appearance
let g:lightline = {
  \ 'colorscheme': 'icebergDark',
  \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ],
      \             [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ],
  \ },
\ }

let g:lightline.component_expand = {
  \  'linter_checking': 'lightline#ale#checking',
  \  'linter_warnings': 'lightline#ale#warnings',
  \  'linter_errors': 'lightline#ale#errors',
  \  'linter_ok': 'lightline#ale#ok',
\ }
let g:lightline.component_type = {
  \     'linter_checking': 'left',
  \     'linter_warnings': 'warning',
  \     'linter_errors': 'error',
  \     'linter_ok': 'left',
\ }

let b:ale_linters = {
  \   'javascript': ['eslint', 'eslint-plugin-vue'],
  \   'python': ['pyflakes', 'pep8'],
  \   'ruby': ['rubocop'],
  \   'tex': ['textlint'],
  \   'markdown': ['textlint'],
  \   'css': ['stylelint'],
\}

let g:ale_statusline_format = ['E%d', 'W%d', 'ok']
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
nmap <silent> <C-n> <Plug>(ale_next_wrap)

" Defx
autocmd FileType defx call s:defx_my_settings()
    function! s:defx_my_settings() abort
      " Define mappings
nnoremap <silent><buffer><expr> <CR>
\ defx#do_action('open')
nnoremap <silent><buffer><expr> c
\ defx#do_action('copy')
nnoremap <silent><buffer><expr> m
\ defx#do_action('move')
nnoremap <silent><buffer><expr> p
\ defx#do_action('paste')
nnoremap <silent><buffer><expr> l
\ defx#do_action('open')
nnoremap <silent><buffer><expr> E
\ defx#do_action('open', 'vsplit')
nnoremap <silent><buffer><expr> P
\ defx#do_action('open', 'pedit')
nnoremap <silent><buffer><expr> o
\ defx#do_action('open_or_close_tree')
nnoremap <silent><buffer><expr> K
\ defx#do_action('new_directory')
nnoremap <silent><buffer><expr> N
\ defx#do_action('new_file')
nnoremap <silent><buffer><expr> M
\ defx#do_action('new_multiple_files')
nnoremap <silent><buffer><expr> C
\ defx#do_action('toggle_columns',
  \ 'mark:indent:icon:filename:type:size:time')
nnoremap <silent><buffer><expr> S
\ defx#do_action('toggle_sort', 'time')
nnoremap <silent><buffer><expr> d
\ defx#do_action('remove')
nnoremap <silent><buffer><expr> r
\ defx#do_action('rename')
nnoremap <silent><buffer><expr> !
\ defx#do_action('execute_command')
nnoremap <silent><buffer><expr> x
\ defx#do_action('execute_system')
nnoremap <silent><buffer><expr> yy
\ defx#do_action('yank_path')
nnoremap <silent><buffer><expr> .
\ defx#do_action('toggle_ignored_files')
nnoremap <silent><buffer><expr> ;
\ defx#do_action('repeat')
nnoremap <silent><buffer><expr> h
\ defx#do_action('cd', ['..'])
nnoremap <silent><buffer><expr> ~
\ defx#do_action('cd')
nnoremap <silent><buffer><expr> q
\ defx#do_action('quit')
nnoremap <silent><buffer><expr> <Space>
\ defx#do_action('toggle_select') . 'j'
nnoremap <silent><buffer><expr> *
\ defx#do_action('toggle_select_all')
nnoremap <silent><buffer><expr> j
\ line('.') == line('$') ? 'gg' : 'j'
nnoremap <silent><buffer><expr> k
\ line('.') == 1 ? 'G' : 'k'
nnoremap <silent><buffer><expr> <C-l>
\ defx#do_action('redraw')
nnoremap <silent><buffer><expr> <C-g>
\ defx#do_action('print')
nnoremap <silent><buffer><expr> cd
\ defx#do_action('change_vim_cwd')
endfunction

" Denite
nnoremap <silent> <space>fr :<C-u>Denite file_mru -split="floating"<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent> <space>
  \ fr :<C-u>Denite file_mru -split="floating"<CR>
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_setting()
function! s:denite_filter_my_setting() abort
  inoremap <silent><buffer><expr> <BS>    denite#do_map('move_up_path')
  inoremap <silent><buffer><expr> <C-c>   denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-c>   denite#do_map('quit')
endfunction



let g:python3_host_prog=$HOME . '/.pyenv/shims/python3'
let g:ruby_host_prog=$HOME . '/.rbenv/shims/ruby'

" runtimepath
set runtimepath+=~/dps-himekuri
set runtimepath+=~/defx-icons-ver.takkii
source ~/vim-com/plugins/refac.vim

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" vim-lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'shun/ddc-vim-lsp'

" Japanese ime
Plug 'vim-skk/skkeleton'

" ddc.vim本体
Plug 'Shougo/ddc.vim'

" DenoでVimプラグインを開発するためのプラグイン
Plug 'vim-denops/denops.vim'

" ポップアップウィンドウを表示するプラグイン
Plug 'Shougo/pum.vim'

" カーソル周辺の既出単語を補完するsource
Plug 'Shougo/ddc-around'

" ファイル名を補完するsource
Plug 'LumaKernel/ddc-file'

" 入力中の単語を補完の対象にするfilter
Plug 'Shougo/ddc-matcher_head'

" 補完候補を適切にソートするfilter
Plug 'Shougo/ddc-sorter_rank'

" 補完候補の重複を防ぐためのfilter
Plug 'Shougo/ddc-converter_remove_overlap'

" 追加
Plug 'Shougo/ddc-ui-native'
Plug 'Shougo/ddc-source-around'

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" appearance
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'w0rp/ale'
Plug 'gkeep/iceberg-dark'
Plug 'cocopon/iceberg.vim'

" Initialize plugin system
call plug#end()

" ddc setting load.
if filereadable(expand('~/ddc_spring_load/autoload/spring_load.vim'))
  source ~/ddc_spring_load/autoload/spring_load.vim
endif

" dps-himekuri
if filereadable(expand('~/dps-himekuri/autoload/himekuri.vim'))
    source ~/dps-himekuri/autoload/himekuri.vim
endif

set fileencodings=utf-8,cp932
set background=dark
colorscheme iceberg
set splitbelow
set nobackup
set noundofile
set noswapfile
syntax enable
set number
set wildmenu
set wildmode=list:full
set laststatus=2
set guifont=HackGenConsoleNFJ-Regular:h12
set backspace=indent,eol,start