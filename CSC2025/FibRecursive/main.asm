.386P
.model flat

extern _ExitProcess@4: near
include	fibRecursive.asm

.data


.code

main PROC near
_main:

	mov		edx, 6
	push	edx
	call	fibRecursive



	push	0
	call	_ExitProcess@4


main ENDP
END
