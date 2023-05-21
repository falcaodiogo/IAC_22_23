	.data
	
str1:	.asciiz "Introduza um numero:"
str2:	.asciiz "O numero e` par"
str3:	.asciiz "O numero e` impar"

	.text
	.globl main
	#.eqv _a, $t0 permite usar o nome destas variaveis

main: 	li $v0, 4		#imprimir str1
	la $a0, str1
	syscall
	
	li $v0, 5 		#numero -> $t0	
	syscall
	
	move $t0, $v0
	
	# if ((a & 1) == 0) -> vai pegar no ultimo algaritmo e vr se ou e` 0 ou 1 (uma vez que ve em binario)
	
if:	li $t1, 1
	and $t2, $t1, $t0
	bne $t2, $0, impar
	j par
	
impar:	li $v0, 4		#imprimir impar
	la $a0, str3
	syscall
	j end
	
par:	li $v0, 4		#imprimir par
	la $a0, str2
	syscall
	j end
	
end:	li $v0, 10		#end
	syscall
