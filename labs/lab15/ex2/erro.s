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

    cvtss2sd %xmm0, %xmm0 /* (a) float -> double */
    call sin /* a = sin(a) */
    cvtsd2ss %xmm0, %xmm0/* (a) double -> float */
    addss %xmm1, %xmm0 /* a = a + b */

    leave
    ret
