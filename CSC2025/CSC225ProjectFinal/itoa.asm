.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _ReadConsoleA@20: near

.data


.code

itoa PROC near
_itoa:
	push	ebp
	mov		ebp, esp

	mov		edi, 10

_next_digit:
	cmp		eax, 0
	jz		_no_more_digits

	

	div		edi


	push	edx


	_no_more_digits:

	mov		esp, ebp	;snap back to EBP
	pop		ebp			;restore callers EBP
	ret
itoa	ENDP
END

	


itoa ENDP

END