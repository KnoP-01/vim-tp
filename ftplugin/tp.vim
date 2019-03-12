" Fanuc TP file type plugin for Vim
" Language: Fanuc TP
" Maintainer: Patrick Meiser-Knosowski <knosowski@graeff.de>
" Version: 1.0.0
" Last Change: 12. Mar 2019
"
" Suggestions of improvement are very welcome. Please email me!
"
" ToDo's {{{
" }}} ToDo's

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:keepcpo = &cpo
set cpo&vim

setlocal suffixesadd+=.ls
let b:undo_ftplugin = "setlocal sua<"

let &cpo = s:keepcpo
unlet s:keepcpo

" vim:sw=2 sts=2 et fdm=marker
