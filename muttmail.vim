" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
" #                                                                   #
" #            C  E  D  A  R                                          #
" #          S O L U T I O N S       "Software done right."           #
" #               I  N  C.                                            #
" #                                                                   #
" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
" #                                                                   #
" # Copyright (c) 2002 Cedar Solutions, Inc.                          #
" # All rights reserved.                                              #
" #                                                                   #
" # This program is free software; you can redistribute it and/or     #
" # modify it under the terms of the GNU General Public License,      #
" # Version 2, as published by the Free Software Foundation.          #
" #                                                                   #
" # This program is distributed in the hope that it will be useful,   #
" # but WITHOUT ANY WARRANTY; without even the implied warranty of    #
" # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.              #
" #                                                                   #
" # Copies of the GNU General Public License are available from       #
" # the Free Software Foundation website, http://www.gnu.org/.        #
" #                                                                   #
" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
" #
" # Author   : Kenneth J. Pronovici
" # Language : Vim command language
" # Project  : Configuration files
" # Package  : N/A
" # Revision : $Id: muttmail.vim,v 1.2 2002/04/04 20:18:13 pronovic Exp $
" # Purpose  : Provides a custom mail-syntax definition for use with mutt
" #
" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

" ########
" # Notes
" ########
"
" This file is based on the mail.vim file in the standard Vim 6.0
" distribution.  It has been written for use with Vim >= 6.0
"
" The intent of this file is to highlight mail in Vim the same way
" that I highlight mail in Mutt, so that reading and editing look
" similar.
" 
" The default mail syntax file does some things that Mutt can't do
" (highlights email in headers, for example), so I need to disable
" that for things to look the same.  It also has the annoying habit
" (like most of these syntax files) of relying on some arbitrary
" color definition (say the 'Comment' syntax color) instead of
" just setting a color in the file.  I want to make sure it's easy
" to sync between Mutt and Vim if I change my mind, so I set explict
" colors in here.
" 

" ###################################################
" # Exit if we're already in the middle of something
" ###################################################

if exists("b:current_syntax")
  finish
endif


" ###############
" # Setup colors
" ###############
" These are supposed to match with what I keep in ~/.mutt/colors.
" Note that what Mutt calls "yellow", Vim calls "darkyellow" and
" what Mutt calls "brightyellow", Vim calls "yellow", etc.  What 
" mutt calls "white" vim calls "grey" (I'm not asking, either).

let g:colors_name = "muttmail"

hi muttHeaderColor     ctermfg=grey        ctermbg=black 
hi muttHeaderColor     guifg=grey          guibg=black

hi muttFromColor       ctermfg=green       ctermbg=black  
hi muttFromColor       guifg=green         guibg=black

hi muttSubjectColor    ctermfg=blue        ctermbg=black 
hi muttSubjectColor    guifg=blue          guibg=black

hi muttAddressColor    ctermfg=cyan        ctermbg=black 
hi muttAddressColor    guifg=cyan          guibg=black

hi muttQuotedOddColor  ctermfg=darkblue    ctermbg=black 
hi muttQuotedOddColor  guifg=darkblue      guibg=black

hi muttQuotedEvenColor ctermfg=darkcyan    ctermbg=black 
hi muttQuotedEvenColor guifg=darkcyan      guibg=black

hi muttSignatureColor  ctermfg=darkred     ctermbg=black 
hi muttSignatureColor  guifg=darkred       guibg=black

hi muttURLCOlor        ctermfg=darkmagenta ctermbg=black
hi muttURLCOlor        guifg=darkmagenta   guibg=black

hi muttEmailColor      ctermfg=darkmagenta ctermbg=black
hi muttEmailColor      guifg=darkmagenta   guibg=black


" #################
" # Setup patterns
" #################
"
" Below, what we're doing is defining each of the things we want
" highlighted.  A "match" is a single-line regular expression.  A
" "region" is a multiple-line pattern with a begin-pattern and 
" end-pattern marked.
"
" The header is defined as starting with a number of keywords, and
" ending with an empty line or some other line that can't be in the
" header.  It's also defined as containing the other header pieces.
" Each of the other pieces are defined as starting with their respective
" pattern and ending when a new line starts with non-blanks.
"
" Part of what's here is from the original file, and part is mine.
" I mostly just followed the structure of the original file, and
" kept removing things until I broke my file.
"

