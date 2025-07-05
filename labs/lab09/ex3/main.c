#include <stdio.h>

void foo (int a[], int n);

int main (void) {
 
  int nums[] = {10, 5, 0, 2};
  foo(nums, 4);
  for(int i=0; i<4; i++){
     printf("%d ", nums[i]);
  }
  return 0;
}