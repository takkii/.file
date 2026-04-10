### .file

```markdown
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
```

_※ deno/rust/elixir/erlangなどの環境構築は省略します。_