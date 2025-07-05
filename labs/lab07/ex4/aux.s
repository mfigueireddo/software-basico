.data
nums: .int 65, -105, 111, 34
stringFormat: .string "Soma = %d\n"

.text
.globl  main

main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp /* a pilha só aceita múltiplos de 16 */
  movq %rbx, -8(%rbp) 
  movq %r12, -16(%rbp)
  movq %r13, -24(%rbp)
  movq %r13, -32(%rbp)

  /* r12 -> variáveis */
  /* r13 -> contador */
  /* r14 -> soma */
  /* rcx -> ponteiro */

  movq $nums, %r12
  movq %r12, %rcx

  movl $0, %r13d
  movl $0, %r14d

FOR:
  cmpl $4, %r13d
  jge PRINTF

  jmp SOMA

SOMA:
  addl (%rcx), %r14d
  
  jmp IMP

IMP:
  addl $1, %r13d
  addq $4, %rcx

  jmp FOR

PRINTF: 
  movl %r14d, %eax 
  movq $stringFormat, %rdi
  movl %eax, %esi
  movl $0, %eax
  call printf

RETURN:   
  movq $0, %rax
  movq -32(%rbp), %r14
  movq -24(%rbp), %r13
  movq -16(%rbp), %r12 
  movq -8(%rbp), %rbx
  leave
  ret 