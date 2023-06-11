	.data
lista:	.word 4, 3, -2, 1, 27, 45
str:	.asciiz "O conteudo do Array e': "
virgula:	.asciiz " , "

	.text
	.globl main
	
main:	addi $t0, $t0, 0		# i = 0
	addi $t1, $t1, 6		# i < 6
	addi $t2, $t2, 0		# enderecamento na lista
	
	la $a0, str
	li $v0, 4
	syscall			# print str
	
for:	beq $t0, $t1, endfor

	lb $a0, lista($t2)		# posicao
	li $v0, 1
	syscall
	
	la $a0, virgula
	li $v0, 4
	syscall
	
	addi $t0, $t0, 1
	addi $t2, $t2, 4		# INCREMENTA + 4
	j for
	
	
endfor:	li $v0, 10
	syscall
	
# nao e' a solucao mais eficiente, mas funciona