.text
.globl foo

foo:
 pushq %rbp
 movq %rsp, %rbp
 subq $16, %rsp
 movq %rbx, -8(%rbp)
 movq %r12, -16(%rbp)
 
 /* ebx = contador */
 /* r12d = soma */

 /* rdi = números */
 /* esi = tamanho */

 movl $0, %ebx /* contador = 0 */
 movl $0, %r12d /* soma = 0 */

for:
 cmpl %esi, %ebx /* if contador >= n */
 jge final

 addl (%rdi), %r12d /* soma += número */

 cmpl $0, (%rdi) /* if número == 0 */
 je zera

 jmp impl

zera
 movl %r12d, (%rdi) /* número = soma */
 movl $0, %r12d /* soma = 0 */

 jmp impl

impl:
 addq $4, %rdi /* vetor += 4 */
 addl $1, %ebx /* contador += 1 */
 jmp for

final:
 movq -16(%rbp), %r12
 movq -8(%rbp), %rbx
 leave
 ret     