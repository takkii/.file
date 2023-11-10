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
