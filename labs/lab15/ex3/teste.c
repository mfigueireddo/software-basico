#include <stdio.h>
#include <math.h>

double foo (float a, float b) {
  return sin(a) + cos(b);
}

int main(void){

  printf("%lf\n", foo(1.5708,1.0472));

  return 0;
}