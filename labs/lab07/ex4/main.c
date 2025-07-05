#include <stdio.h>

int nums[4] = {65, -105, 111, 34};

int main (void) {

  int i;
  int soma = 0;

  for (i=0;i<4;i++) soma += nums[i];

  printf ("Soma = %d\n", soma);

  return 0;
}