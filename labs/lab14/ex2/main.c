#include <stdio.h>

#define makefloat(s,e,f) ((s & 1)<<31 | (((e) & 0xff) << 23) | ((f) & 0x7fffff))

#define getsig(x)  ((x)>>31 & 1)
#define getexp(x)  ((x)>>23 & 0xff)
#define getfrac(x) ((x) & 0x7fffff)

typedef union{
    float f;
    unsigned int i; 
} U;

float int2float(int i);
void int2bin(unsigned int x);

int main(void){

    printf("8 int = %.2f float\n", int2float(8));
    printf("15 int = %.2f float\n", int2float(15));
    printf("-8 int = %.2f float\n", int2float(-8));
    printf("-15 int = %.2f float\n", int2float(-15));
    return 0;
}

float int2float(int i){
    if (i == 0) return 0;
    
    unsigned int unsignedI, sinal, expoente, fracionario, lido;
    int cont;
    U resultado;

    cont = 1;

    // Identificar o sinal
    // Se for negativo, utilizar o valor absoluto
    sinal = (i < 0) ? 1 : 0;
    if (sinal != 0) i = -i;
    unsignedI = i;
    unsignedI = unsignedI << 1;

    // Achar o primeiro 1
    // Como? Enquanto o bit lido for diferente de 1 e enquanto houverem bits a serem lidos
    lido = 0;
    while(lido == 0 && cont<32){
        lido = unsignedI & 0x80000000;
        unsignedI = unsignedI << 1;
        cont++;
    }

    // Contar quantas vírgulas andar
    // Como? Descontar o número de bits do número de casas andadas até achar o 1
    expoente = 127 + (32 - cont);

    // Pegar a parte fracionária
    // Como? Copiar o que restou no número e depois mover para sua posição inicial
    fracionario = unsignedI;
    fracionario = fracionario >> 9;

    resultado.i = makefloat(sinal,expoente,fracionario);

    return resultado.f;
}

void int2bin(unsigned int x){
    unsigned int aux;
    printf("\n");
    for(int i=0; i<32; i++){
        if(i % 4 == 0 && i != 0) printf(" ");
        aux = x & 0x80000000;
        if (aux) printf("1");
        else printf("0");
        x = x << 1;
    }
    printf("\n");
}