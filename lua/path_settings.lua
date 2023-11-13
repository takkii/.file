-- Python3
vim.g['python3_host_prog'] = 'C:/Python3/python.exe'
vim['dynamic_python_dll'] = 'C:/Python3/python.dll'

-- Ruby3
vim.g['ruby_host_prog'] = 'C:/current_ruby/3.2.2/bin/neovim-ruby-host'

-- Skip the check of neovim module
vim.g['python3_host_skip_check'] = 1

-- denops settings
vim.g['denops#deno'] = $HOME . '/scoop/shims/deno'
vim.g['denops_disable_version_check'] = 1
