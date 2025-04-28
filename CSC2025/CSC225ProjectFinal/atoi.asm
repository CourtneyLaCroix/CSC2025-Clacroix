.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near
extern readLine: near

.data
inputHandle		DD	?
outputHandle	DD	?
readBuffer		DB	1024	DUP(00h) ;1024 bytes, fill with 0's
numCharsToRead	DD	1024	
numCharsRead	DD	?
answer			DD	?

.code



atoi	PROC  near

	push	ebp
	mov		ebp, esp
	mov		ecx, 10

	push	offset readBuffer
	push	offset numCharsRead
	call	readLine
	

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

	ret 4


atoi	ENDP
END