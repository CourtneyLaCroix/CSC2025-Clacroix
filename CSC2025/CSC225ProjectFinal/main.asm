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

	push	ecx				;return value one in ecx
	call	prompt_User
	mov		valueOne, ecx	;move the value recieved from user 


	; prints the prompt for the second user input to the screen
	push	0
	push	offset written
	push	16
	push	offset promptTwo
	push	out_handle
	call	_WriteConsoleA@20

	push	ecx				;return value two in ecx
	call	prompt_User
	mov		valueTwo, ecx	;move the value recieved from user

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

	mov		ecx, offset readBuffer

	pop		ecx
	mov		esp, ebp	;snap back to EBP
	pop		ebp			;restore callers EBP
	ret		4

prompt_User	ENDP

END


