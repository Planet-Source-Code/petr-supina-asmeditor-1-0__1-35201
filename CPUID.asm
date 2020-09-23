; BIN: CPU Identification
; Peter Scale 2002

[BITS 32]

	push ebp
	mov ebp,esp
	push ebx
	push esi
	push edi
				; first test if 'cpuid' available
	pushfd			; push Flags register
	pop ebx		; pop Flags register
	mov ecx,ebx		; duplicate
	xor ecx,200000h	; flip ID bit
	push ecx		; push changed Flags
	popfd			; pop to Flags
	pushfd			; again push Flags
	pop ecx		; pop back
	xor ecx,ebx		; if ecx = ebx then can't flip ID bit
	jnz Cont		; if not equal then 'cpuid' supported
	xor eax,eax		; failed - false
	jmp Exit		; and exit
Cont:
	mov eax,[ebp+8]	; set mode
	mov edi,[ebp+12]	; pointer to output buffer
	cpuid			; fill registers
	mov [edi],ebx
	mov [edi+4],edx
	mov [edi+8],ecx	; save these 3 registers in buffer
	mov [ebp+16],eax	; and eax in argument
	mov eax,-1		; success - true
Exit:
	pop edi
	pop esi
	pop ebx
	leave
	ret 16
