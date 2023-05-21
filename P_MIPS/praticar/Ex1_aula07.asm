	.data

str1: 	.asciiz "Introduza um numero\n"
str2: 	.asciiz "O numero e par\n"
str3: 	.asciiz "O numero e impar\n"
	
	.text
	.globl main
	
main:	li $v0, 4
	la $a0, str1
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0 	# numero em $t0
	
	li $t1, 0		# $t1 = 0
	andi $t0, 1	# $t0 vai ser 0 se $t0 + 1 acaba em 0 ou vai ser 1 se $t0 + 1 acaba em 1
	beq $t0, 0, par
	
impar:	li $v0, 4
	la $a0, str3
	syscall
	j end
	
par:	li $v0, 4
	la $a0, str2
	syscall
	
end:	li $v0, 10 	# end
	syscall