# frozen_string_literal: true

require 'open3'
require 'fileutils'

class White
  # default encoding utf-8, change encode here.
  def self.encoding_style
    Encoding.default_internal = 'UTF-8'
    Encoding.default_external = 'UTF-8'
  end

  def self.magic
  encoding_style

  if Dir.exist?(File.expand_path('~/scoop/apps/neovim/current/bin/lua'))
    puts "something else."
  else
    FileUtils.mkdir(File.expand_path('~/scoop/apps/neovim/current/bin/lua'))
    FileUtils.cp(['./lua/init.lua', './lua/appearance.lua', './lua/himekuri.lua', './lua/lua_settings.lua', './lua/path_settings.lua', './lua/runtimepath.lua', './lua/spring_load.lua', './lua/vim-com.lua', './lua/vim-plug.lua', './lua/ware_settings.lua'], File.expand_path('~/scoop/apps/neovim/current/bin/lua'))
  end

  end
end

White.magic
