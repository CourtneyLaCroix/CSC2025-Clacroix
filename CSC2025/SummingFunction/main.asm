.386P
.model flat

extern _ExitProcess@4: near

.data

.code

main PROC near
_main:

	mov		esi, 23
	mov		edi, 34
	
	push	edi
	push	esi
	call	sum_two_num
	


	push	0
	call	_ExitProcess@4



main ENDP

sum_two_num PROC	near

	;Prolog
	push	ebp			;save caller's stackframe
	mov		ebp, esp	;set base of current stack frame
	sub		esp, 4		;space for local variable
	push	edi		;callee saved register
	push	esi		;callee saved register

	;Subroutine
	mov		edi, [ebp+8]	;first arg
	mov		esi, [ebp+12]	;second arg
	add		edi, esi		;takes the value of esi, adds it to edi and stores it in edi
	mov		eax, edi

	;Epilogue
	pop		esi
	pop		edi
	mov		esp, ebp	;snap back to EBP
	pop		ebp			;restore callers EBP
	ret
sum_two_num ENDP
END
