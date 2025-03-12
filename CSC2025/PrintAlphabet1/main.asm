.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

alphabet		DB	'a','b','c','d', 0  ; zero without quotes, represents null character
inputHandle		DD	?	
readBuffer		DB	1024	DUP(00h) ;1024 bytes, fill with 0's
numCharsToRead	DD	1024	
numCharsRead	DD	?

handle			DD	?
written			DD	?
writeBuffer		DB	1024	DUP(00h)


.code
main PROC near
_main:

	; Get stdout file handle
	; handle = GetstdHandle(-11)

	push	-11
	call	_GetStdHandle@4
	mov		handle, eax

	mov		ebx, offset alphabet 
	;mov		cl, [ebx] use this as an address, bring me whatever content is in ebx to cl, 
						;takes 4 bytes since ebx is 4 bytes
						;if AL was used, it would take the lower 16 bits
	;mov		esi, 0 

_loop:

	mov		cl, [ebx]

	;cmp		esi, 4 
	cmp		cl, 0
	jz		_exit
	
	push	0
	push	offset written
	push	1
	push	ebx
	push	handle
	call	_WriteConsoleA@20

	;inc		esi
	inc		ebx
	
	jmp		_loop

_exit:


	push	0
	call	_ExitProcess@4

main ENDP
END
