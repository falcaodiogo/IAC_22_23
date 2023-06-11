	.data
lista:	.byte 'a', 'b', 'c', 'd', 'e', 'f'
str:	.asciiz "O conteudo do Array e': "
virgula:	.asciiz " , "

	.text
	.globl main
	
main:	addi $t0, $t0, 0		# i = 0
	addi $t1, $t1, 6		# i < 6
	
	la $t3, lista
	
	la $a0, str
	li $v0, 4
	syscall			# print str
	
for:	beq $t0, $t1, endfor

	lb $a0, ($t3)           # Load the byte at the address in $t0 into $a0
    	li $v0, 11              # Set $v0 to 11 for printing a character
    	syscall                 # Print the character
	
	la $a0, virgula
	li $v0, 4
	syscall
	
	addi $t0, $t0, 1
	addi $t3, $t3, 1
	j for
	
	
endfor:	li $v0, 10
	syscall