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
" # Revision : $Id: mysql.vim,v 1.2 2002/04/04 20:18:13 pronovic Exp $
" # Purpose  : Provides syntax highlighting for mysql files.
" #
" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

" ########
" # Notes
" ########
"
" This file defines syntax highlighting for mysql files.  It's
" similar to the syntax for other kinds of sql, but I mostly 
" built it using the mysql design document rather than basing
" it on the other *sql*.vim files - however, I tried to keep
" highlighting consistent.


" #################
" # Setup patterns
" #################
"
" Below, what we're doing is defining each of the things we want
" highlighted.  A "match" is a single-line regular expression.  A
" "region" is a multiple-line pattern with a begin-pattern and 
" end-pattern marked.
"
" The definitions below are taken from the mysql user manual.

" Always ignore case
syn case ignore

" Special values
syn keyword mysqlSpecial         false null true

" Strings (single- and double-quote)
syn region mysqlString           start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region mysqlString           start=+'+  skip=+\\\\\|\\'+  end=+'+

" Numbers and hexidecimal values
syn match mysqlNumber            "-\=\<[0-9]*\>"
syn match mysqlNumber            "-\=\<[0-9]*\.[0-9]*\>"
syn match mysqlNumber            "-\=\<[0-9]*e[+-][0-9]*\>"
syn match mysqlNumber            "-\=\<[0-9]*\.[0-9]*e[+-][0-9]*\>"
syn match mysqlNumber            "\<0x[abcdefABCDEF0-9]*\>"

" User variables
syn match sqlVariable            "@[\a\d_.$]*"

" Comments (c-style, mysql-style and modified sql-style)
syn region mysqlComment          start="/\*"  end="\*/"
syn match mysqlComment           "#.*"
syn match mysqlComment           "-- .*"
syn sync ccomment sqlComment

" Column types  (first simple keywords, then more complicated constructs)
syn keyword mysqlColumnType      tinyint smallint mediumint int integer bigint 
syn keyword mysqlColumnType      float double precision real decimal dec
syn keyword mysqlColumnType      date datetime time timestamp bit bool 
syn keyword mysqlColumnType      tinytext mediumtext longtext text
syn keyword mysqlColumnType      tinyblob mediumblob longblob blob
syn region mysqlColumnFloat      start="float(" end=")" contains=mysqlNumber,mysqlVariable
syn region mysqlColumnDouble     start="double\( precision\)\=(" end=")" contains=mysqlNumber,mysqlVariable
syn region mysqlColumnReal       start="real(" end=")" contains=mysqlNumber,mysqlVariable
syn region mysqlColumnNumeric    start="numeric(" end=")" contains=mysqlNumber,mysqlVariable
syn region mysqlColumnDecimal    start="dec\(imal\)\=(" end=")" contains=mysqlNumber,mysqlVariable
syn region mysqlColumnTimestamp  start="timestamp(" end=")" contains=mysqlNumber,mysqlVariable
syn region mysqlColumnYear       start="year(" end=")" contains=mysqlNumber,mysqlVariable
syn region mysqlColumnChar       start="char(" end=")" contains=mysqlNumber,mysqlVariable
syn region mysqlColumnVarchar    start="varchar(" end=")" contains=mysqlNumber,mysqlVariable
syn region mysqlColumnEnum       start="enum(" end=")" contains=mysqlString,mysqlVariable
syn region mysqlColumnSet        start="set(" end=")" contains=mysqlString,mysqlVariable

" Logical, string and  numeric operators
syn keyword mysqlOperator         + - * / \| & << >> ~
syn keyword mysqlOperator         = <> != <= < >= > <=> ! \|\| && 
syn keyword mysqlOperator         \| & << >> ~
syn keyword mysqlOperator         between not and or in like regexp rlike binary exists
syn match mysqlOperatorIsNull    "is null"
syn region mysqlOperatorIsnull   start="isnull(" end=")" contains=mysqlNumber,mysqlString,mysqlOperator,mysqlComment,mysqlVariable,mysqlSpecial
syn match mysqlOperatorIsNotNull "is not null"
syn region mysqlOperatorCoalesce start="coalesce(" end=")" contains=mysqlNumber,mysqlString,mysqlComment,mysqlVariable,mysqlSpecial
syn region mysqlOperatorInterval start="interval(" end=")" contains=mysqlNumber, mysqlComment, mysqlVariable

