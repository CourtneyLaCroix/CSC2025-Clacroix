.386P
.model flat

extern _ExitProcess@4: near
extern _WriteConsoleA@20: near
extern _GetStdHandle@4: near

.data
neg_msg		DB 'The number is negative'
pos_msg		DB 'The number is positive'
written		DW	?
handle		DD	?

.code
main PROC near
_main:


	mov		ecx, 056h
	cmp		ecx, 0
	js		_negative ; if cmp is negative, go to this flag

	mov		ebx, offset pos_msg
	jmp		_write_console


_negative:
	mov ebx, offset neg_msg

_write_console:


	; Get stdout file handle
	; handle = GetstdHandle(-11)
	push	-11
	call	_GetstdHandle@4
	mov		handle, eax

	; WriteConsole(handle, &msg, 22, &written, 0)
	push	0
	push	offset written
	push	22
	push	ebx
	push	handle
	call	_WriteConsoleA@20


	push	0
	call	_ExitProcess@4


main ENDP
END
