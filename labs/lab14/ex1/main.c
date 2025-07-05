#include <stdio.h>

#define makefloat(s,e,f) ((s & 1)<<31 | (((e) & 0xff) << 23) | ((f) & 0x7fffff))

#define getsig(x)  ((x)>>31 & 1)
#define getexp(x)  ((x)>>23 & 0xff)
#define getfrac(x) ((x) & 0x7fffff)

typedef union{
    float f;
    unsigned int i; 
} U;

float float2(float f){
    U u;
    unsigned int aux, sinal, expoente, fracionario;

    u.f = f;
    aux = u.i;

    sinal = getsig(aux);
    expoente = getexp(aux);
    fracionario = getfrac(aux);

    expoente += 1;

    u.i = makefloat(sinal,expoente,fracionario);
    return u.f;
}

int main(void){

    printf("Retornado %.2f\n", float2(8.25));

    return 0;
}