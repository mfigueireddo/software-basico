#include <stdio.h>

float foo (double a, float b) {
  return (a+b)*(a-b);
}

int main(void){

    printf("%f\n", foo(0.5,1.8));

    return 0;
}