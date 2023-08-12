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

" QuickRun
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
      \ 'outputter/buffer/opener': 'new',
      \ 'outputter/buffer/into': 1,
      \ 'outputter/buffer/close_on_empty': 1,
      \ }

" vim-lsp
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <C-]> <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  nmap <buffer> <Leader>d <plug>(lsp-type-definition)
  nmap <buffer> <Leader>r <plug>(lsp-references)
  nmap <buffer> <Leader>i <plug>(lsp-implementation)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1
let g:lsp_preview_float = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_settings_filetype_go = ['gopls', 'golangci-lint-langserver']

" Go Lang LSP
let g:lsp_settings = {}
let g:lsp_settings['gopls'] = {
  \  'workspace_config': {
  \    'usePlaceholders': v:true,
  \    'analyses': {
  \      'fillstruct': v:true,
  \    },
  \  },
  \  'initialization_options': {
  \    'usePlaceholders': v:true,
  \    'analyses': {
  \      'fillstruct': v:true,
  \    },
  \  },
  \}

if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'whitelist': ['python'],
        \ 'workspace_config': {
        \   'pylsp': {
        \       'plugins': {
        \           'jedi_definition': {
        \               'follow_imports': v:true, 
        \               'follow_builtin_imports': v:true,
        \           },
        \           'pylsp_mypy': {
        \               'enabled': 1,
        \           },
        \   }
        \ }}
        \ })
endif

" npm install -g typescript-language-server
if executable('typescript-language-server')
    augroup LspTypeScript
        au!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'typescript-language-server',
                    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
                    \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
                    \ 'whitelist': ['typescript'],
                    \ })
        autocmd FileType typescript setlocal omnifunc=lsp#complete
    augroup END :echomsg "vim-lsp with `typescript-language-server` enabled"
else
    :echomsg "vim-lsp for typescript unavailable"
endif

" For snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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

" complete
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'shun/ddc-vim-lsp'
Plug 'matsui54/ddc-dictionary'

" 追加
Plug 'Shougo/ddc-ui-native'
Plug 'Shougo/ddc-source-around'

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

" Run
Plug 'thinca/vim-quickrun'

" Make My Plugins.
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

" Debug Setup
lua require('neoruby-debugger').setup()
lua require('dap-python').setup('C:/Python3/python.exe')
lua require('dap-python').test_runner = 'pytest'
lua require('dap-go').setup()
lua require('dapui').setup()

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
