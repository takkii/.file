-- Lua Settings-Start.

require('neoruby-debugger').setup()

-- dap-python, Python PATH.
home = os.getenv("HOME")

    -- Use Python 3.11.x, Not Yet Support Python 3.12.x
if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then

    if vim.fn.isdirectory('C:Python3') == 1 then
        require('dap-python').setup('C:/Python3/python.exe')
    elseif vim.fn.isdirectory(home .. '/scoop') == 1 then
        require('dap-python').setup(home .. '/scoop/apps/python311/current/python.exe')
    end

elseif vim.fn.has('osxdarwin') == 1 or vim.fn.has('osx') == 1 then

    if vim.fn.isdirectory(home .. '/.pyenv') == 1 then
        require('dap-python').setup(home .. '/.pyenv/shims/python')
    elseif vim.fn.isdirectory(home .. '/.anyenv') == 1 then
        require('dap-python').setup(home .. '/.anyenv/envs/pyenv/shims/python')
    end

elseif vim.fn.has('linux') == 1 then

    if vim.fn.isdirectory(home .. '/.pyenv') == 1 then
        require('dap-python').setup(home .. '/.pyenv/shims/python')
    elseif vim.fn.isdirectory(home .. '/.anyenv') == 1 then
        require('dap-python').setup(home .. '/.anyenv/envs/pyenv/shims/python')
    end

else
    -- other OS, python path is here
end

require('dap-python').test_runner = 'pytest'
require('dap-go').setup {
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  -- delve configurations
  delve = {
    home = os.getenv("HOME"),
    -- the path to the executable dlv which will be used for debugging.
    -- by default, this is the "dlv" executable on your PATH.
    path = home .. "/.anyenv/envs/goenv/shims/dlv",
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port
    port = "${port}",
    -- additional args to pass to dlv
    args = {},
    -- the build flags that are passed to delve.
    -- defaults to empty string, but can be used to provide flags
    -- such as "-tags=unit" to make sure the test suite is
    -- compiled during debugging, for example.
    -- passing build flags using args is ineffective, as those are
    -- ignored by delve in dap mode.
    build_flags = "",
    -- whether the dlv process to be created detached or not. there is
    -- an issue on Windows where this needs to be set to false
    -- otherwise the dlv server creation will fail.
    detached = true,
    -- the current working directory to run dlv from, if other than
    -- the current working directory.
    cwd = nil,
  },
}
require('dapui').setup()
require('ddc_source_lsp_setup').setup()

local mason = require('mason')
local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

 mason.setup({
   ui = {
     icons = {
       package_installed = "✓",
       package_pending = "➜",
       package_uninstalled = "✗"
     }
   }
 })

mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({})
    end,
    solargraph = function()
        lspconfig.solargraph.setup({})
    end,
    pylsp = function()
        lspconfig.pylsp.setup({})
    end,
    gopls = function()
        lspconfig.gopls.setup({})
    end,
    denols = function()
        lspconfig.denols.setup({})
    end,
    rust_analyzer = function()
        lspconfig.rust_analyzer.setup({})
    end,
})

-- Lua Settings-End.
