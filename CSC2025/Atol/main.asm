.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _ReadConsoleA@20: near

.data
inputHandle		DD	?	
readBuffer		DB	1024	DUP(00h) ;1024 bytes, fill with 0's
numCharsToRead	DD	1024	
numCharsRead	DD	?


outputHandle	DD	?
numWritten		DD	?
writeBuffer		DB	1024	DUP(00h)

answer			DD	?

.code

main PROC near
_main:
	
	call AToi

	

	push	0
	call	_ExitProcess@4


main ENDP

AToi	PROC  near

	push	ebp
	mov		ebp, esp
	mov		ecx, 10

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
	push	offset numCharsRead
	push	numCharsToRead
	push	offset readBuffer
	push	inputHandle
	call	_ReadConsoleA@20

	mov		ebx, offset readBuffer
	mov		answer, 0		 ;ensure answer is set to 0 for correct total
	_atoi:
	mov		dx, [ebx]
	cmp		dx, 0
	jz		_exit

	mov		eax, edx

	sub		eax, 48
	imul	ecx, eax		;it wasn't happy with just 10, so I put 10 in ecx so it would stop crying
	add		answer, eax
	add		ebx, 1


	jnz		_atoi




	_exit:

	add		answer, 23

	mov		esp, ebp	;snap back to EBP
	pop		ebp			;restore callers EBP



AToi	ENDP

END
