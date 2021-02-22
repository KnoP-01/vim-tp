" Vim syntax file
" Language: 	FANUC TP
" Author:   	Jay Strybis <jay.strybis@gmail.com>
" Contributors: Ben Coady
" URL:      	http://github.com/onerobotics/vim-tp
" License:  	MIT
" Modified: Patrick Knosowski knosowski@graeff.de

if exists("b:current_syntax")
  finish
endif

if version < 600
  syntax clear
endif

" Sysvars
" mod by Knosowski
" syn match       tpSysvar            /\.\?\$[a-zA-Z0-9.]\+/
syn match       tpSysvar            /$[a-zA-Z0-9_.$]\+/
hi def link     tpSysvar            Identifier

" Identifiers
" mod by Knosowski, was it on purpose that the _ is missing?
" syn match       tpIdentifier        /[a-zA-Z0-9]\+/
" hi def link     tpIdentifier        Identifier
syn match       tpIdentifier        /\w\+/
" mod by Knosowski, at least something should get the default text colour
hi def link     tpIdentifier        None

" Conditional
syn keyword     tpConditional       IF THEN ENDIF ELSE SELECT FOR TO DOWNTO ENDFOR
hi def link     tpConditional       Conditional

" Constants
syn keyword     tpBoolean           ON OFF TRUE FALSE ENABLE DISABLE
syn keyword     tpConstant          max_speed
hi def link     tpBoolean           Boolean
hi def link     tpConstant          Constant

" Units
" question Knosowski, aren't inch and some other none metric units missing
" here?
" mod by Knosowski, why use match here?
syn keyword       tpUnits             sec
syn keyword       tpUnits             msec
syn match       tpUnits             /%/
syn keyword       tpUnits             mm
syn keyword       tpUnits             deg
syn match       tpUnits             /mm\/sec/
syn match       tpUnits             /cm\/min/
syn match       tpUnits             /deg\/sec/
syn match       tpUnits             /in\/min/
hi def link     tpUnits             Special

" Modifiers
" mod by Knosowski, why use match here?
" syn match       tpMod               /ACC/
" syn match       tpMod               /Skip/
" syn match       tpMod               /PSPD/
syn match       tpMod               /\<ACC\d\+/
syn keyword       tpMod               AP_LD
syn keyword       tpMod               RT_LD
syn keyword       tpMod               Skip
syn keyword       tpMod               PSPD
syn keyword     tpMod               DA DB INC MROT Offset PTH TA TB Tool_Offset VOFFSET BREAK Wjnt
hi def link     tpMod               Special

" String Functions
" mod by Knosowski, fixed bug, multiple use of group tpString
syn keyword     tpStringFunc            FINDSTR STRLEN SUBSTR
hi def link     tpStringFunc            Special

" Labels
" mod by Knosowski, must be present befor tpData
" syn region      tpLabel             start="LBL\[" end="\]" contains=tpData,tpInteger,tpItemComment
syn keyword      tpLabel             LBL contained
hi def link     tpLabel             Label

