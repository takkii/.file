### ddc_win

_windowsでvim、ddc.vimを使うときの設定ファイル_

```markdown
https://github.com/vim/vim-win32-installer/releases

# ダウンロード例
gvim_8.2.3908_x64.exe


# denoをscoopで入れる
https://scoop.sh/

iwr -useb get.scoop.sh | iex
scoop install deno

# pythonのインストールは自作、他レポジトリ参照

cd $HOME

git clone https://github.com/takkii/ddc_spring_load.git

# ddc setting load.
if filereadable(expand('~/ddc_spring_load/autoload/spring_load.vim'))
  source ~/ddc_spring_load/autoload/spring_load.vim
endif

# vim-plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
>>     ni $HOME/vimfiles/autoload/plug.vim -Force

# Vim起動
:PlugInstall
```