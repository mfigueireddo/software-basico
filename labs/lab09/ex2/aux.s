.text
.globl fat

fat:
 pushq %rbp
 movq %rsp, %rbp
 subq $16, %rsp
 movq %rbx, -8(%rbp)
 
 /* edi -> n */

 cmpl $0, %edi /* condição de parada */
 je case1

 jmp case2

case1:
 movl $1, %eax /* return 1 */
 leave
 ret


case2:
 movl %edi, %ebx /* copia n para ebx */

 subl $1, %edi /* n-1 */
 call fat /* aciona fat com n-1 */

 imul %ebx, %eax /* n*fat(n-1) */

 movq -8(%rbp), %rbx
 leave
 ret     