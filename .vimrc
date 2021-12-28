" Python3
let g:python3_host_prog='C:/Python3/python.exe'
let dynamic_python_dll='C:/Python3/python.dll'

" dps-himekuri
set runtimepath+=~/dps-himekuri

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" vim-lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'shun/ddc-vim-lsp'

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