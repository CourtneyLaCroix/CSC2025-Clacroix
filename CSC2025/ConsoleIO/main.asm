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
numWritten		DD	?
writeBuffer		DB	1024	DUP(00h)



.code
main PROC near
_main:

	;handle	= GetStdHandle(-10)
	push	-10
	call	_GetStdHandle@4
	mov		inputHandle, eax

	;handle = GetStdHandle(-11)
	push	-11
	call	_GetStdHandle@4
	mov outputHandle, eax

	;ReadConsole(handle, @buffer, numCharsToRead, &numCharsRead, null)
	push	0
	push	offset numCharsRead
	push	numCharsToRead
	push	offset readBuffer
	push	inputHandle
	call	_ReadConsoleA@20

	;WriteConsole(handle, &buffer, numCharsToWrite, &numWritten, null)
	push 0
	push offset numWritten
	push numCharsRead
	push offset readBuffer
	push outputHandle
	call _WriteConsoleA@20


	push	0
	call	_ExitProcess@4

main ENDP
END
