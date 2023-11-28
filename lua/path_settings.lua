-- path_settings.

if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then

-- Windows settings.

-- Home
home = os.getenv("HOME")

-- Use Scoop, Settings.

-- Python3
if vim.fn.isdirectory(home .. '/scoop/apps/python311/current') == 1 then
  vim.g['python3_host_prog'] = home .. '/scoop/apps/python311/current/python.exe'
  vim['dynamic_python_dll'] = home .. '/scoop/apps/python311/current/python3.dll'
else
  -- Python3 Installer PATH
end

-- Ruby3
if vim.fn.isdirectory(home .. '/scoop/apps/ruby/current') == 1 then
  vim.g['ruby_host_prog'] = home .. '/scoop/apps/ruby/current/gems/bin/neovim-ruby-host'
else
  -- RubyInstaller2 Install PATH
end

-- Deno
if vim.fn.isdirectory(home .. '/scoop/apps/deno/current') == 1 then
  vim.g['denops#deno'] = home .. '/scoop/shims/deno'
else
  -- Deno Install PATH
end

-- Skip the check of neovim module
vim.g['python3_host_skip_check'] = 1

-- denops settings
vim.g['denops_disable_version_check'] = 1

elseif vim.fn.has('osxdarwin') == 1 or vim.fn.has('osx') == 1 then

-- MacOS rbenv settings.

-- Home
home = os.getenv("HOME")

-- Python3
vim.g['python3_host_prog'] = home .. '/.pyenv/shims/python'

-- Ruby3
vim.g['ruby_host_prog'] = home .. '/.anyenv/envs/rbenv/shims/neovim-ruby-host'

-- Skip the check of neovim module
vim.g['python3_host_skip_check'] = 1

-- denops settings
vim.g['denops#deno'] = '/usr/local/bin/deno'
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
