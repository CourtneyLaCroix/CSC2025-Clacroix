.386P
.model flat

extern _ExitProcess@4: near


.data
msg			DB		'Hello World' ,0ah
out_handle	DD		?
written		DD		?

.code
main PROC near
_main:

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

	push	0
	call	_ExitProcess@4

main ENDP
END
