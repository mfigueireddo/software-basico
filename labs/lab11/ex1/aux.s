/*

int novonum(void) {
  int minhalocal;
  printf("numero: ");
  scanf("%d",&minhalocal);
  return minhalocal;
}

*/

.data 
Sf: .string "numero: "
SfScanf: .string "%d"

.text
.globl novonum

/* parâmetros: rdi, rsi */

novonum: 
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp

    movq $Sf, %rdi /* ajusta a formatacao do printf ("numero: ") */
    call printf

    movq $SfScanf, %rdi /* ajusta a formatacao do scanf ("%d") */
    leaq -4(%rbp), %rsi /* passa um endereco de memoria para o scanf */
    call scanf

    movl -4(%rbp), %eax /* retorna o conteudo de um endereco de memoria */

    leave
    ret
