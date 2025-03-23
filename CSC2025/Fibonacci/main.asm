.386P
.model flat

extern _ExitProcess@4: near

.data
fibN    DWORD   ?  ;another way to track result in watch window

.code


;fib(1) = 1, fib(2) = 1, fib(n) = fib(n-1) + fib(n-2)
main PROC near
_main:
    ;ask user nth term
    ;-1 from answer from user (first term is already included in how I set it up)
    ;mov result into ecx

    mov   ecx, 9    ;this is my nth term   ecx is loop counter lets GOO 
    mov   eax, 0    ; stores fib n in member, and fib(n-2) at start of loop
    mov   edx, 1    ; fib(n-1)
    mov   ebx, 0    ; fib(n-2) until moved into eax
    mov   fibN, edx ; moves fib(n-1) 
    
FibLoop:
    mov  eax, ebx   ;fib(n-2) into eax
    add  eax, edx   ;formula to find fib.. fib(n) = fib(n-1)+fib(n-2)
    mov  fibN, eax  ;current fib(n) from eax into the var fibN
    mov  ebx, edx   ;fib(n-1) becomes fib(n-2)
    mov  edx, eax   ;fib(n) becomes fib(n-1)
    Loop FibLoop

	push	0
	call	_ExitProcess@4

main ENDP
END
