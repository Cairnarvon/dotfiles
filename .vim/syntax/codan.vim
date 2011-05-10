" Vim syntax file
" Language:         Codan
" Maintainer:       Koen Crolla <cairnarvon@rotahall.org>
" Latest Revision:  2010-06-19

if exists("b:current_syntax")
    finish
endif

syn match codanRegister "[ΑΒΛ]"
syn match codanDeref    "[αβ]"
syn match codanArrow    "[←→]"
syn match codanOperator "[+−×÷↑]"
syn match codanComparer "[=≠<>≤≥≮≯≰≱]"
syn match codanLooper   "[«»]"
syn match codanToggle   "[א]"
syn match codanNumber   "[0-9]\+"
syn match codanError    "[a-zA-Z]"

hi def link codanRegister   Statement
hi def link codanDeref      Identifier
hi def link codanArrow      Special
hi def link codanOperator   Operator
hi def link codanComparer   Operator
hi def link codanLooper     Repeat
hi def link codanToggle     Statement
hi def link codanNumber     Constant
hi def link codanError      Error

let b:current_syntax = "codan"
