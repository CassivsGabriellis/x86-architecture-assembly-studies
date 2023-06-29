bits 64

section .text

global assembly
assembly:
  mov rax, 60
  mov rdi, 0
  syscall
  ret
