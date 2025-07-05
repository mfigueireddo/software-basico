/*

float foo (float a, float b) {
  return sin(a) + b;
}

double sin(double x);

*/

.globl foo
.text

foo:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp

    cvtss2sd %xmm0, %xmm0 /* (a) float -> double */
    cvtss2sd %xmm1, %xmm1 /* (b) float -> double */
    movsd %xmm1, -8(%rbp)

    call sin /* a = sin(a) */

    movsd -8(%rbp), %xmm1
    addsd %xmm1, %xmm0 /* a = a + b */
    
    cvtsd2ss %xmm0, %xmm0

    leave
    ret
