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
    puts 'There is already a folder, ruby does nothing.'
  else
    FileUtils.mkdir(File.expand_path('~/scoop/apps/neovim/current/bin/lua'))
    FileUtils.cp(['./init.lua', './appearance.lua', './himekuri.lua', './settings.lua', './path_settings.lua', './runtimepath.lua', './spring_load.lua', './vim-com.lua', './vim-plug.lua', './ware_settings.lua'], File.expand_path('~/scoop/apps/neovim/current/bin/lua'))
    puts 'The specified file has been extracted.'
  end

  end
end

begin
  White.magic
rescue StandardError => e
  puts e.backtrace
ensure
  GC.compact
end

__END__
