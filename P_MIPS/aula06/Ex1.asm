	.data

msgand:	.asciiz "\nAnd:\n"
msgor:	.asciiz "\n\nOr:\n"
msgnor:	.asciiz "\n\nNor:\n"
msxor:	.asciiz "\n\nXor:\n"
	
	.text
	.globl main

main:	li 	$t0, 0x12345678
	li 	$t1, 0x0000000F

	and 	$t2, $t0, $t1
	or	$t3, $t0, $t1
	nor	$t4, $t0, $t1
	xor	$t5, $t0, $t1
	
	#and
	li $v0, 4
	la $a0, msgand
	syscall
	
	move 	$a0, $t2
	li	$v0, 34
	syscall
	
	#or
	li $v0, 4
	la $a0, msgor
	syscall
	
	move 	$a0, $t3
	li	$v0, 34
	syscall
	
	#nor
	li $v0, 4
	la $a0, msgnor
	syscall
	
	move 	$a0, $t4
	li	$v0, 34
	syscall
	
	#xor
	li $v0, 4
	la $a0, msxor
	syscall
	
	move 	$a0, $t5
	li	$v0, 34
	syscall
	
	li $v0, 10
	syscall