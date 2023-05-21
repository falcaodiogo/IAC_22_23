	.data
	
str1:	.asciiz "Indtroduza um numero (pequeno): "
str2:	.asciiz "-"

	.text
	.globl main
	
main:	li $v0, 4		#imprimir str1
	la $a0, str1
	syscall
	
	li $v0, 5 		#numero de tracos -> $t0	
	syscall
	
	move $t0, $v0
	
for:	li $t1, 0		# $t1 -> contagem
test:	bge $t1, $t0, end
	
	li $v0, 4		#imprimir "-"
	la $a0, str2
	syscall
	
	addi $t1, $t1, 1
	j test
	
end:	li $v0, 10		#end
	syscall
