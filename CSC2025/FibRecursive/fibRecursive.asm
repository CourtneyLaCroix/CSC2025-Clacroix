.386P
.model flat


extern _fibRecursiveA@4: near

.data
	;expected data to be edx
	; paramter n is in  0x8(esp) store in edx
	; return via eax
	; ecx = n  (loaded from 0x(esp)
	; ebx = secondlast
	; eax = last 


.code
_fibRecursive:
	;prolog
	push	ebp
	mov		ebp, esp

    push    ebx     ;saved register
    push    ecx     ;saved register
  
    mov    ecx, [ebp + 12]     ;ecx = n
    mov    ebx, 0              ;ebx = 0
    mov    eax, 1              ;eax = 1
    jmp    fibrecurtime


fibreturning:
    add  eax, ebx             ; last = last + secondlast
    neg  ebx
    add  ebx, eax             ;secondlast = –secondlast + last
    dec  ecx                  ;n = n – 1
fibrecurtime:
    cmp  ecx, 0
    jne  fibreturning         ;if n != 0 goto fib1
 
     
	;Epilogue
	pop		ecx
    pop     ebx
	mov		esp, ebp	;snap back to EBP
	pop		ebp			;restore callers EBP
	ret		4

fibRecursive ENDP
END
