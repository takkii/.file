### Install

_※ Please add any missing libraries or languages to your environment yourself._ 🤦

```sh
# https://docs.deno.com/runtime/getting_started/installation/
irm https://deno.land/install.ps1 | iex

# Windows ENV | https://rust-lang.org/ja/tools/install/
wget https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe
# WSL2 ENV | https://rust-lang.org/ja/tools/install/
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Scoop install | https://scoop.sh/
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# scoop/install
scoop bucket add mo-san https://github.com/mo-san/scoop-bucket
cd .file/powershell && .\hackgen.ps1 && cd ..

# GitHub release/manual install
wget https://github.com/yuru7/HackGen/releases/download/v2.10.0/HackGen_NF_v2.10.0.zip
wget https://github.com/yuru7/HackGen/releases/download/v2.10.0/HackGen_v2.10.0.zip

# Myself use, open source software in scoop.
scoop bucket add versions
cd .file/powershell && .\main.ps1 && .\holds.ps1 && cd ..

# scoop/msys2
ridk install 1 2 3
ridk enable

# https://github.com/junegunn/vim-plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

**Please manually adjust the environment variables separately.**

_※ ChangeLogs: 2026/07/04🔄_
