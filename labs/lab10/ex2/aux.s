/* 

int add2 (struct X *x) {
  if (x == NULL) return 0;
  else return x->val + add2(x->next);
}

*/

.text
.globl add
add:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    movq %rbx, -8(%rbp) /* x->val */

    cmpq $0, %rdi
    je fim1
    
    movl (%rdi), %ebx
    movq 8(%rdi), %rdi
    call add
    jmp fim2

fim1:
    movl $0, %eax
    movq -8(%rbp), %rbx
    leave
    ret

fim2:
    addl %ebx, %eax
    movq -8(%rbp), %rbx
    leave
    ret
