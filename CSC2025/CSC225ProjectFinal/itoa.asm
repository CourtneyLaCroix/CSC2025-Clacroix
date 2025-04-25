.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _ReadConsoleA@20: near
extern writeLine: near

.data

return_string	DB	255, 0


.code

itoa PROC near

_itoa:
	push	ebp
	mov		ebp, esp
	push	edx
	push	ebx
	push	edi
	


	mov		eax, [ebp + 8]
	mov		ebx, 255		

_next_digit:
	
	xor		edx, edx
	mov		edi, 10			;divide by 10
	div		edi
	

	dec		ebx
	add		edx, '0'		;convert to ascii
	mov     [return_string + ebx], dl

	cmp		eax, 0			;check for remainder of 0     (has the remainder)
	jz		_no_more_digits

	jmp		_next_digit

_no_more_digits:
	add		ebx, offset return_string



	push	ebx
	call	writeLine

	
	pop		edi
	pop		ebx
	pop		edx
	mov		esp, ebp	;snap back to EBP
	pop		ebp			;restore callers EBP
	ret		4

itoa ENDP

END