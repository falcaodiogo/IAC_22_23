	.data
	
str1:	.asciiz "Introduza um numero\n"
str2:	.asciiz "-"

	.text
	.globl main
	
main:	li $v0, 4
	la $a0, str1
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0	# $t0 -> numero introduzido
	
	li $t1, 0		# $t1 -> 0
	
	# temos de repetir o print de "-" ate $t1 = $t0
	
for:	li $v0, 4
	la $a0, str2
	syscall
	addi $t1, $t1, 1
	bne $t0, $t1, for
	
endfor: 	li $v0, 10
	syscall 
