all:
	nasm *asm -f elf64
	gcc -c *.c
	gcc -no-pie *.o -o teste
