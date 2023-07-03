bits 16
org  0x100

; ID, segmento, offset
%macro setint 3
  mov bx, (%1) * 4
  mov word [es:bx], %3
  mov word [es:bx + 2], %2
%endmacro


; -- Main -- ;

xor ax, ax
mov es, ax

setint 0x03, cs, break

int3
int3

ret

; -- Breakpoint -- ;

break:
  mov ah, 0x0E
  mov al, 'X'
  int 0x10
  iret