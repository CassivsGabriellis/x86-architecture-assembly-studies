bits 64

default rel

section .rodata
    msg: db "Hello World!", 0

section .text

global assembly:
assembly:
    lea rax, [msg]
    ret