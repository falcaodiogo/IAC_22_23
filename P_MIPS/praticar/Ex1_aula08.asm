# array:	.space 12 (cria 3*4 bytes -> 3 integers, por exemplo)

# li $s0, 3
# li $s1, 10

# index = $t0
# li $t0, 0 -> $t0 vai ser para indexar e tem de ser sempre multiplo de 4

# sw $s0, array($t0) 

# addi $t0, 4
# sw $s1, array($t0)

# aceder array:
# li $t0, 0 # posicao zero
# lw $t2, array($t0) # vai dar 3

## EM ARRAYS, MEXER COM UNSIGNEDS

	.data
	
minus:	.asciiz "texto_em_minusculas" # -> cada letra ocupa um byte
maius:	.space 20

	.text
	.globl main

main: 	#li $v0, 4		# imprimir str1
	#la $a0, str1
	#syscall
	
	li 	$t0, 0		# i = 0
	
	la 	$a0, minus		# $a0 = texto
	la 	$a1, maius		
	
while:	addu 	$t1, $a0, $t0	# mudar o i
	lb 	$t2, 0($t1)		# $t2 = minus[i]
	beqz 	$t2, end		# se o array acabar
	
body:	addu 	$t3, $a1, $t0	# $t2 = y (acede ao array vazio), guardado em $a1
	addi 	$t2, $t2, 'A'	
	subi 	$t2, $t2, 'a'
	sb 	$t2, 0($t3)		# guarda com o valor de minus[i]
	addi 	$t0, $t0, 1
	j 	while
	
	
end:	li 	$v0, 4
	la 	$a0, maius
	syscall
	
	li 	$v0, 10		#end
	syscall
