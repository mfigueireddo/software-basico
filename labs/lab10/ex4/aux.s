/*

int f(int x);

void map2 (int* um, int * outro, int n) {
  int i;
  for (i=0; i<n; i++)
    *(outro+i) = f(*(um+i));
}

*/

.text
.globl map2

/* callee-saved: ebx (contador) e r12 (*um) */
/* parâmetros passados: rdi (*um), rsi (*outro) e edx (n) */
/* parâmetros a passar: edi (*(um+i)) */

map2:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    movq %r12, -16(%rbp)
    movq %rbx, -8(%rbp)
    
    movl $0, %ebx /* i = 0 */
    movq %rdi, %r12 /* backup um */

for:
    cmpl %edx, %ebx /* i < n */
    jge fim

    movl (%r12), %edi /* move *(um) para o 1o parametro */
    call f

    movl %eax, (%rsi) /* *(outro) = retorno de f */

    addl $1, %ebx /* i++ */
    addq $4, %r12 /* um++ */
    addq $4, %rsi /* outro++ */
    
    jmp for

fim:
    movq -16(%rbp), %r12
    movq -8(%rbp), %rbx
    leave
    ret
 