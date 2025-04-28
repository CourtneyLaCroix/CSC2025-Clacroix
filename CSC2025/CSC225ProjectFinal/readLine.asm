.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data
inputHandle		DD	?
outputHandle	DD	?
readBuffer		DB	1024	DUP(00h) ;1024 bytes, fill with 0's
numCharsToRead	DD	1024	
numCharsRead	DD	?
answer			DD	?

.code

readLine	PROC  near

	push	ebp
	mov		ebp, esp


	;handle	= GetStdHandle(-10)
	push	-10
	call	_GetStdHandle@4
	mov		inputHandle, eax

	;handle = GetStdHandle(-11)
	push	-11
	call	_GetStdHandle@4
	mov		outputHandle, eax

	;ReadConsole(handle, @buffer, numCharsToRead, &numCharsRead, null)
	push	0
	push	[ebp + 8]
	push	numCharsToRead
	push	[ebp + 12]
	push	inputHandle
	call	_ReadConsoleA@20 


	mov		esp, ebp	;snap back to EBP
	pop		ebp			;restore callers EBP

	ret		8


readLine	ENDP
END