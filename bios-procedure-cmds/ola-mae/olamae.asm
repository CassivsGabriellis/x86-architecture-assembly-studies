        bits 16
        org  0x100

        %macro puts 2
        mov bx, %1
        mov bp, %2
        call puts
        %endmacro


        puts 0x000A, str1
        puts 0x000C, str2

        ret

str1: db `Hello World!\r\n`, 0
str2: db "Second message.", 0

                                ; BL = Atributo
                                ; BH = Página
                                ; BP = ASCIIZ String
puts:
        mov ah, 0x03
        int 0x10

        mov  di, bp
        call strlen
        mov  cx, ax
        
        mov al, 0b01
        mov ah, 0x13
        int 0x10

        ret


                                ; DI = ASCIIZ String
                                ; Retorna o tamanho da string
strlen:
        mov cx, -1
        xor ax, ax

        repnz scasb

        mov ax, -2
        sub ax, cx
        ret
