" Python3
let g:python3_host_prog = 'C:/Python3/python.exe'
let dynamic_python_dll = 'C:/Python3/python.dll'

" Ruby3
let g:ruby_host_prog = 'C:/current_ruby/3.2.2/bin/neovim-ruby-host'

" Skip the check of neovim module
let g:python3_host_skip_check = 1

" denops settings
let g:denops#deno=$HOME . '/scoop/shims/deno'
let g:denops_disable_version_check=1
