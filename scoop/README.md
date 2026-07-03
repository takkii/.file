### Install

_※ Please add any missing libraries or languages to your environment yourself🏴_

```sh
# https://docs.deno.com/runtime/getting_started/installation/
irm https://deno.land/install.ps1 | iex

# https://rust-lang.org/ja/tools/install/

# Windows11
wget https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe
# WSL2
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# https://scoop.sh/
# scoop install
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# scoop/hackgen install
scoop bucket add mo-san https://github.com/mo-san/scoop-bucket
cd .file/powershell && .\hackgen.ps1

# GitHub release/hackgen install
wget https://github.com/yuru7/HackGen/releases/download/v2.10.0/HackGen_NF_v2.10.0.zip
wget https://github.com/yuru7/HackGen/releases/download/v2.10.0/HackGen_v2.10.0.zip

# python313 install
scoop bucket add versions

# Myself use, open source software in scoop.
cd .file/powershell && .\main.ps1 

# scoop/msys2
ridk enable
ridk install 1 2 3

# https://github.com/junegunn/vim-plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

**Please manually adjust the environment variables separately.**

_※ ChangeLogs: 2026/07/03🔄_
