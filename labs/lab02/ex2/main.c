#include <ctype.h>
#include <stdio.h>

int string2num (char *s, int base) {
  int a = 0;
  int aux;
  for (; *s; s++){
      if (!isdigit(*s)){
        aux = *(s) - 'a';
        aux += 10;
      }
      else aux = (*s - '0');
    a = a*base + aux;
  }
  return a;
}

int main (void) {
  printf("%d\n", string2num("777", 8));
  printf("%d\n", string2num("777", 10));
  printf("%d\n", string2num("ab", 16));
  return 0;
}