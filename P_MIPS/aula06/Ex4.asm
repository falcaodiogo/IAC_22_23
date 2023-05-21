#incompleto pois e preciso fazer shift 8 vezes e eu so fiz 2
	
	.data

str1:	.asciiz "Introduza $t1:"
	
	.text
	.globl main

main: 	li 	$v0, 4		#imprimir str1
	la 	$a0, str1
	syscall

	li 	$v0, 5 		#$t1	
	syscall
	
	move 	$t1, $v0
	andi 	$t1, $t1, 0xF0000000
	srl 	$t1, $t1, 28
	
	move 	$a0, $t1		#imprimir
	move	$t1, $v0
	li	$v0, 36
	syscall
	
	andi 	$t2 $t2, 0xF0000000
	srl 	$t2, $t2, 24
	
	move 	$a0, $t2		#imprimir
	move	$t2, $v0
	li 	$v0, 1
	syscall
	
	li 	$v0, 10		#end
	syscall