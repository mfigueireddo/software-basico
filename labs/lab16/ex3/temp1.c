#include <stdio.h>
#include "temp1.h"
#include "temp2.h"

char a = 1;

int main (void) {
  foo();
  printf("%d\n", a);
  return 0;
}