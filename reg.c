reg.c

#include <stdio.h>
#include <stdint.h>

union reg
{
	uint32_t eax;
	uint16_t ax;

	struct  
	{
		uint8_t al;
		unint_t ah;
	};
};

int main(void)
{
	union reg x =  {.eax = 0x11223344};
	
	printf("AH: %02x\n"
		"AL: %02x\n"
		"AX: %04x\n"
		"EAX: %08x\n",
		x.ah,
		x.al,
		x.ax,
		x.eax);
	return 0;
}
