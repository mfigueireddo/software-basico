/*

double foo (float a, float b) {
  return sin(a) + cos(b);
}

double sin(double x);
double cos(double x);

*/

.globl foo
.text

foo:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    movsd %xmm2, -4(%rbp)

    movss %xmm1, %xmm3

    /* sin(a) */
    cvtss2sd %xmm0, %xmm0 /* (a) float -> double */
    call sin
    movsd %xmm0, %xmm2 /* move sin(a) para xmm2 */

    /* cos(b) */
    cvtss2sd %xmm1, %xmm1 /* (b) float -> double */
    movsd %xmm1, %xmm0 /* move b para o 1o parâmetro */
    call cos
    movsd %xmm0, %xmm1 /* move cos(b) para xmm1 */

    /* a + b */
    movsd %xmm2, %xmm0 /* move sin(a) para retorno */
    addsd %xmm1, %xmm0 /* sin(a) + cos(b) no retorno */

    movsd -4(%rbp), %xmm2
    leave
    ret
