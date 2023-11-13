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
  if File.exist?(File.expand_path('~/AppData/Local/nvim/init.vim'))
    FileUtils.rm_rf(File.expand_path('~/AppData/Local/nvim/init.vim'))
  end
    myhome = File.expand_path('~/AppData/Local/nvim/init.vim')
    File.open(myhome, 'a:utf-8', perm = 0o777) do |f|
      f.puts <<-DOC
" ddc_vim
if filereadable(expand('~/ddc_vim/lua/init.lua'))
  lua require('init')
endif
      DOC
    end
  end
end

White.magic
