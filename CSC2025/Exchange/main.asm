.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near

.data
	
	num1			DD	10
	num2			DD	20
	num3			DD	30
	num4			DD	40

	handle			DD	?
	written			DD	?
	writeBuffer		DB	1024	DUP(00h)

.code

main PROC near
_main:

	; Get stdout file handle
	; handle = GetstdHandle(-11)

	push	-11
	call	_GetStdHandle@4
	mov		handle, eax

	mov		edi, num1
	mov		ecx, num2
	mov		edx, offset num3
	mov		ebx, offset num4



	xchg	edi, [ebx]	;addresses AND values exchanged when stepping through debugger
	xchg	ecx, [edx]	;same as above

	mov		num1, edi
	mov		num2, ecx


	;ask about why this wouldn't print later
	push	0
	push	offset written
	push	4
	push	ecx
	push	handle
	call	_WriteConsoleA@20


	push	0
	call	_ExitProcess@4

main ENDP
END
