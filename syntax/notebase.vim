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
syn region nbH1 matchgroup=nbIgnore start="^\s*#" end="$" contains=nbH1 oneline
hi def link nbH1 markdownH1
syn region nbH2 matchgroup=nbIgnore start="^\s*##" end="$" contains=nbH2 oneline
hi def link nbH2 markdownH2
syn region nbH3 matchgroup=nbIgnore start="^\s*###" end="$" contains=nbH3 oneline
hi def link nbH3 markdownH3
syn region nbH4 matchgroup=nbIgnore start="^\s*####" end="$" contains=nbH4 oneline
hi def link nbH4 markdownH4
syn region nbH5 matchgroup=nbIgnore start="^\s*#####" end="$" contains=nbH5 oneline
hi def link nbH5 markdownH5
syn region nbH6 matchgroup=nbIgnore start="^\s*######" end="$" contains=nbH6 oneline
hi def link nbH6 markdownH6

syn region nbItalic matchgroup=nbIgnore start="\%(\*\|_\)" end="\%(\*\|_\)" contains=nbItalic concealends oneline
hi def link nbItalic markdownItalic
syn region nbBold matchgroup=nbIgnore start="\%(\*\*\|__\)" end="\%(\*\*\|__\)" contains=nbBold concealends oneline
hi def link nbBold markdownBold
syn region nbBoldItalic matchgroup=nbIgnore start="\%(\*\*\*\|___\)" end="\%(\*\*\*\|___\)" contains=nbBoldItalic concealends oneline
hi def link nbBoldItalic htmlBoldItalic
syn region nbInlineCode matchgroup=nbIgnore start="\%(\`\)" end="\%(\`\)" contains=nbInlineCode concealends oneline
hi def link nbInlineCode Blue

hi def link nbIgnore Ignore

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

" FIXME collides with header1 unless there is a string before it
syn match nbTag     "\%(#\)\@<=[^\u000a\u0020\\#\(\)\{\}\[\]]\+"
syn match nbTagCmd  "\v(#)\ze([^\u000a\u0020\\#\(\)\{\}\[\]]+)"
hi link nbTag       BlueItalic
hi link nbTagCmd    Comment

" keys used in nosql database
syn match nbKey     "\%(\\\)\@<=[^\u000a\u0020\\#\(\)\{\}\[\]]\+" 
hi link nbKey       GreenItalic
syn match nbKeyCmd  "\v(\\)\ze([^\u000a\u0020\\#\(\)\{\}\[\]]+)"
hi link nbKeyCmd    Comment

" FIXME manually set h1...h6 syntax highlighting (syntax/html.vim links all to
" Title)
hi link markdownH1  Green
hi link markdownH2  Aqua
hi link markdownH3  Blue
hi link markdownH4  Purple
hi link markdownH5  Red
hi link markdownH6  Orange

setlocal cole=2

let b:current_syntax = 'notebase'

" vim:set sw=2:

