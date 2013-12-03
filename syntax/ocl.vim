" Vim syntax file
" Language:    OCL
" Version:     0.0
" Maintainer:  Andreas Jaggi <andreas.jaggi@waterwave.ch>
" URL:         http://files.waterwave.ch/ocl.vim
" Last Change: 2006 January 22
" Changes:     0.0: first version
" Disclaimer:  Have fun, i didn't

" Remove any old syntax stuff
syn clear

syn keyword oclConditional  	if then else endif
syn keyword oclType		Int int boolean Boolean Double double Byte byte Short short Char char Long long Float float Real Date Integer

syn keyword oclStatement	Description description Alias alias Operation operation Messages messages Scope scope Post post Pre pre
syn keyword oclBoolean	   	true false
syn keyword oclConstant	   	null undefined
syn keyword oclTypedef	   	self super
syn keyword oclLangClass	String Set Sequence
syn keyword   oclTypedef     class

syn keyword oclOperator	and or AND OR
syn match   oclOperator	"[&><=:+\-*\/|@]"

syn match   oclFunction	"[\.)(,;\^]"
syn keyword oclFunction	forAll first asSequence including
syn keyword oclFunction	excluding exludes includes any
syn keyword oclFunction	isEmpty size insertAt select
syn keyword oclFunction	notEmpty exists @pre

" same number definition as in java.vim
syn match oclNumber "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match oclNumber "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match oclNumber "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match oclNumber "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"

syn region oclString start=+"+ end=+"+

" Comments
syn region	oclComment	start="/\*" end="\*/"
syn match	oclLineComment	"--.*"


if !exists("did_ocl_syntax_inits")
	let did_ocl_syntax_inits = 1

	" The default methods for highlighting. Can be overridden later
	hi link oclStatement	Statement
	hi link oclConditional	Conditional
	hi link oclType		Type
	hi link oclTypedef	Typedef
	hi link	oclBoolean	Boolean
	hi link oclFunction	Function
	hi link oclLangClass	Constant
	hi link	oclConstant	Constant
	hi link oclOperator	Operator
	hi link oclNumber	Number
	hi link oclString	String
	hi link	oclComment	Comment
	hi link	oclLineComment	Comment
	hi link oclInclude	Include
endif

let b:current_syntax = "ocl"
