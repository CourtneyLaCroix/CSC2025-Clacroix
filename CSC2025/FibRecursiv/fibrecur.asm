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

    push    ebx     ;saved register
    push    ecx     ;saved register
  
    mov    ecx, [ebp + 8]      ;ecx = n     grabs value passed ecx
    mov    ebx, 0              ;ebx = 0
    mov    eax, 1              ;eax = 1
    jmp    _fibrecurtime


_fibreturning:
    add  eax, ebx             ;last = last + secondlast
    neg  ebx
    add  ebx, eax             ;secondlast = –secondlast + last
    dec  ecx                  ;n = n – 1
_fibrecurtime:
    cmp  ecx, 0
    jne  _fibreturning         ;if n != 0 goto fibreturning
 
     
	;Epilogue
	pop		ecx
    pop     ebx
	mov		esp, ebp	;snap back to EBP
	pop		ebp			;restore callers EBP
	ret		4


	push	0
	call	_ExitProcess@4

fibrecur	ENDP
END