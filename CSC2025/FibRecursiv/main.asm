.386P
.model flat

extern _ExitProcess@4: near
extern fibrecur: near

.data
	



.code


main PROC near
_main:

	mov		edx, 6
	push	edx
	call	fibrecur    ;must have a ret 4

	push	0
	call	_ExitProcess@4

main ENDP
END
