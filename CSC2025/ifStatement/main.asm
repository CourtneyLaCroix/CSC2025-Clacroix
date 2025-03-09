.386P
.model flat

extern _ExitProcess@4: near

.data
neg_msg		DB 'The number is negative'
pos_msg		DB 'The number is positive'

.code

main PROC near

	; Get stdout file handle
	; handle = GetstdHandle(-11)
	push	-11
	call	_GetstdHandle@4
	mov		out_handle, eax

	; WriteConsole(handle, &msg, 13, &written, 0)
	push	0
	push	offset written
	push	13
	push	offset msg
	push	out_handle
	call	WriteConsoleA@20

	mov	ecx, 056h
	cmp	ecx, 0
	js	_negative
	mov	ebx, pos_msg


-negative:
	move ebx, offset neg_msg


	push	0
	call	_ExitProcess@4

main ENDP
END
