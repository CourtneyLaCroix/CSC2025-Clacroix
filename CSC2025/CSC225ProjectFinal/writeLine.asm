.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _ReadConsoleA@20: near
extern _WriteConsoleA@20: near


.data
	printMe		DD		?
	count_char	DD		?
	out_handle	DD		?
	written		DD		?

.code

writeLine	PROC	near

	push	ebp
	mov		ebp, esp
	push	esi		

	;Subroutine

	push	edx
	mov		edx, [ebp + 8]
	mov		edi, 0 


	_char_counter:	
	mov		cl, [edx]
	cmp		cl, 0
	jz		_exit

	inc		edi
	add		edx, 1

	jnz		_char_counter
	
	_exit:
	pop		edx
	mov		[count_char], edi


	push	-11
	call	_GetStdHandle@4		; this function will return the stack before the push of -11
	mov		out_handle, eax

	push	0
	push	offset written
	push	edi
	push	[ebp + 8]
	push	out_handle
	call	_WriteConsoleA@20			;returns the stack before all of the above pushes

	;Epilogue
	pop		edx
	pop		esi
	mov		esp, ebp	;snap back to EBP
	pop		ebp			;restore callers EBP
	ret		4

writeLine ENDP

END