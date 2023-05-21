	.data
	
str1:	.asciiz "Introduza um numero: \n"
str2: 	.asciiz "O fatorial do numero inserido e: "

	.text
	.globl main
	
main:	li $v0, 4
	la $a0, str1
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0 	# $t0 = numero introduzido - N
	
	li $t1, 1		# $t1 = 1 - F
	move $t2, $t0	# $t2 = numero introduzido - I
	
for:	mul $t1, $t1, $t2
	subi $t2, $t2, 1
	bnez $t2, for
	
endfor:	li $v0, 1
	move $a0, $t1
	syscall

	li $v0, 10
	syscall