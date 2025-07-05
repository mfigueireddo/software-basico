#include <stdio.h>

int main (void) {

  // Parte 1
  int x = 0xffffffff;
  int y = 2;
  // Antes
  printf("x=%d, y=%d\n", x, y);
  printf("x é menor do que y? %s\n\n", (x<y)?"sim":"nao");
  // Depois
  printf("x=%u, y=%u\n", x, y);
  printf("x é menor do que y? %s\n", (x<y)?"sim":"nao");
  
  // Parte 2
  unsigned int x = 0xffffffff;
  unsigned int y = 2;
  // Antes
  printf("x=%d, y=%d\n", x, y);
  printf("x é menor do que y? %s\n", (x<y)?"sim":"nao");
  // Depois
  printf("x=%u, y=%u\n", x, y);
  printf("x é menor do que y? %s\n", (x<y)?"sim":"nao");
  
  // Parte 3
  int x = 0xffffffff;
  unsigned int y = 2;
  printf("x=%d, y=%d\n", x, y);
  printf("x é menor do que y? %s\n", (x<y)?"sim":"nao");
  
  return 0;
}