-- path_settings.

if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then

-- Windows settings.

-- Python3
vim.g['python3_host_prog'] = 'C:/Python3/python.exe'
vim['dynamic_python_dll'] = 'C:/Python3/python.dll'

-- Ruby3, settings.
home = os.getenv("HOME")
if vim.fn.isdirectory(home .. '/scoop/apps/ruby/current') == 1 then
  vim.g['ruby_host_prog'] = home .. '/scoop/apps/ruby/current/gems/bin/neovim-ruby-host'
elseif vim.fn.isdirectory('C:/Ruby3') == 1 then
  vim.g['ruby_host_prog'] = 'C:/Ruby3/bin/neovim-ruby-host'
else
  -- RubyInstaller2 Install Custom PATH, here
end

-- Skip the check of neovim module
vim.g['python3_host_skip_check'] = 1

-- denops settings
home = os.getenv("HOME")
vim.g['denops#deno'] = home .. '/scoop/shims/deno'
vim.g['denops_disable_version_check'] = 1

elseif vim.fn.has('osxdarwin') == 1 or vim.fn.has('osx') == 1 then

-- MacOS rbenv settings.

-- Home
home = os.getenv("HOME")

-- Python3
vim.g['python3_host_prog'] = home .. '/.pyenv/shims/python'

-- Ruby3
vim.g['ruby_host_prog'] = home .. '/.rbenv/shims/neovim-ruby-host'

-- Skip the check of neovim module
vim.g['python3_host_skip_check'] = 1

-- denops settings
vim.g['denops#deno'] = home .. '/.deno/bin/deno'
vim.g['denops_disable_version_check'] = 1


elseif vim.fn.has('linux') == 1 then

-- linux kernel anyenv settings.

-- Home
home = os.getenv("HOME")

-- Python3
vim.g['python3_host_prog'] = home .. '/.anyenv/envs/pyenv/shims/python'

-- Ruby3
vim.g['ruby_host_prog'] = home .. '/.anyenv/envs/rbenv/shims/neovim-ruby-host'

-- Skip the check of neovim module
vim.g['python3_host_skip_check'] = 1

-- denops settings
vim.g['denops#deno'] = home .. '/.deno/bin/deno'
vim.g['denops_disable_version_check'] = 1

else

-- else anyenv settings.

-- Home
home = os.getenv("HOME")

-- Python3
vim.g['python3_host_prog'] = home .. '/.anyenv/envs/pyenv/shims/python'

-- Ruby3
vim.g['ruby_host_prog'] = home .. '/.anyenv/envs/rbenv/shims/neovim-ruby-host'

-- Skip the check of neovim module
vim.g['python3_host_skip_check'] = 1

-- denops settings
vim.g['denops#deno'] = home .. '/.deno/bin/deno'
vim.g['denops_disable_version_check'] = 1

end
