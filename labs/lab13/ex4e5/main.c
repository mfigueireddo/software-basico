#include <stdio.h>

typedef int (*funcp)(int x);

int main(void){

  int add (int x) {
    printf("\nEntrou\n");
    return x+1;
  }
    
  unsigned char codigo[] = { 0x55, 0x48, 0x89, 0xe5, 0xe8, 0x00, 0x00, 0x00, 0x00, 0xc9, 0xc3 };
    
  long posAdd = (long)add;
  long posNext = (long)&codigo[9];

  int diferenca = (int)(posAdd - posNext);

  for(int cont = 8; cont >= 5; cont--){
    codigo[cont] = (diferenca & 0xFF000000) >> 24;
    diferenca = diferenca << 8;
  }
  
  funcp f = (funcp)codigo;
  int i = (*f)(10);

  printf("%d\n", i);

  return 0;
}