.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

.code

main			PROC	near
_main:

	push	0
	call	_ExitProcess@4

main ENDP

print_line		PROC	near

	;Prolog

	;Subroutine

	;Epilogue

print_line	ENDP

write_console	PROC	near
	;Prolog

	;Subroutine

	;Epilogue

write_console	ENDP
END
