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
" # Author   : Kenneth J. Pronovici <pronovic@ieee.org>
" # Language : Vim command language
" # Project  : Vim files
" # Package  : N/A
" # Revision : $Id: text.vim,v 1.3 2002/04/16 17:57:34 pronovic Exp $
" # URL      : Within ftp://cedar-solutions.com/software/vim/vim.tar.gz
" # Purpose  : Provides a custom text-syntax definition
" #
" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

" ########
" # Notes
" ########
"
" This file is based on the sh.vim file in the standard Vim 6.0
" distribution.  It has been written for use with Vim >= 6.0
"
" The intent of this file is to highlight text documents in a 
" customized way, with comments in a color and also with a line-
" length boundary set.  You probably want to use text80.vim or 
" text132.vim, which also set a maximum line width.
"


" ###################################################
" # Exit if we're already in the middle of something
" ###################################################

if exists("b:current_syntax")
  finish
endif


" ##################
" # Set up patterns
" ##################
" These are set here for easy access later.

let g:colors_name = "text"

hi textCommentColor    ctermfg=cyan        ctermbg=black 
hi textCommentColor    guifg=cyan          guibg=black

syn match textComment  "#.*$"    contains=@shCommentGroup

hi def link textComment  textCommentColor


" #############################
" # Mark the syntax as defined
" #############################

let b:current_syntax = "text"


