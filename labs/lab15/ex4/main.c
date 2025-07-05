#include <stdio.h>
#include <math.h>

double foo (double *a, int n);

int main(void){

    double a = 1.5708;

    printf("%f\n", foo(&a,3));

    return 0;
}