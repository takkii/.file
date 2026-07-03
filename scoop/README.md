### Install

_※ Please add any missing libraries or languages to your environment yourself🏴_

```sh
# https://scoop.sh/
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# hackgen install
scoop bucket add mo-san https://github.com/mo-san/scoop-bucket

# python313 install
scoop bucket add versions

# Unverified ❎️
cd .file/powershell
.\main.ps1 && .\hackgen.ps1

# vim-plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

[junegunn/vim-plug](https://github.com/junegunn/vim-plug) | [hackgen_release](https://github.com/yuru7/HackGen/releases) | [deno_windows_install](https://docs.deno.com/runtime/getting_started/installation/)

**Please manually adjust the environment variables separately.**

_※ ChangeLogs: 2026/07/03🔄_
