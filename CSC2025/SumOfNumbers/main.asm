.386P
.model flat

extern _ExitProcess@4: near
extern _WriteConsoleA@20: near
extern _GetStdHandle@4: near


.data


.code

main PROC near
_main:

	mov		ecx, 10
	move	eax, 0

_loop:
	cmp		ecx, 0
	jz		_exit
	
	add		eax, ecx
	add		ecx, -1
	jmp		_loop

_exit:

	push	0
	call	_ExitProcess@4

main ENDP
END
