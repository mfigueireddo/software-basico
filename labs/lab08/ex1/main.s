.data
s1: .string "ls -ls"

.text
.globl main

main:
    pushq %rbp /* estabelece o base pointer */
    movq  %rsp, %rbp /* estabelece o stack pointer */

    movq $s1, %rdi /* move a formatação da string para o primeiro parâmetro */
    call system /* chama a função system */

    movl $0, %eax /* retorna 0 */
    leave 
    ret
