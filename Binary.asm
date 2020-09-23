; BIN: Binary Converter
; Peter Scale 2002

[BITS 32]

	push ebp
	mov ebp,esp
	push ebx
	push esi
	push edi

	mov cl,32
	mov edx,[ebp+12]	; ByRef number
	cmp byte[ebp+8],0	; mode
	jnz StrToBin
	mov eax,[edx]		; 32-bit number
	mov edi,[ebp+16]	; out string (size must be 32 chars)
For1:
	mov bl,0
	shl eax,1		; shift top bit into carry
	adc bl,48		; if not carry then '0' else '1'
	mov [edi],bl		; save char
	inc edi
	dec cl
	jnz For1
	mov eax,-1		; true
	jmp Exit
StrToBin:
	mov esi,[ebp+16]	; input string (32 chars)
For2:
	mov bl,[esi]
	sub bl,48		; convert char to value
	cmp bl,1		; compare value against 1
	ja Fail		; if above then failed
	cmc			; invert carry flag
	rcl eax,1		; set low bit from carry
	inc esi
	dec cl
	jnz For2
	mov [edx],eax		; store number
	mov eax,-1		; true
	jmp Exit
Fail:
	xor eax,eax		; false
Exit:
	pop edi
	pop esi
	pop ebx
	leave
	ret 16
