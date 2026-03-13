### Environment construction.

```markdown
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
```

※ Please Linux Command Run.
