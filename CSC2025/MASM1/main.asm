.386P
.model flat

extern _ExitProcess@4: near

.data

.code

main PROC near

	push	0
	call	_ExitProcess@4

main ENDP
END