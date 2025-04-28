.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near
extern atoi: near
extern itoa: near
extern writeLine: near


.data
inputHandle		DD	?	
readBuffer		DB	1024	DUP(00h) ;1024 bytes, fill with 0's
numCharsToRead	DD	1024	
numCharsRead	DD	?

outputHandle	DD	?
written			DD	?
out_handle		DD	?
writeBuffer		DB	1024	DUP(00h)

promptOne		DB		'Enter number 1: ',0
promptTwo		DB		'Enter number 2: ',0
resultPrompt	DB		'The multiplicaton result is: ', 0

valueOne		DD	?
valueTwo		DD	?
answer			DD	?
strMulResult	DD	1042	DUP(00h), 0ah ;  push t
mulResult		DD	?

.code



main PROC near
_main:


	push	offset promptOne
	call	writeLine

	call	atoi
	mov		valueOne, edi	;move the value recieved from user 


	push	offset promptTwo
	call	writeLine

	call	atoi
	mov		valueTwo, edi	;move the value recieved from user


	;multiply the values

	mov		eax, [valueOne]
	mov		ecx, [valueTwo]

	MUL		ecx
	mov		mulResult, eax	

	;multiplied value is now in eax per how mul works (it is very strange)


	

	;prints the result prompt showing multiplication to the screen
	;mov		edx, offset resultPrompt

	push	offset resultPrompt
	call	writeLine

	push	[mulResult]
	call	itoa



	push	0
	call	_ExitProcess@4

main ENDP



END


