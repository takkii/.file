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

  if File.exist?(File.expand_path('~/.goneovim/settings.toml'))
    puts 'There is already a files, ruby does nothing.'
  else
    FileUtils.cp(['./goneovim/settings.toml'], File.expand_path('~/.goneovim'))
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
