
/*
float foo (double a, float b) {
  return (a+b)*(a-b);
}
*/

.globl foo
.text

foo:
    pushq %rbp
    movq %rsp, %rbp

    /* xmm2 = conta 1 // xmm1 = conta 3 */
    
    cvtss2sd %xmm1, %xmm1 /* converte b de float para double */
    
    movsd %xmm0, %xmm2 /* move a para 1a conta */
    addsd %xmm1, %xmm2 /* adiciona b à 1a conta */

    movsd %xmm0, %xmm3 /* move a para 2a conta */
    subsd %xmm1, %xmm3 /* subtrai b à 2a conta */ 

    mulsd %xmm2, %xmm3 /* 1a conta * 2a conta */

    cvtsd2ss %xmm3, %xmm3 /* converte o resultado para float */

    movss %xmm3, %xmm0 /* retorna o resultado */

    leave
    ret
