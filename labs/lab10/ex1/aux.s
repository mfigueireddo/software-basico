/*

struct X {
  int val; // 8 bytes 0 1 2 3 4 5 6 7
  struct X *next; // 8 bytes 8 9 10 11 12 13 14 15
};

int add (struct X *x) {
  int a = 0;
  for (; x != NULL; x = x->next)
    a += x->val;
  return a;
}

*/
   
.text
.globl add
add:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    movq %rbx, -8(%rbp) /* soma */

    movl $0, %ebx

for:
    cmpq $0, %rdi
    je fin

    addl (%rdi) ,%ebx
    movq 8(%rdi), %rdi
    jmp for

fin:
    movl %ebx, %eax
    movq -8(%rbp), %rbx
    leave
    ret
