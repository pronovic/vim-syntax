" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
" #
" #              C E D A R
" #          S O L U T I O N S       "Software done right."
" #           S O F T W A R E
" #
" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
" #
" # Copyright (c) 2003 Kenneth J. Pronovici.
" # All rights reserved.
" #
" # This program is free software; you can redistribute it and/or
" # modify it under the terms of the GNU General Public License,
" # Version 2, as published by the Free Software Foundation.
" #
" # This program is distributed in the hope that it will be useful,
" # but WITHOUT ANY WARRANTY; without even the implied warranty of
" # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
" #
" # Copies of the GNU General Public License are available from
" # the Free Software Foundation website, http://www.gnu.org/.
" #
" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
" #
" # Author   : Kenneth J. Pronovici <pronovic@ieee.org>
" # Language : Vim command language
" # Project  : Vim syntax definitions
" # Revision : $Id$
" # Purpose  : Provides a custom text-syntax definition (80-column)
" #
" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

" ########
" # Notes
" ########
"
" This file simply piggiebacks on the text syntax definition and
" then enforces a file-line-width of 80 columns.


" ###################################################
" # Exit if we're already in the middle of something
" ###################################################

if exists("b:current_syntax")
  finish
endif


" ###########################
" # Read the text definition
" ###########################

so <sfile>:p:h/text.vim


" ################################
" # Customize the text definition
" ################################

" We want to wrap lines at about 5 characters less than the screen width
set tw=75

