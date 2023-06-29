bits 64

section .text

global my_strlen
my_strlen:
    mov ecx, -1
    xor eax, eax
    
    repne scasb

    mov eax, -2
    sub eax, ecx
    ret