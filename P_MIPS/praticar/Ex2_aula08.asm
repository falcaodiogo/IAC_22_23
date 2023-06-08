# lb -> carcter atual Ex: lb $t2, 0($t1) #$t2 = minus[i]
# Exercicio ao contrario, fds para esta porra
	
	.data
frase:	.asciiz "frase de teste"
array:	.space 20
	.text
	.globl main
	
main:	li $t0, 0	# i (ate length da frase)
	li $t1, 0	# n (numero da frase)
	
	la $a0, array
	li $a1, 20
	la $v0, 8
	syscall
	
	move $v0, $t2	# $t2 tem a string
	
while:	lb $t3, array($t0)
	beqz $t3, endwhile
	blt $t3, 'a', endwhile
	bgt $t3, 'z', endwhile
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	j while
	
endwhile: 	move $a0, $t1
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
