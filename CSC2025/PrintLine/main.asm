.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data
	msg		DB	'Hello World' ,0ah   ;12 chars + the 0a, which is a newline character
	len		equ $ - msg				;determine the len of the str by subtracting
									;location of the start of the string from the
									;location after the string

	out_handle	DD		?
	written		DD		?

.code

main	PROC	near
_main:
	; Get stdout file handle
	; handle = GetstdHandle(-11)
	push	-11
	call	_GetStdHandle@4
	mov		out_handle, eax

	call	print_line


	push	0
	call	_ExitProcess@4

main ENDP

print_line	PROC	near
	;will take one argument, the address of a string in memory
	;has to figure out how long the string is

	push ebp     ; Save the old base pointer value.
	mov ebp, esp ; Set the new base pointer value.
	sub esp, 4   ; Make room for one 4-byte local variable.
	push edi     ; Save the values of registers that the function
	push esi     ; will modify. This function uses EDI and ESI.
  ; (no need to save EBX, EBP, or ESP)

	call	write_console

	;Epilogue
	pop		esi
	pop		edi
	mov		esp, ebp	;snap back to EBP
	pop		ebp			;restore callers EBP
	ret

print_line	ENDP

write_console	PROC	near
	push	0
	push	offset written
	push	len
	push	offset msg
	push	out_handle
	call	_WriteConsoleA@20
	ret

write_console	ENDP
END
