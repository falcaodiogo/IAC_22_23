	.data
frase1:	.asciiz "Introduza um numero: "
frase2: 	.asciiz "O numero fatorial inserido e: "
	
	.text
	.globl main	
	
main:	la $a0, frase1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $a0, $v0	
	jal factorial
	
	li $v0, 1
	syscall
	
	j end
	

factorial:	li $t1, 1		# $t1 = res e $a0 = num
	move $t0, $a0 	# $t0 = i (= num)
	
for:	beqz $t0, endfor
	mul $t1, $t1, $t0
	subi $t0, $t0, 1
	j for
	
endfor: 	move $a0, $t1
	jr $ra
	
end:	li $v0, 10
	syscall