" Data
" mod by Knosowski, added VW marker eg M[31]
" and should be self contained because of indirect addressing:
" eg: PR[R[45:comment of register 45]] or DI[PR[4,5]]
" syn region      tpData              start="AI\[" end="\]"     contains=tpInteger,tpItemComment
" syn region      tpData              start="AO\[" end="\]"     contains=tpInteger,tpItemComment
" syn region      tpData              start="DI\[" end="\]"     contains=tpInteger,tpItemComment
" syn region      tpData              start="DO\[" end="\]"     contains=tpInteger,tpItemComment
" syn region      tpData              start="F\[" end="\]"      contains=tpInteger,tpItemComment
" syn region      tpData              start="GI\[" end="\]"     contains=tpInteger,tpItemComment
" syn region      tpData              start="GO\[" end="\]"     contains=tpInteger,tpItemComment
" syn region      tpData              start="P\[" end="\]"      contains=tpInteger,tpItemComment,tpString
" syn region      tpData              start="PR\[" end="\]"     contains=tpInteger,tpItemComment
" syn region      tpData              start="AR\[" end="\]"     contains=tpInteger,tpItemComment
" syn region      tpData              start="R\[" end="\]"      contains=tpInteger,tpItemComment
" syn region      tpData              start="RI\[" end="\]"     contains=tpInteger,tpItemComment
" syn region      tpData              start="RO\[" end="\]"     contains=tpInteger,tpItemComment
" syn region      tpData              start="RSR\[" end="\]"    contains=tpInteger,tpItemComment
" syn region      tpData              start="SI\[" end="\]"     contains=tpInteger,tpItemComment
" syn region      tpData              start="SO\[" end="\]"     contains=tpInteger,tpItemComment
" syn region      tpData              start="SR\[" end="\]"     contains=tpInteger,tpItemComment
" syn region      tpData              start="UI\[" end="\]"     contains=tpInteger,tpItemComment
" syn region      tpData              start="UO\[" end="\]"     contains=tpInteger,tpItemComment
" syn region      tpData              start="VR\[" end="\]"     contains=tpInteger,tpItemComment
" syn region      tpData              start="RESUME_PROG\[" end="\]"     contains=tpInteger,tpItemComment
" syn region      tpData              start="TIMER\[" end="\]"  contains=tpInteger,tpItemComment
" syn region      tpData              start="TIMER_OVERFLOW\[" end="\]"  contains=tpInteger,tpItemComment
" syn region      tpData              start="UALM\[" end="\]"   contains=tpInteger,tpItemComment
" syn region      tpData              start="UFRAME\[" end="\]" contains=tpInteger,tpItemComment
" syn region      tpData              start="UTOOL\[" end="\]"  contains=tpInteger,tpItemComment
" syn region      tpData              start="MESSAGE\[" end="\]"  contains=tpInteger,tpItemComment
" syn region      tpData              start="JOINT_MAX_SPEED\[" end="\]"  contains=tpInteger,tpItemComment
" syn region      tpData              start="PAYLOAD\[" end="\]"  contains=tpInteger,tpItemComment
" syn region      tpData              start="FOUND_POS\[" end="\]"  contains=tpInteger,tpItemComment
" syn region      tpData              start="MES\[" end="\]"  contains=tpInteger,tpItemComment
" syn region      tpData              start="DIAG_REC\[" end="\]"  contains=tpInteger,tpItemComment
" syn region      tpData              start="DIAG_REC_SEC\[" end="\]"  contains=tpInteger,tpItemComment
syn region      tpData              start=/\(\_s\|\W\)\@1<=\w\+\[/ end=/\]/      keepend extend oneline contains=tpData,tpInteger,tpItemComment,tpDelimiter,tpLabel
hi def link     tpData              Type

" mod by Knosowski: added Delimiter [ and ] because in case of indirect addressing to
" much stuff has the same color. eg: LBL[PR[4,5:pregname]]
syn match tpDelimiter /[\[\]()]/
hi def link tpDelimiter Delimiter

" Item comment
" mod by Knosowski, anything but [ and ] is a valid comment char
" syn match       tpItemComment       /:[a-zA-Z0-9 ]\+/ contained
" question Knosowski: why not contains=@spell here?
syn match       tpItemComment       /:[^\[\]]\+/ contained
" mod by Knosowski, it's a comment, isn't it?
" hi def link     tpItemComment       Function
hi def link     tpItemComment       Comment

" Line numbers
" mod by Knosowski
" syn match       tpLineNumber        /^ \+:/
" syn match       tpLineNumber        /^ \+\d\+:/
syn match       tpLineNumber        /^\s*\d*:/ containedin=tpMotion,tpComment
hi def link     tpLineNumber        Comment 

" Strings
syn region      tpString            start="'" end="'"
syn region      tpString            start='"' end='"'
hi def link     tpString            String

" Numbers
" mod by Knosowski, the - will get operator highlight anyway, so we can skip
" this one here
" syn match       tpInteger           /[\-]\?\d\+/
syn match       tpInteger           /\d\+/
" syn match       tpFloat             /[\-]\?\d\+\.\d\+/
" syn match       tpFloat             /\.\?\d\+/
syn match       tpFloat             /\d*\.\d\+/
hi def link     tpInteger           Number
hi def link     tpFloat             Float

" Motion
" mod by Knosowski
" syn match       tpMotion            /\(A\|C\|J\|L\)\( P\)\@=/
syn match       tpMotion            /^\s*\d*:[ACJL]\ze P/
hi def link     tpMotion            Special

" Operators
" mod by Knosowski, added ! (logical NOT)
syn match       tpOperator          /[-!+*/=<>]/
" syn match       tpOperator          /+/
" syn match       tpOperator          /-/
" syn match       tpOperator          /*/
" syn match       tpOperator          /\//
" syn match       tpOperator          /=/
" syn match       tpOperator          />/
" syn match       tpOperator          /</
" syn match       tpOperator          />=/
" syn match       tpOperator          /<=/
syn keyword     tpOperator          AND DIV MOD OR
hi def link     tpOperator          Operator

