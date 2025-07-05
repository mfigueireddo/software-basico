.data
S2:    .byte 65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0
Sf:  .string "%c"  
Sf2: .string "\n"  

.text
.globl  main
main:

  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp) 
  movq    %r12, -16(%rbp)

  movq  $S2, %r12  

L1:
  cmpb  $0, (%r12) 
  je  L2         

  cmpb $123, (%r12) /* se o byte for { */
  je L3 /* não printa e pula pra próxima instrução */

  cmpb $125, (%r12) /* se o byte for } */
  je L3 /* não printa e pula pra próxima instrução */

  movsbl  (%r12), %eax   

  movq    $Sf, %rdi
  movl    %eax, %esi
  movl  $0, %eax
  call  printf

  jmp L3
L2:  
  movq  $Sf2, %rdi
  movl  $0, %eax
  call  printf 

  movq  $0, %rax  /* rax = 0 
  movq    -16(%rbp), %r12
  movq    -8(%rbp), %rbx 
  leave
  ret 

L3: 

  addq  $1, %r12  
  jmp  L1     
