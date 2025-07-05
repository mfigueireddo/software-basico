#include <stdio.h>

void dump (void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%p - %02x\n", p1, *p1);
    p1++;
  }
}

int main(void){

  signed char sc = -1;
  printf("%d\n", sc);
  
  printf("Dump de sc:\n");
  dump(&sc, sizeof(sc));
  
  unsigned int ui = sc;
  printf("%d\n", ui);
  
  printf("Dump de ui:\n");
  dump(&ui, sizeof(ui));

  return 0;
}