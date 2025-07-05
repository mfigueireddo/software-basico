/*

double foo(double *a, int n) {
  int i;
  double r = 0.0;
  for (i=0; i<n; i++) {
    r += sin(*a);
    a++;
  }
  return r;
}

double sin(double x);

*/

.globl foo
.text

foo:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
    movq %r12, -8(%rbp)
    movsd %xmm1, -12(%rbp)

    /* xmm1 = r */
    /* r12d = contador */

    /* r = 0 */
    movl $0, -16(%rbp)
    movsd -16(%rbp), %xmm1

    movl $0, %r12d /* i = 0 */

for:
    cmpl %esi, %r12d /* i<n */
    jge fim

    /* sin(*a) */
    movsd (%rdi), %xmm0
    call sin

    /* r += sin(*a) */
    addsd %xmm0, %xmm1

    jmp add

add:
    addl $1, %r12d /* i++ */
    addq $4, %rdi /* a++ */
    jmp for

fim:
    movsd %xmm1, %xmm0

    movq -8(%rbp), %r12
    movsd -12(%rbp), %xmm1
    leave
    ret
