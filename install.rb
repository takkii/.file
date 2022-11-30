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
  if File.exist?(File.expand_path('~/.vimrc'))
    FileUtils.rm_rf(File.expand_path('~/.vimrc'))
  end
    myhome = File.expand_path('~/.vimrc')
    File.open(myhome, 'a:utf-8', perm = 0o777) do |f|
      f.puts <<-DOC
" deoplete_win
if filereadable(expand('~/ddc_vim/.vimrc'))
  source ~/ddc_vim/.vimrc
endif
      DOC
    end
  end
end

class Black
  # default encoding utf-8, change encode here.
  def self.encoding_style
    Encoding.default_internal = 'UTF-8'
    Encoding.default_external = 'UTF-8'
  end

  def self.magic
  encoding_style
  if File.exist?(File.expand_path('~/.gvimrc'))
    FileUtils.rm_rf(File.expand_path('~/.gvimrc'))
  end
    myhome = File.expand_path('~/.gvimrc')
    File.open(myhome, 'a:utf-8', perm = 0o777) do |f|
    f.puts <<-DOC
" deoplete_win
if filereadable(expand('~/ddc_vim/.gvimrc'))
  source ~/ddc_vim/.gvimrc
endif
      DOC
    end
  end
end

White.magic
Black.magic

