" Vim syntax file
" Language:     gtml 
" Maintainer:   Kenneth J. Pronovici <pronovic@ieee.org>
" Last Change:  $Date: 2002/05/03 19:10:43 $
" Filenames:    *.gtml
" URL:          ftp://cedar-solutions.com/software/gtml.vim
"
" GTML is an HTML preprocessor.  Essentially, it adds #define and
" #include functionality and lets you reference #defined values
" as <<NAME>>.  See http://www.lifl.fr/~beaufils/gtml/ for more
" information.
"
" The syntax is based on the HTML syntax, with a few GTML things added
" in.  I also modify the way HTML highlighting of things like <i></i>
" works, but let the user change them just like the HTML syntax file
" would.  The whole thing works based on the @htmlPreproc functionality
" in the html.vim file.

" Clear previous syntax settings unless this is v6 or above, in which case just
" exit without doing anything.
if version < 600
   syn clear
elseif exists("b:current_syntax")
   finish
endif

" The HTML syntax file included below uses this variable.
if !exists("main_syntax")
   let main_syntax = 'gtml'
endif

" Set up my preferences for highlighting (user can override this)
if !exists("html_my_rendering")
   let html_my_rendering=1
   hi def htmlBold                term=bold cterm=bold gui=bold
   hi def htmlBoldUnderline       term=bold cterm=bold gui=bold
   hi def htmlBoldItalic          term=bold cterm=bold gui=bold
   hi def htmlBoldUnderlineItalic term=bold cterm=bold gui=bold
   hi def htmlUnderline           term=bold cterm=bold gui=bold
   hi def htmlUnderlineItalic     term=bold cterm=bold gui=bold
   hi def htmlItalic              term=bold cterm=bold gui=bold
endif

" Pull in the HTML syntax file.
" The syntax file obeys either my rendering values above, or the user's if set
if version < 600
   so <sfile>:p:h/html.vim
else
   runtime! syntax/html.vim
   unlet b:current_syntax
endif

" Explain to html.vim which preprocessor-language things should be highlighted
syn cluster htmlPreproc add=@gtmlTop

" Define the GTML regions
syn region gtmlStatement   start="^\s*#\(define\|include\)" end="$"
syn region gtmlDefine      start="<<" end=">>"

syn cluster gtmlTop contains=gtmlStatement,gtmlDefine

" Set up default highlighting. Almost all of this is done in the HTML syntax file
if version >= 508 || !exists("did_gtml_syn_inits")
   if version < 508
      let did_gtml_syn_inits = 1
      com -nargs=+ HiLink hi link <args>
   else
      com -nargs=+ HiLink hi def link <args>
   endif

   HiLink gtmlStatement Comment
   HiLink gtmlDefine    Comment

   delcommand HiLink
endif

let b:current_syntax = "gtml"

if main_syntax == 'gtml'
   unlet main_syntax
endif

