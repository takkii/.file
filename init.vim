" path_settings.vim
if filereadable(expand('~/ddc_vim/lua/path_settings.lua'))
  lua require('path_settings')
endif

" ware_settings.vim
if filereadable(expand('~/ddc_vim/settings/ware_settings.vim'))
  source ~/ddc_vim/neovim_settings/ware_settings.vim
endif

" runtimepath.vim
if filereadable(expand('~/ddc_vim/settings/runtimepath.vim'))
  source ~/ddc_vim/neovim_settings/runtimepath.vim
endif

" vim-plug.vim
if filereadable(expand('~/ddc_vim/settings/vim-plug.vim'))
  source ~/ddc_vim/neovim_settings/vim-plug.vim
endif

" spring_load.vim
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

"lua-settings
if filereadable(expand('~/ddc_vim/lua/lua_settings.lua'))
  lua require('lua_settings')
endif

" appearance.vim'
if filereadable(expand('~/ddc_vim/lua/appearance.lua'))
  lua require('appearance')
endif
