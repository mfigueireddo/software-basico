.data
Sf: .string "%d\n"

.text
.globl  main

main:

  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  movq %rbx, -8(%rbp) 
  movq %r12, -16(%rbp)

  movl $1, %r12d

FOR:
  cmpl $10, %r12d
  jg RETURN

  jmp PRINTF

PRINTF: 
  movl %r12d, %r13d
  imull %r12d, %r13d
  movl %r13d, %eax 
  movq $Sf, %rdi
  movl %eax, %esi
  movl $0, %eax
  call printf

  jmp IMP

IMP:
  addl $1, %r12d

  jmp FOR

RETURN:   
  movq $0, %rax 
  movq -16(%rbp), %r12 
  movq -8(%rbp), %rbx
  leave
  ret 