/*

struct X {
  int val1; // 4 bytes 0 1 2 3
  int val2; // 4 bytes 4 5 6 7
};

int f(int i, int v);

void boo (struct X *px, int n, int val) {
  while (n--) {
    px->val2 = f(px->val1, val);
    px++;
  }
}

*/

.text
.globl boo

/* callee-saved: rbx(contador) e r12(backup) */
/* parâmetros: rdi, rsi e rdx */

boo:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    movq %r12, -16(%rbp)
    movq %rbx, -8(%rbp)
    
    movl %esi, %ebx /* move o n para o callee-saved */
    movq %rdi, %r12 /* move *px para r12 */

while:
    cmpl $0, %ebx /* if n == 0 */
    je fim

    movl (%r12), %edi /* move px->val1 para o 1o parâmetro */
    movl %edx, %esi /* move val para o 2o parâmetro */
    call f /* chama a função f */
    movl %eax, 4(%r12) /* move o retorno da função para px->val2 */
    addq $8, %r12 /* px++ */
    subl $1, %ebx /* n-- */
    jmp while

fim:
    movq -16(%rbp), %r12
    movq -8(%rbp), %rbx
    leave
    ret
