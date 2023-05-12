" Settings
set langmenu=ja_jp.utf-8

if exists('b:did_ftplugin_python')
    finish
endif
let b:did_ftplugin_python = 1

if version < 600
  syntax clear
elseif exists('b:current_after_syntax')
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match pythonOperator "\(+\|=\|-\|\^\|\*\)"
syn match pythonDelimiter "\(,\|\.\|:\)"
syn keyword pythonSpecialWord self

hi link pythonSpecialWord    Special
hi link pythonDelimiter      Special

let b:current_after_syntax = 'python'

let &cpo = s:cpo_save
unlet s:cpo_save

set guioptions-=T
set lines=30
set columns=135
set encoding=utf-8

" source $VIMRUNTIME\delmenu.vim
" source $VIMRUNTIME\menu.vim
" source $VIMRUNTIME/mswin.vim

" $HOME
cd ~/
