#include <stdio.h>

int odd_ones(unsigned int x){
  int contador = 0;
  while(x){
    if (x & 1){ 
      contador++;
    }
    x = x >> 1;
  }
  if (contador & 1) return 1;
  return 0;
}

unsigned char rotate_left(unsigned char x, int n){
  unsigned char auxiliar;
  for(int i=0; i<n; i++){
    auxiliar = (x & 0x80) >> 7;
    x = (x << 1) + auxiliar;
  }
  return x;
}

int main(void){

  // 1
  unsigned int x, y, z;
  x = 0x87654321;
  y = 0x000000FF;
  z = x & y;
  // x = 1000 0111 0011 0101 0100 0011 0010 0001
  // y = 0000 0000 0000 0000 0000 0000 1111 1111
  // z = 0000 0000 0000 0000 0000 0000 0010 0001
  printf("0x%08X & 0x%08X = 0x%08X\n", x, y, z);
  
  y = 0xFF000000;
  z = x | y;
  // x = 1000 0111 0011 0101 0100 0011 0010 0001
  // y = 1111 1111 0000 0000 0000 0000 0000 0000
  // z = 1111 1111 0011 0101 0100 0011 0010 0001
    printf("0x%08X | 0x%08X = 0x%08X\n", x, y, z);
  
  // 2
  printf("%x tem numero %s de bits\n",0x01010101,odd_ones(0x01010101) ? "impar":"par");
  printf("%x tem numero %s de bits\n",0x01030101,odd_ones(0x01030101) ? "impar":"par");
  
  // 3
  printf("0x%02X\n", rotate_left(0x61,1)); 
  printf("0x%02X\n", rotate_left(0x61,2)); 
  printf("0x%02X\n", rotate_left(0x61,7)); 
  
  return 0;
}