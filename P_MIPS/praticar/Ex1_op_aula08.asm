	.data
frase:	.asciiz "Insira 6 numeros: "
array: 	.space 20

	.text
	.globl main
	
main:	li $t0, 0		# i = 0
	li $t1, 6		# confirmador (while $t0 < $t1)

	la $a0, frase 	# imprimir frase
	li $v0, 4
	syscall
	
	la $s0, array
	

while:	bge $t0, $t1, endwhile
	add $t2, $t0, $s0
	lb $t3, 0($s0)
	jal readInts
	sb $t3, 0($s0)
	addi $t0, $t0, 1
	j while
	# agora temos o $v0	
	
	
readInts:	li $v0, 5
	syscall
	jr $ra
	
endwhile:	li $v0, 10
	syscall