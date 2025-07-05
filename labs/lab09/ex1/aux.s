.text
.globl add

add:
 pushq %rbp
 movq %rsp, %rbp
 
 /* edi, esi, edx -> números */

 movl $0, %eax
 addl %edi, %eax
 addl %esi, %eax
 addl %edx, %eax

 leave
 ret   