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

  movss %xmm1, -16(%rbp) /* b -> -16(%rbp) */

  cvtss2sd %xmm0, %xmm0 /* (a) float -> double */
  call sin /* sin(a) */
  movsd %xmm0, -8(%rbp) /* sin(a) -> -8(%rbp) */
  
  movss -16(%rbp), %xmm0 /* b -> xmm0 */
  cvtss2sd %xmm0, %xmm0 /* (b) float -> double */
  call cos /* cos(b) */
    
  addsd -8(%rbp), %xmm0 /* xmm0 += sin(a) */

  leave
  ret
