if exists("b:current_syntax")
  finish
endif

runtime! syntax/markdown.vim
unlet! b:current_syntax

" allows for highlighted yaml header
syn include @yaml syntax/yaml.vim
syn region nbHeaderYAML matchgroup=nbYAML start=+---+ end=+---+ contains=@yaml
hi def link nbYAML Type

" wiki style links
syn region nbLink matchgroup=nbBrackets start=/\[\[/ end=/\]\]/ display oneline
hi link nbLink      htmlBoldUnderline

" task items
syn match nbTaskMarker  "\v(\[)([ /x])(\])" contains=@nbTaskStatus
syn match nbTaskEmpty   "\v(\[)\zs([ ])\ze(\])"
syn match nbTaskInProg  "\v(\[)\zs([/])\ze(\])"
syn match nbTaskDone    "\v(\[)\zs([x])\ze(\])"
syn cluster nbTaskStatus contains=nbTaskEmpty,nbTaskInProg,nbTaskDone
hi link nbTaskInProg    Yellow
hi link nbTaskDone      Green
hi link nbTask          Comment

" FIXME collides with header1 unless there is a string before it
syn match nbTag     "\%(#\)\@<=[^\u000a\u0020\\#\(\)\{\}\[\]]\+"
hi link nbTag       BlueItalic
syn match nbTagCmd  "\v(#)\ze([^\u000a\u0020\\#\(\)\{\}\[\]]+)"
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

" [ ] [/] [x]

let b:current_syntax = 'notebase'

" vim:set sw=2:

