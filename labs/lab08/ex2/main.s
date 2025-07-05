.data
  nums: .int 3, -5, 7, 8, -2
  string:   .string "%d\n"

.text
.globl main

main:
    pushq %rbp /* estabelece o base pointer */
    movq %rsp, %rbp /* estabelece o stack pointer */
    subq $16, %rsp /* separa 16 bytes de memória da CPU */
    movq %rbx, -8(%rbp) /* backup do espaço de memória para o registrador com ponteiro */
    movq %r12, -16(%rbp) /* backup do espaço de memória para o registrador com contador */

    movq $nums, %rbx /* joga um ponteiro dos números para rbx */
    movl $0, %r12d /* inicializa um contador em r12d com 0 */

L1:
    cmpl $5, %r12d /* condição de parada do for */
    jge L2 /* encerra o for se contador >=5 */

    movl (%rbx), %edi /* move o conteúdo do ponteiro para o primeiro parâmetro */
    movl $1, %esi /* move o valor 1 para o segundo parâmetro*/
    call filtro /* chama a função filtro */

    movq $string, %rdi /* move a formatação da string para o primeiro parâmetro */
    movl %eax, %esi /* move o resultado da função filtro para o primeiro parâmetro */
    call printf /* chama a função printf */

    addl $1, %r12d /* adiciona 1 ao contador */
    addq $4, %rbx /*  move o ponteiro de posição */

    jmp L1 /* recomeça o loop */

L2:
    movl $0, %eax /* retorna 0 */
    movq -8(%rbp), %rbx /* retorna os valores que haviam nesse espaço de memória */
    movq -16(%rbp), %r12 /* retorna os valores que haviam nesse espaço de memória */
    leave
    ret