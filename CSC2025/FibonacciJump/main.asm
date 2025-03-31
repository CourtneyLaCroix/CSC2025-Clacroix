.386P
.model flat

extern _ExitProcess@4: near

.data


.code

main PROC near
_main:
	
	mov		eax, 1		;eax should take the value of n		next
	mov		edx, 1		;fib(n-1)							current
	mov		ebx, 1		;fib(n-2) until moved into eax		prev

	mov		edi, 5		;num to cmp to 
	mov		ecx, 0
	_fib:
	cmp		edi, ecx
	jae		_exit   ;need to get this flag to work


	add		edx, ebx			;next = current + previous
	mov		eax, edx
	mov		ebx, edx			;prev = current
	mov		edx, eax			;current = next;
	inc		ecx
	
	jmp		_fib

_exit:


	push	0
	call	_ExitProcess@4

main ENDP
END
