.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near


.data
inputHandle		DD	?	
readBuffer		DB	1024	DUP(00h) ;1024 bytes, fill with 0's
numCharsToRead	DD	1024	
numCharsRead	DD	?

outputHandle	DD	?
written			DD	?
out_handle		DD	?
writeBuffer		DB	1024	DUP(00h)

promptOne		DB		'Enter number 1: ',0ah
promptTwo		DB		'Enter number 2: ',0ah
resultPrompt	DB		'The multiplicaton result is: ', 0ah

valueOne		DD	?
valueTwo		DD	?
answer			DD	?
strMulResult	DD	1042	DUP(00h), 0ah ;  push t
mulResult		DD	?
.code



main PROC near
_main:

	push	-10
	call	_GetStdHandle@4
	mov		inputHandle, eax


	; Get stdout file handle
	; handle = GetstdHandle(-11)
	push	-11
	call	_GetStdHandle@4
	mov		out_handle, eax


	; prints the prompt for the first user input to the screen
	; WriteConsole(out_handle, &msg, 16, &written, 0)
	push	0
	push	offset written
	push	16
	push	offset promptOne
	push	out_handle
	call	_WriteConsoleA@20



	call	prompt_User
	mov		valueOne, edi	;move the value recieved from user 


	; prints the prompt for the second user input to the screen
	push	0
	push	offset written
	push	16
	push	offset promptTwo
	push	out_handle
	call	_WriteConsoleA@20

	
	call	prompt_User
	mov		valueTwo, edi	;move the value recieved from user


	;multiply the values

	mov		eax, [valueOne]
	mov		ecx, [valueTwo]

	MUL		ecx
	mov		mulResult, eax	

	;multiplied value is now in eax per how mul works (it is very strange)

;	call	Itoa

	;prints the result prompt showing multiplication to the screen
	push	0
	push	offset written
	push	29
	push	offset resultPrompt
	push	out_handle
	call	_WriteConsoleA@20





	push	0
	call	_ExitProcess@4

main ENDP


prompt_User		PROC	near
	push	ebp
	mov		ebp, esp

	;ReadConsole(handle, @buffer, numCharsToRead, &numCharsRead, null)
	push	0
	push	offset numCharsRead
	push	numCharsToRead
	push	offset readBuffer
	push	inputHandle
	call	_ReadConsoleA@20

	call	AToi

	
	mov		esp, ebp	;snap back to EBP
	pop		ebp			;restore callers EBP
	ret		4

prompt_User	ENDP


AToi	PROC  near

	push	ebp
	mov		ebp, esp
	mov		ecx, 10


	;substract two from readBuffer result  - numCharsRead

	mov		ebx, offset readBuffer
	mov		answer, 0		 ;ensure answer is set to 0 for correct total
	mov		edi, 0
	mov		esi, numCharsRead
	sub		esi, 2
	_atoi:
	xor		edx, edx
	mov		dl, [ebx]
	cmp		esi, 0
	jz		_exit

	mov		eax, edx
	; k * 10 + (*string) - '0'
	sub		eax, '0'    		;covert from ASCII to Decimal
	imul	edi, 10				;it wasn't happy with just 10, so I put 10 in ecx so it would stop crying    mul total by 10
	add		edi, eax			;add current digit to total
	add		ebx, 1				;goto next byte in string

	dec		esi
	jmp		_atoi

	_exit:
	mov		answer, edi

	mov		esp, ebp	;snap back to EBP
	pop		ebp			;restore callers EBP

	ret 

AToi	ENDP
	
Itoa	PROC  near
	push	ebp
	mov		ebp, esp

	mov		edi, 10

_next_digit:
	cmp		eax, 0
	jz		_no_more_digits

	

	div		edi


	push	edx


	loop

	_no_more_digits:

	mov		esp, ebp	;snap back to EBP
	pop		ebp			;restore callers EBP
	ret
Itoa	ENDP
END


