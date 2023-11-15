-- Lua Settings-Start.

require('neoruby-debugger').setup()
require('dap-python').setup('C:/Python3/python.exe')
require('dap-python').test_runner = 'pytest'
require('dap-go').setup()
require('dapui').setup()
require('ddc_nvim_lsp_setup').setup()

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
