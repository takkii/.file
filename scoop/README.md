### Install

```markdown
# scoop command
scoop bucket add mo-san https://github.com/mo-san/scoop-bucket

# python313
scoop bucket add versions

# vim-plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

[junegunn/vim-plug](https://github.com/junegunn/vim-plug) | [hackgen_release](https://github.com/yuru7/HackGen/releases) | [deno_windows_install](https://docs.deno.com/runtime/getting_started/installation/)

_※ Please add any missing libraries or languages to your environment yourself🏴_

