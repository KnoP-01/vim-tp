" Fanuc TP file type detection for Vim
" Language: Fanuc TP
" Maintainer: Patrick Meiser-Knosowski <knosowski@graeff.de>
" Version: 1.0.0
" Last Change: 17. May 2019
" Credits:
"
" Suggestions of improvement are very welcome. Please email me!
"

let s:keepcpo= &cpo
set cpo&vim

au BufNewFile,BufRead \c*.ls setf tp

augroup tpftdetect
  au! filetypedetect BufRead \c*.ls call <SID>TPAutoCorrCfgLineEnding()
augroup END
if !exists("*<SID>TPAutoCorrCfgLineEnding()")
  function <SID>TPAutoCorrCfgLineEnding()
    setf tp
    if get(g:,'tpAutoCorrLineEnd',1)
      silent! %s/\r//
      silent! normal ``
    endif
  endfunction
endif

let &cpo = s:keepcpo
unlet s:keepcpo

" vim:sw=2 sts=2 et
