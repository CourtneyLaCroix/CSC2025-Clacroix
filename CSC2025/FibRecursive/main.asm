.386P
.model flat

extern _ExitProcess@4: near
extern _fibRecursiveA@4: near

.data

mov		edx, 6
push	edx
call	_fibRecursive


.code

main PROC near
_main:


	push	0
	call	_ExitProcess@4


main ENDP
END