" Control flow functions
syn keyword mysqlFlow            case when then else end
syn region mysqlFlowIfNull       start="ifnull("   end=")"  contains=mysqlNumber,mysqlString,mysqlOperator,mysqlComment,mysqlVariable,mysqlSpecial
syn region mysqlFlowNullIf       start="nullif("   end=")"  contains=mysqlNumber,mysqlString,mysqlOperator,mysqlComment,mysqlVariable,mysqlSpecial
syn region mysqlFlowIf           start="if("       end=")"  contains=mysqlNumber,mysqlString,mysqlOperator,mysqlComment,mysqlVariable,mysqlSpecial

" Other keywords which don't fall into other categories
syn keyword mysqlKeyword         action add after aggregate all alter as asc auto_increment avg avg_row_length
syn keyword mysqlKeyword         both by
syn keyword mysqlKeyword         cascade case change character check checksum column columns comment constraint create cross
syn keyword mysqlKeyword         current_date current_time current_timestamp
syn keyword mysqlKeyword         data database databases day day_hour day_minute dayofmonth dayofweek dayofyear day_second
syn keyword mysqlKeyword         default delayed delay_key_write delete desc describe distinct distinctrow drop
syn keyword mysqlKeyword         else enclosed end escape escaped explain
syn keyword mysqlKeyword         fields file first flush for foreign from full function
syn keyword mysqlKeyword         global grant grants group
syn keyword mysqlKeyword         having heap high_priority hosts hour hour_minute hour_second
syn keyword mysqlKeyword         identified if ignore index infile inner insert insert_id interval into is isam
syn keyword mysqlKeyword         join
syn keyword mysqlKeyword         key keys kill last_insert_id leading left length limit lines load local lock logs long 
syn keyword mysqlKeyword         low_priority
syn keyword mysqlKeyword         match max max_rows middleint min_rows minute minute_second modify month monthname myisam
syn keyword mysqlKeyword         natural no null 
syn keyword mysqlKeyword         on optimize option optionally order outer outfile
syn keyword mysqlKeyword         pack_keys partial password primary privileges procedure process processlist
syn keyword mysqlKeyword         read references reload rename replace restrict returns revoke row rows
syn keyword mysqlKeyword         second select show shutdown soname sql_big_result sql_big_selects sql_big_tables sql_log_off
syn keyword mysqlKeyword         sql_log_update sql_low_priority_updates sql_select_limit sql_small_result sql_warnings starting
syn keyword mysqlKeyword         status straight_join string
syn keyword mysqlKeyword         table tables temporary terminated then to trailing type
syn keyword mysqlKeyword         unique unlock unsigned update usage use using
syn keyword mysqlKeyword         values varbinary variables varying when
syn keyword mysqlKeyword         where with write
syn keyword mysqlKeyword         year year_month
syn keyword mysqlKeyword         zerofill


" ######################
" # Define highlighting
" ######################
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet

if version >= 508 || !exists("did_mysql_syn_inits")
  if version < 508
    let did_mysql_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink mysqlSpecial            Special
  HiLink mysqlString             String
  HiLink mysqlNumber             Number
  HiLink sqlVariable             Identifier
  HiLink mysqlComment            Comment
  
  HiLink mysqlColumnType         Type
  HiLink mysqlColumnFloat1       Type
  HiLink mysqlColumnFloat2       Type
  HiLink mysqlColumnDouble1      Type
  HiLink mysqlColumnDouble2      Type
  HiLink mysqlColumnReal         Type
  HiLink mysqlColumnNumeric      Type
  HiLink mysqlColumnDecimal1     Type
  HiLink mysqlColumnDecimal2     Type
  HiLink mysqlColumnDecimal1     Type
  HiLink mysqlColumnDecimal2     Type
  HiLink mysqlColumnTimestamp    Type
  HiLink mysqlColumnYear         Type
  HiLink mysqlColumnChar         Type
  HiLink mysqlColumnVarchar      Type
  HiLink mysqlColumnEnum         Type
  HiLink mysqlColumnSet          Type

  HiLink mysqlOperator           Statement
  HiLink mysqlOperatorIsNull     Statement
  HiLink mysqlOperatorIsnull     Statement
  HiLink mysqlOperatorIsNotNull  Statement
  HiLink mysqlOperatorCoalesce   Statement
  HiLink mysqlOperatorInterval   Statement
  
  HiLink mysqlFlow               Special
  HiLink mysqlFlowIfNull         Special
  HiLink mysqlFlowNullIf         Special
  
  HiLink mysqlKeyword            Statement

  delcommand HiLink
endif


" #############################
" # Mark the syntax as defined
" #############################

let b:current_syntax = "mysql"

