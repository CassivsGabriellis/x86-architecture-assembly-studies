#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>

void segfault(int singnum)
{
    fputs("CHAMAS INFERNAIS!\n", stderr);
    exit(singnum);
}

int main(void)
{
    char *desastre = NULL;
    struct sigaction action;

    action.sa_handler = segfault;

    sigaction(SIGSEGV, &action, NULL);

    strcpy(desastre, "EITA!");

    puts("ATÉ MAIS VER, MUNDO CRUEL!");
    return 0;
}