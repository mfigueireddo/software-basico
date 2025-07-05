#include <stdio.h>

typedef int (*funcp)(int x);

int main(void){

  int add (int x) {
    printf("\nEntrou:\n");
    return x+1;
  }
    
  unsigned char codigo[] = {0xe9, 0x00, 0x00, 0x00, 0x00, 0xc3 };
    
  long posAdd = (long)add;
  long posNext = (long)&codigo[5];

  int diferenca = (int)(posAdd - posNext);
  printf("Diferença: %x\n", diferenca);

  for(int cont = 4; cont >= 1; cont--){
    codigo[cont] = (diferenca & 0xFF000000) >> 24;
    diferenca = diferenca << 8;
  }

  for(int cont=0; cont<6; cont++){
    printf("%x ", codigo[cont]);
  }

  funcp f = (funcp)codigo;
  int i = (*f)(10);

  printf("Resultado %d\n", i);

  return 0;
}