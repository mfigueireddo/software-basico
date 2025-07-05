#include <stdio.h>
#include <math.h>

double foo(double *a, int n) {
  int i;
  double r = 0.0;
  for (i=0; i<n; i++) {
    r += sin(*a);
    a++;
  }
  return r;
}

int main(void){

    double a = 1.5708;

    printf("%f\n", foo(&a,3));

    return 0;
}