.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _ReadConsoleA@20: near
extern writeLine: near

.data

return_string	DD	?


.code

itoa PROC near

_itoa:
	push	edx
	push	ebx
	push	edi
	push	ebp
	mov		ebp, esp

	
	mov		ebx, 0		;loop till 0

_next_digit:
	
	xor		edx, edx
	mov		edi, 10		;divide by 10
	div		edi
	cmp		edx, 0			;check for remainder of 0     (has the remainder)
	jz		_no_more_digits

	add		edx, '0'	;convert to ascii
	mov     [return_string + ebx], edx
	add		ebx,  1

	jmp		_next_digit

_no_more_digits:
	add		ebx, 1
	mov		[return_string + ebx], 0

	
	mov		edx, offset return_string
	push	edx
	call	writeLine

	mov		esp, ebp	;snap back to EBP
	pop		ebp			;restore callers EBP
	pop		edi
	pop		ebx
	pop		edx
	ret

itoa ENDP

END