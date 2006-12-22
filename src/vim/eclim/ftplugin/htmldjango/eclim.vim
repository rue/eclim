" Author:  Eric Van Dewoestine
" Version: $Revision$
"
" Description: {{{
"
" License:
"
" Copyright (c) 2005 - 2006
"
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
"
"      http://www.apache.org/licenses/LICENSE-2.0
"
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.
"
" }}}

runtime ftplugin/html.vim

if !exists('g:HtmlDjanogUserBodyElements')
  let g:HtmlDjanogUserBodyElements = []
endif

let g:HtmlDjangoBodyElements = [
    \ 'block',
    \ 'comment',
    \ 'if',
    \ 'else',
    \ 'filter',
    \ 'for',
    \ 'spaceless'
  \ ] + g:HtmlDjanogUserBodyElements

if exists("b:match_words")
  let b:match_words = b:match_words . ',' .
    \ '{%\s*\(e_\)\?if\(changed\|equal\|notequal\)\?\s\+.\{-}%}:{%\s*elif\s\+.\{-}\s*%}:{%\s*else\s*%}:{%\s*endif\(changed\|equal\|notequal\)\?\s*%},' .
    \ '{%\s*\(' . join(g:HtmlDjangoBodyElements, '\|') . '\)\>.\{-}%}:{%\s*end\(' . join(g:HtmlDjangoBodyElements, '\|') . '\)\s*%}'
endif

" vim:ft=vim:fdm=marker
