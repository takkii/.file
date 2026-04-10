### .file/lua

```markdown
# Japanese version.

# Windows/luaフォルダ作成、scoop/neovimを利用
C:\Users\user\scoop\apps\neovim\current\bin\lua
cd ~/scoop/apps/neovim/current/bin
mkdir lua
cd

# Windows/.fileフォルダの複製先($HOME)、luaフォルダを展開
cd .file/lua
cp ~/*.lua ~/scoop/apps/neovim/current/bin/lua

# UNIX/neovimフォルダの複製先($HOME)、luaフォルダを展開
cd .file/lua
cp ./*.lua ~/neovim/.deps/usr/share/luajit-2.1

# English version.

# Windows
~/scoop/apps/neovim/current/bin/lua

# Mac | Unix
~/neovim/.deps/usr/share/luajit-2.1
/usr/share/luajit-2.1

# Copy Settings file.
cd $HOME
git clone git@github.com:takkii/.file.git
cd ~/.file/lua
cp ./*.lua ~/neovim/.deps/usr/share/luajit-2.1

# Delete Settings file.
cd ~/neovim/.deps/usr/share/luajit-2.1
rm -rf ./*.lua

# Copy, this name file.
init.lua appearance.lua himekuri.lua settings.lua path_settings.lua
runtimepath.lua neo_word.lua vim-plug.lua command.lua ware_settings.lua

※ Please Linux Command Run.
```

_※ deno/rust/elixir/erlangなどの環境構築は省略します。_

### .file/goneovim

```markdown
# Copy file to the specified path.
cd ~/.config
mkdir goneovim
cd
cd .file/goneovim
cp settings.toml ~/.config/goneovim
```

### touch .init.vim

```markdown
# Windows
~/AppData/Local/nvim/init.vim

# Unix
~/.config/nvim/init.vim

# Copy the following content into init.vim
if filereadable(expand('~/.file/lua/init.lua'))
  lua require('init')
endif
```

_※ Please moving init.vim file to path._