bits 16
org  0x100

VADDR equ 0xb800

; ID, segmento, offset
%macro setint 3
  mov bx, (%1) * 4
  mov word [es:bx], %3
  mov word [es:bx + 2], %2
%endmacro


; -- Main -- ;
mov ax, 0
mov es, ax

setint 0x66, cs, int_putchar

mov al, 'A'
mov ah, 0x0B
int 0x66

mov ah, 0x0C
int 0x66

ret

; -- Interrupção -- ;
int_cursor: dw 0

; Argumentos:
;   AL    Caractere
;   AH    Atributo
int_putchar:
  push es
  mov bx, VADDR
  mov es, bx

  mov di, [int_cursor]
  mov word [es:di], ax

  add word [int_cursor], 2
  pop es
  iret