" Keywords
syn match       tpKeyword           +/PROG+
syn match       tpKeyword           +/ATTR+
syn match       tpKeyword           +/APPL+
syn match       tpKeyword           +/MN+
syn match       tpKeyword           +/POS+
syn match       tpKeyword           +/END+
" question Knosowski, why not use keyword instead of match?
" syn keyword       tpKeyword           COL GUARD ADJUST DETECT STICK ON OFF LOCK UNLOCK PREG VREG SKIP CONDITION ERR_NUM LINEAR_MAX_SPEED MODELID ENC
syn match       tpKeyword           /COL GUARD ADJUST/
syn match       tpKeyword           /COL DETECT ON/
syn match       tpKeyword           /COL DETECT OFF/
syn match       tpKeyword           /STICK DETECT ON/
syn match       tpKeyword           /STICK DETECT OFF/
syn match       tpKeyword           /\v<(LOCK|UNLOCK) (PREG|VREG)>/
syn match       tpKeyword           /SKIP CONDITION/
syn match       tpKeyword           /ERR_NUM/
syn match       tpKeyword           /LINEAR_MAX_SPEED/
syn match       tpKeyword           /MODELID/
syn match       tpKeyword           /ENC/
" mod by Knosowski: added WHEN instruction, since you have MONITOR et al
" highlighted
" syn keyword     tpKeyword           ABORT CALL END FINE JMP JPOS LPOS MONITOR OVERRIDE PAUSE POINT_LOGIC PULSE RESET RUN START STOP STOP_TRACKING TIMEOUT UFRAME_NUM UTOOL_NUM WAIT RUN_FIND GET_OFFSET GET_PASSFAIL GET_NFOUND SET REFERENCE CAMER_CALIB GET_READING CONDITION TOOL_OFFSET OFFSET
syn keyword     tpKeyword             ABORT CALL END FINE JMP JPOS LPOS MONITOR OVERRIDE PAUSE POINT_LOGIC PULSE RESET RUN START STOP STOP_TRACKING TIMEOUT UFRAME_NUM UTOOL_NUM WAIT WHEN RUN_FIND GET_OFFSET GET_PASSFAIL GET_NFOUND SET REFERENCE CAMER_CALIB GET_READING CONDITION TOOL_OFFSET OFFSET
syn keyword     tpKeyword           AP_LD
" mod by Knosowski, included the number. Actually those are constants
" syn match       tpKeyword           /CNT/
syn match       tpKeyword           /CNT\d\+/
syn keyword     tpKeyword           CR
syn keyword     tpKeyword           RT_LD
" mod by Knosowski, why is $WAITTMOUT treated different than tpSysvar? It _is_
" a fanuc sysvar!
" syn match	tpKeyword           /$WAITTMOUT/
syn keyword	tpKeyword           ERROR_PROG
hi def link     tpKeyword           Keyword

" Comments
" mod by Knosowski, the ; will get highlighted different in comment lines
" without this modification. I like things to be consistant
" syn match       tpComment           /\(\s*\d*:\s*\)\@<=!.*/	contains=@spell
" syn region      tpComment           start="--eg:" end=";" contains=@spell
" syn match       tpRemark            /\(\s*\d*:\s*\)\@<=\/\/.*/
syn match       tpComment           /^\s*\d*:\s*!.*\ze ;/	contains=@spell
syn match       tpError             /\(!.\{32}\)\@<=.*\ze ;/ containedin=tpComment
syn region      tpComment           start="--eg:" end="\ze;" contains=@spell
" question Knosowski: why not contains=@spell here?
syn match       tpRemark            /\(\s*\d*:\s*\)\@<=\/\/.*\ze;/
hi def link     tpError             Error
hi def link     tpComment           Comment
hi def link     tpRemark            Comment

" Header stuff
syn keyword     tpHeader            OWNER ASCBIN MNEDITOR COMMENT PROG_SIZE CREATE DATE TIME MODIFIED FILE_NAME VERSION LINE_COUNT MEMORY_SIZE PROTECT READ_WRITE TCD STACK_SIZE TASK_PRIORITY TIME_SLICE BUSY_LAMP_OFF ABORT_REQUEST PAUSE_REQUEST DEFAULT_GROUP CONTROL_CODE AUTO_SINGULARITY_HEADER ENABLE_SINGULARITY_AVOIDANCE
hi def link     tpHeader            Define

let b:current_syntax = "tp"
