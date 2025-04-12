.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data
	msg			DB	'Hello World!!!', 0   ;12 chars + the 0a, which is a newline character
	
	count_char	DD		?
	out_handle	DD		?
	written		DD		?

.code

main	PROC	near
_main:
	
	mov		eax, offset msg
	push	offset msg
	call	print_line


	push	0
	call	_ExitProcess@4

main ENDP

print_line	PROC	near

	;prolog

	push	ebp
	mov		ebp, esp
	push	edi		; 
	push	esi		;callee process


	;Subroutine

	mov		edi, 0  ;edi is the incrimenter register

	_char_counter:	;is this called a flag??? its something you can to you
	mov		cl, [eax]
	cmp		cl, 0
	jz		_exit

	inc		edi
	add		eax, 1

	jnz		_char_counter
	
	_exit:

	mov		[count_char], edi

	; Get stdout file handle
	; handle = GetstdHandle(-11)

	push	-11
	call	_GetStdHandle@4		; this function will return the stack before the push of -11
	mov		out_handle, eax

	push	0
	push	offset written
	push	count_char
	push	offset msg
	push	out_handle
	call	_WriteConsoleA@20			;returns the stack before all of the above pushes

	;Epilogue
	pop		esi
	pop		edi
	mov		esp, ebp	;snap back to EBP
	pop		ebp			;restore callers EBP
	ret		4

print_line	ENDP

END
