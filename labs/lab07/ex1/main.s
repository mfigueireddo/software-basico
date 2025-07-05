.data
S2:    .byte 65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0
Sf:  .string "%c"    /* formatação de string */
Sf2: .string "\n"    /* formatação de string */

.text
.globl  main
main:

  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp) 
  movq    %r12, -16(%rbp)

  movq  $S2, %r12  /* move o valor de memória presente em S2 para o registrador 64x r12 */

L1:
  cmpb  $0, (%r12)  /* compara o valor 0 ao valor presente no registrador 64x r12 */
  je  L2            /* em caso afirmativo, ir para L2 */

  movsbl  (%r12), %eax    /* move o valor do registrador 64x r12 de maneira extendida para o registrador eax */

  movq    $Sf, %rdi
  movl    %eax, %esi
  movl  $0, %eax
  call  printf

  addq  $1, %r12  /* adiciona o valor 1 ao registrador r12 */
  jmp  L1         /* vai para L1 */

L2:  
  movq  $Sf2, %rdi
  movl  $0, %eax
  call  printf 

  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq    -16(%rbp), %r12 /* recupera r12 */
  movq    -8(%rbp), %rbx  /* recupera rbx */
  leave
  ret 