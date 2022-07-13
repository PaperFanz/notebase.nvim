if exists("b:current_syntax")
  finish
endif

" runtime! syntax/markdown.vim
unlet! b:current_syntax

" allows for highlighted yaml header
syn include @yaml syntax/yaml.vim
syn region nbHeaderYAML matchgroup=nbYAML start=+---+ end=+---+ contains=@yaml
hi def link nbYAML Type

" markdown headings and formatting
syn region nbH1 matchgroup=nbIgnore start="^\s*# " end="$" contains=nbH1 oneline
hi def link nbH1 Green
syn region nbH2 matchgroup=nbIgnore start="^\s*## " end="$" contains=nbH2 oneline
hi def link nbH2 Aqua
syn region nbH3 matchgroup=nbIgnore start="^\s*### " end="$" contains=nbH3 oneline
hi def link nbH3 Blue
syn region nbH4 matchgroup=nbIgnore start="^\s*#### " end="$" contains=nbH4 oneline
hi def link nbH4 Purple
syn region nbH5 matchgroup=nbIgnore start="^\s*##### " end="$" contains=nbH5 oneline
hi def link nbH5 Red
syn region nbH6 matchgroup=nbIgnore start="^\s*###### " end="$" contains=nbH6 oneline
hi def link nbH6 Orange

syn region nbItalic matchgroup=nbIgnore start="\%(\*\|_\)" end="\%(\*\|_\)" contains=nbItalic concealends oneline
hi def link nbItalic markdownItalic
syn region nbBold matchgroup=nbIgnore start="\%(\*\*\|__\)" end="\%(\*\*\|__\)" contains=nbBold concealends oneline
hi def link nbBold markdownBold
syn region nbBoldItalic matchgroup=nbIgnore start="\%(\*\*\*\|___\)" end="\%(\*\*\*\|___\)" contains=nbBoldItalic concealends oneline
hi def link nbBoldItalic htmlBoldItalic
syn region nbInlineCode matchgroup=nbIgnore start="\v(\`)\ze([^`])" end="\v(\`)" contains=nbInlineCode concealends oneline
hi def link nbInlineCode Blue

hi def link nbIgnore Ignore

" nested lists
syn region nbList1 matchgroup=nbList1 start="\v^(\w+\.|-) " end="\v\ze(\S|$)" oneline
hi def link nbList1 Green
syn region nbList2 matchgroup=nbList2 start="\v^(    |\t)(\w+\.|-) " end="\v\ze(\S|$)" oneline
hi def link nbList2 Aqua
syn region nbList3 matchgroup=nbList3 start="\v^(        |\t\t)(\w+\.|-) " end="\v\ze(\S|$)" oneline
hi def link nbList3 Blue
syn region nbList4 matchgroup=nbList4 start="\v^(            |\t\t\t)(\w+\.|-) " end="\v\ze(\S|$)" oneline
hi def link nbList4 Purple
syn region nbList5 matchgroup=nbList5 start="\v^(                |\t\t\t\t)(\w+\.|-) " end="\v\ze(\S|$)" oneline
hi def link nbList5 Red
syn region nbList6 matchgroup=nbList6 start="\v^(                    |\t\t\t\t\t)(\w+\.|-) " end="\v\ze(\S|$)" oneline
hi def link nbList6 Orange

" wiki style links
" [[link]]
syn region  nbLink matchgroup=nbIgnore start=/\[\[/ end=/\]\]/ display oneline contains=nbLink concealends
hi def link nbLink      htmlBoldUnderline

" task items
syn match nbTaskMarker  "\v(\[)([ /x])(\])" contains=@nbTaskStatus
syn match nbTaskEmpty   "\v(\[)\zs([ ])\ze(\])"
syn match nbTaskInProg  "\v(\[)\zs([/])\ze(\])"
syn match nbTaskDone    "\v(\[)\zs([x])\ze(\])"
syn cluster nbTaskStatus    contains=nbTaskEmpty,nbTaskInProg,nbTaskDone
hi def link nbTaskInProg    Yellow
hi def link nbTaskDone      Green
hi def link nbTaskMarker    Ignore

" tags used to identify files
syn region nbTag matchgroup=nbCmd start="\v(#)\ze(\a+)" end="\v(\_s)" display contains=nbTag
hi link nbTag BlueItalic
" keys used in nosql database
syn region nbKey matchgroup=nbCmd start="\v(\\)\ze(\S+)" end="\v(\_s)" display contains=nbKey
hi link nbKey PurpleItalic
hi link nbCmd Comment

setlocal cole=2

let b:current_syntax = 'notebase'

" vim:set sw=2:

