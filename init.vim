" Python3
let g:python3_host_prog='C:/Python3/python.exe'
let dynamic_python_dll='C:/Python3/python.dll'

" Ruby3
let g:ruby_host_prog = 'C:/current_ruby/3.2.2/bin/neovim-ruby-host'

" Skip the check of neovim module
let g:python3_host_skip_check = 1

" denops settings
let g:denops#deno=$HOME . '/scoop/shims/deno'
let g:denops_disable_version_check=1

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

" defx-icons-ver.takkii
let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2
let g:defx_icons_directory_icon = '📁'
let g:defx_icons_mark_icon = '*'
let g:defx_icons_parent_icon = '📂'
let g:defx_icons_default_icon = '📁'
let g:defx_icons_directory_symlink_icon = '📂'

" Debug Python Keymap
nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

" Setteings
set completeopt+=menuone

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

function s:MoveToFileAtStart()
  call feedkeys("\<Space>")
  call feedkeys("\s")
  call feedkeys("\l")
endfunction

" runtimepath
set runtimepath+=~/defx-icons-ver.takkii

" Specify a directory for plugins
call plug#begin('~/.neovim/plugged')

" Japanese ime
Plug 'vim-skk/skkeleton'

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

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
Plug 'Shougo/ddc-nvim-lsp'
Plug 'Shougo/ddc-source-nvim-lsp'

" nvim-lsp config
Plug 'neovim/nvim-lspconfig'
Plug 'uga-rosa/ddc-nvim-lsp-setup'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" 外観
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'dense-analysis/ale'
Plug 'gkeep/iceberg-dark'
Plug 'cocopon/iceberg.vim'

" Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'

" Make My Plugins.
Plug 'takkii/config'
Plug 'takkii/vim-com'
Plug 'takkii/dps-himekuri'
Plug 'takkii/neoruby-debugger'

" Initialize plugin system
call plug#end()

" ddc setting load.
if filereadable(expand('~/ddc_spring_load/autoload/spring_load.vim'))
  source ~/ddc_spring_load/autoload/spring_load.vim
endif

" himekuri.vim
if filereadable(expand('~/.neovim/plugged/dps-himekuri/autoload/himekuri.vim'))
  source ~/.neovim/plugged/dps-himekuri/autoload/himekuri.vim
endif

" vim-com
if filereadable(expand('~/.neovim/plugged/vim-com/plugins/refac.vim'))
  source ~/.neovim/plugged/vim-com/plugins/refac.vim
endif

lua << EOF

-- Lua Settings-Start
require('neoruby-debugger').setup()
require('dap-python').setup('C:/Python3/python.exe')
require('dap-python').test_runner = 'pytest'
require('dap-go').setup()
require('dapui').setup()
require('ddc_nvim_lsp_setup').setup()

local mason = require('mason')
mason.setup({
   ui = {
     icons = {
       package_installed = "✓",
       package_pending = "➜",
       package_uninstalled = "✗"
     }
   }
 })

local nvim_lsp = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup_handlers({ function(server_name)
   local opts = {
    flags = {
      debounce_text_changes = 150,
      },
      settings = {
        solargraph = {
          diagnostics = false
        },
        pylsp = {
          diagnostics = false
        },
        gopls = {
          diagnostics = false
        },
        tsserver = {
          diagnostics = false
        },
      }
   }
   opts.on_attach = function(_, bufnr)
     local bufopts = { silent = true, buffer = bufnr }
     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
     vim.keymap.set('n', 'gtD', vim.lsp.buf.type_definition, bufopts)
     vim.keymap.set('n', 'grf', vim.lsp.buf.references, bufopts)
     vim.keymap.set('n', '<space>p', vim.lsp.buf.format, bufopts)
  end
   nvim_lsp[server_name].setup(opts)
end })

-- LSP-Settgins-END
EOF


" Debug Setup


" Editor settings
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
set guifont=Source\ Code\ Pro\ Semibold\:h9:sb
set backspace=indent,eol,start
set lines=45
set columns=124
set encoding=utf-8

cd ~/
