# argumentos -> $a0 - $a3
# valor de retorno -> $v0
# jal nome_funcao

# Ex:
#
# funcao e chamada quando:
# li $a0, 2
# li $a1, 3
# jal sum_funct
# add $s0, $v0, 0 -> $v0 e o valor retornado pois:
#
# funcao:
# add $v0, $a0, $a1 -> $a0 e $a1 sao os parametros de entrada e coloca o valor de retorno em $v0
# jr $ra -> volta para o caller

	.text
	.globl main
	

main:	li $a0, 3
	jal factorial
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

factorial:	li $t1, 1		# $t1 = res e $a0 = num
	move $t0, $a0 	# $t0 = i (= num)
	
for:	beqz $t0, endfor
	mul $t1, $t1, $t0
	subi $t0, $t0, 1
	j for
	
endfor: 	move $a0, $t1
	jr $ra
	
	
	
	
