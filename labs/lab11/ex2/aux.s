/*

int addl (int a[], int n);

int bemboba (int num) {
  int local[4]; // 4*4 = 16
  int *a;
  int i;

  for (i=0,a=local;i<4;i++) {
    *a = num;
    a++;
  }
  return addl (local, 4);
}

*/

.text
.globl bemboba

/* parâmetros recebidos: %edi (int num) */
/* parâmetros a serem passados: %rdi, %esi (int *a, int n) */
/* callee-saved: %rbx (contador) */

bemboba:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
    movq %rbx, -24(%rbp) /* i */
    movq %r12, -32(%rbp) /* ptr a */


    movl $0, %ebx /* i = 0 */
    leaq -16(%rbp), %r12 /* a = local[0] */

loop:
    cmpl $4, %ebx /* i < 4 */
    jge fim

    movl %edi, (%r12) /* *(a) = num */

    addq $4, %r12 /* a++ */
    addl $1, %ebx /* i++ */

    jmp loop

fim:
    leaq -16(%rbp), %rdi /* move local[0] para o 1o parametro de addl */
    movl $4, %esi /* move 4 para o 2o parametro de addl */
    call addl

    movq -24(%rbp), %rbx
    movq -32(%rbp), %r12

    leave
    ret
