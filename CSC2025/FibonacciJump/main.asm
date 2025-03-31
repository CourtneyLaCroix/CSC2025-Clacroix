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

	mov		ecx, 5		;num to cmp to 

	_fib:
	cmp		eax, ecx
	;jae		_exit:   need to get this flag to work


	add		edx, ebx			;next = current + previous
	add		eax, edx
	mov		ebx, edx			;prev = current
	mov		edx, eax			;current = next;


	jmp		_fib


	_exit:


	push	0
	call	_ExitProcess@4

main ENDP
END
