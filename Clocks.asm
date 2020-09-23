; BIN: Clock cycles tester
; Peter Scale 2002

[BITS 32]

	enter 9,0		; reserve 9 bytes at ebp-9
	push ebx
	push esi
	push edi

	mov eax,1
	cpuid
	test edx,800000h	; test MMX bit
	setnz [ebp-9]		; if MMX set to 1
	fninit			; reset FPU
	mov dword[ebp-8],0

	mov ecx,[ebp+8]	; counter
foo#00000001:
	rdtsc			; read on chip clock counter
	mov [ebp-4],eax	; save ticks
	cld			; non-pairable filler
	times 8 nop		; fillers to avoid shadowing effect

	; nothing - this loop is needed to determine time of other instructions

	clc			; non-pairable 1 byte instruction as filler
	rdtsc
	sub eax,[ebp-4]	; calculate difference between ticks
	sub [ebp-8],eax	; subtract time of other instructions
	dec ecx
	jnz foo#00000001	; loop ecx times

	mov ecx,[ebp+8]
foo#00000002:
	push ebp
	push ecx
	rdtsc
	mov [ebp-4],eax
	cld
	times 8 nop

custom:

	clc
	rdtsc
	pop ecx
	pop ebp
	sub eax,[ebp-4]
	cmp byte[ebp-9],0	; test if MMX available
	jz short foo#00000003
	emms			; if it is then uninitialize
foo#00000003:
	fninit			; reset FPU to default state
	add [ebp-8],eax	; add all differences
	dec ecx
	jnz foo#00000002

	mov eax,[ebp-8]	; return
	pop edi
	pop esi
	pop ebx
	leave
	ret 16
