	.data

str1:	.asciiz "Introduza dois numeros:"
str2:	.asciiz "A soma dos dois numeros e:"
	
	# add -> se houver overflow, gera execao mas no addu nao gera execao
	
	.text
	.globl main
	#.eqv _a, $t0 permite usar o nome destas variaveis

main: 	li $v0, 4		#imprimir str1
	la $a0, str1
	syscall	

	li $v0, 5 		#primeiro numero	
	syscall
	
	move $t0, $v0
	
	li $v0, 5
	syscall
	
	move $t1, $v0	#segundo numero
	
	add $t2, $t0, $t1	#soma
	
	li $v0, 4		#imprimir str2
	la $a0, str2
	syscall
	
	move 	$a0, $t2	#imprimir
	li	$v0, 36
	syscall	
	
	li $v0, 10		#end
	syscall