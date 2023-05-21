	.data
	
minus:	.asciiz "texto_em_minusculas*"
maius:	.space 20

	.text
	.globl main

main: 	#li $v0, 4		#i mprimir str1
	#la $a0, str1
	#syscall
	
	li 	$t0, 0		# i = 0
	
	la 	$a0, minus
	la 	$a1, maius
	
	# lb x, y vai fazer load do codigo ascii
	
while:	addu 	$t1, $a0, $t0
	lb 	$t2, 0($t1)	#$t2 = minus[i]
	beqz 	$t2, end
	
body:	addu 	$t3, $a1, $t0
	addi 	$t2, $t2, 'A'
	subi 	$t2, $t2, 'a'
	sb 	$t2, 0($t3)
	addi 	$t0, $t0, 1
	j 	while
	
	
end:	li 	$v0, 4
	la 	$a0, maius
	syscall
	
	li 	$v0, 10		#end
	syscall
