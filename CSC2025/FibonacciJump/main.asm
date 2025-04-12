.386P
.model flat

extern _ExitProcess@4: near

.data
fibN    DWORD   ? 


.code

main PROC near
_main:
	
	mov		eax, 8		;eax should take the value of n		next
	mov		edx, 1		;fib(n-1)							current
	mov		ebx, 0		;fib(n-2) until moved into eax		prev

	mov		edi, eax	;num to cmp to 
	mov		eax, 0
	
	_fib:
	dec		edi
	cmp		edi, 0
	je		_exit   
	

	mov  eax, ebx   ;fib(n-2) into eax
    add  eax, edx   ;formula to find fib.. fib(n) = fib(n-1)+fib(n-2)
    mov  fibN, eax  ;current fib(n) from eax into the var fibN
    mov  ebx, edx   ;fib(n-1) becomes fib(n-2)
    mov  edx, eax   ;fib(n) becomes fib(n-1)

	
	jmp		_fib

_exit:


	push	0
	call	_ExitProcess@4

main ENDP
END
