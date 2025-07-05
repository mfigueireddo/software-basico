#include <stdio.h>

float foo (double a, float b);

int main(void){

    printf("%f\n", foo(0.5,1.8));
    // Resultado esperado: -2.990000

    return 0;
}