.386P
.model flat

extern _ExitProcess@4: near

.data
	; expected data to be edx
	; n is in esp + 12 store in edx
	; return via eax
	; ecx = n  loaded from edx
	; ebx = secondlast
	; eax = last 


.code

fibrecur	PROC	 near
_fibRecursive:
	;prolog
	push	ebp
	mov		ebp, esp
	sub		esp, 4

	push    ebx     ;saved register
    push    ecx     ;saved register

	mov    ebx, 0              ;ebx = 0 basecase
	mov    ecx, [ebp + 8]      ;ecx = n     grabs value passed ecx

	cmp		ecx, 0
	jne		_fibreturning
	
	mov	    eax, 0				;eax should store the nth resulth 
	jmp		_epilogue


_fibreturning:
    cmp		ecx, 1
	jne		_fibrecurtime
	mov		eax, 1
	jmp		_epilogue
_fibrecurtime:

	mov		eax, [ebp + 8]
	dec		eax
	push	eax
	call	fibrecur

	mov		[ebp - 4], eax
	mov		eax, [ebp + 8]
	sub		eax, 2	
	push	eax
	call	fibrecur
	add		eax, [ebp - 4]


     
	_epilogue:

	push    ecx     ;returning saved values
    push    ebx     ;returning saved values

	add		esp, 4
	mov		esp, ebp	;snap back to EBP
	pop		ebp			;restore callers EBP
	ret		4		;we are returning one integer


	push	0
	call	_ExitProcess@4

fibrecur	ENDP
END