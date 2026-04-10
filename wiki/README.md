### .file/lua

```markdown
# Windows, use scoop.
# ~/scoop/apps/neovim/current/bin
mkdir lua
cd
cd .file/lua
cp ~/*.lua ~/scoop/apps/neovim/current/bin/lua

# Unix, GitHub/neovim
# ~/neovim/.deps/usr/share/luajit-2.1
# /usr/share/luajit-2.1

cd $HOME
git clone git@github.com:neovim/neovim.git
cd .file/lua
cp ./*.lua ~/neovim/.deps/usr/share/luajit-2.1

# Copy Settings file.
cd $HOME
git clone git@github.com:takkii/.file.git
cd ~/.file/lua
cp ./*.lua ~/neovim/.deps/usr/share/luajit-2.1

# Delete Settings file.
/usr/share/luajit-2.1
cd ~/neovim/.deps/usr/share/luajit-2.1
cd ~/scoop/apps/neovim/current/bin

rm -rf ./*.lua

# Copy, this name file.
init.lua appearance.lua himekuri.lua settings.lua path_settings.lua
runtimepath.lua neo_word.lua vim-plug.lua command.lua ware_settings.lua

※ Please Linux Command Run.
```

[neovim](https://github.com/neovim/neovim/releases) | [neovim_build](https://gist.github.com/takkii/b7f7faa81b4ddf5a35ca40dae284538b) | [goneovim](https://github.com/akiyosi/goneovim/releases) | [zonvie](https://github.com/akiyosi/zonvie/releases)

※ Other environment construction, Please search google.

### .file/goneovim

```markdown
# Goneovim, near default settings.
cd ~/.config
mkdir goneovim
cd
cd .file/goneovim
cp settings.toml ~/.config/goneovim
```

### .file/zonvie

```markdown
# Zonvie, defatult settings.
cd ~/.config
mkdir zonvie
cd
cd .file/zonvie
cp config.toml ~/.config/zonvie
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