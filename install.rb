# frozen_string_literal: true
#!/usr/bin/ruby

class White
  def magic
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

White.new.magic

class Black
  def magic
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

Black.new.magic