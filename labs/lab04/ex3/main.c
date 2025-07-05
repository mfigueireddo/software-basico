#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

typedef unsigned packed_t;
// Mesma coisa que unsgined int

int string2num (char *s, int base) {
  int a = 0;
  for (; *s; s++) {
    // Números
    if(isdigit(*s))
      a = a*base + (*s - '0');
    // Letras maiúsculas
    else if((*s >= 'A') && (*s < (base-10+'A')))
      a = a*base + ((*s - 'A') + 10); 
    // Letras minúsculas
    else if((*s >= 'a') && (*s < (base-10+'a')))
      a = a*base + ((*s - 'a') + 10);
    // Erro
    else {
      printf("pane: numero invalido! \n");
      exit(1);
    }
  }
  return a;
}

int xbyte (packed_t word, int bytenum) {
  int aux;
  
  word = word >> 8*bytenum; // Move a quantidade de bytes desejada
  aux = word & 255; // Copia o byte menos significativo para memória
  
  /*
  int aux2;
  aux2 = word << ((bytenum -1) *8);
  word = word >> bytenum*8;
  */
  
  if (aux & 128) return (aux | -256); 
  // se o byte mais significativo for 1, devolve o aux com os bytes à esquerda ligados
  return aux;
}

int main (int argc, char **argv) {
  // argc -> quantidade de argumentos
  // argv -> argumentos
  // [0] -> comando exe
  // [1] -> número
  // [2] -> posição do byte
  int x;
  if (argc != 3) {
    // printf ("uso: %s <word (em hexadecimal)> <bytenum>\n", argv[0]);
    exit(1);
  }
  // atoi -> converte string para inteiro 
  x = xbyte(string2num(argv[1], 16), atoi(argv[2]));
  printf ("%08x  %d\n", x, x);
  return 0;
}