syn case        ignore

" Taken directly from the mail syntax file, with modifications for my new types
syn region      muttHeader      start="^\(From:\|To:\|Cc:\|Bcc:\|Reply-To:\|Subject:\|Return-Path:\|Received:\|Date:\|Replied:\)" skip="^[ \t]" end="^[-a-z0-9/]*[^-a-z0-9/:]"me=s-1 end="^[^:]*$"me=s-1 end="^---*" contains=mailHeaderKey,mailSubject,mailFrom,mailTo,mailCC,mailBcc,muttURL,muttEmail

" I want to match a few headers differently than the mail syntax file.
" Not sure if the [Ff], etc. to get either lower- or upper-case is needed.
syn match       muttSubject     "^[Ss]ubject.*$"
syn region      muttFrom        start="^[Ff]rom:"      end="^[-a-z0-9/]"me=s-1
syn region      muttTo          start="^[Tt]o:"        end="^[-a-z0-9/]"me=s-1
syn region      muttCc          start="^[cC][cC]:"     end="^[-a-z0-9/]"me=s-1
syn region      muttBcc         start="^[bB][cC][cC]:" end="^[-a-z0-9/]"me=s-1

" These take the form nnn://mmmm
syn region      muttURL         start="[^ <]*:\/\/[^ >]*" end="\([ \t]\|$\)"me=s-1

" Email addresses take the form <nnn@mmm> ('>' chars printed) or just nnn@mmmm.
syn region      muttEmail       start="\(^\|[ \t<]*\|[<]\)[-+_a-zA-Z0-9.]*@[-+_a-zA-Z0-9.]*" end="\($\|[ \t>]*\)"

" These were taken directly from the mail syntax file, but I made sure to highlight email and URL
syn region  muttQuoted1 start="^\([A-Za-z]\+>\|[]|}>]\)" end="$"me=s-1, contains=muttURL,muttEmail
syn region  muttQuoted2 start="^\(\([A-Za-z]\+>\|[]|}>]\)[ \t]*\)\{2}" end="$"me=s-1 contains=muttURL,muttEmail
syn region  muttQuoted3 start="^\(\([A-Za-z]\+>\|[]|}>]\)[ \t]*\)\{3}" end="$"me=s-1 contains=muttURL,muttEmail
syn region  muttQuoted4 start="^\(\([A-Za-z]\+>\|[]|}>]\)[ \t]*\)\{4}" end="$"me=s-1 contains=muttURL,muttEmail
syn region  muttQuoted5 start="^\(\([A-Za-z]\+>\|[]|}>]\)[ \t]*\)\{5}" end="$"me=s-1 contains=muttURL,muttEmail
syn region  muttQuoted6 start="^\(\([A-Za-z]\+>\|[]|}>]\)[ \t]*\)\{6}" end="$"me=s-1 contains=muttURL,muttEmail

" This was taken directly from the mail syntax file
" Note that Mutt doesn't match email or URL in signatures.  
" If you want that in Vim anyway, use the first line instead of the second line
"syn region      muttSignature   start="^-- *$" end="^$" contains=muttURL,muttEmail
syn region      muttSignature   start="^-- *$" end="^$"

" Need to sync on the header.  Assume we can do that within a hundred lines.
syn sync lines=100


" #########################
" # Apply the highlighting
" #########################

hi def link muttHeader     muttHeaderColor

hi def link muttSubject    muttSubjectColor
hi def link muttFrom       muttFromColor
hi def link muttTo         muttAddressColor
hi def link muttCc         muttAddressColor
hi def link muttBcc        muttAddressColor

hi def link muttQuoted1    muttQuotedOddColor
hi def link muttQuoted2    muttQuotedEvenColor
hi def link muttQuoted3    muttQuotedOddColor
hi def link muttQuoted4    muttQuotedEvenColor
hi def link muttQuoted5    muttQuotedOddColor
hi def link muttQuoted6    muttQuotedEvenColor

hi def link muttURL        muttURLColor 
hi def link muttEmail      muttEmailColor 

hi def link muttSignature  muttSignatureColor


" #############################
" # Mark the syntax as defined
" #############################

let b:current_syntax = "muttmail"


