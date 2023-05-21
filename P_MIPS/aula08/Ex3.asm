	.data
	
str1:	.asciiz "Introduza uma string\n"
str:	.space 40
result: 	.asciiz "Numero: "


	.text
	.globl main
	
main:	li 	$v0, 4
	la 	$a0, str1
	syscall			# print de str1
	
	la 	$a0, str		# $a0 = str
	
	li	$a1, 10		
	li	$v0, 8		# input do user = $v0
	syscall
	
	li 	$t0, 0		# $t0 = 0 (n)
for:	li	$t1, 0		# $t1 = 0 (i) -> i=0 ate i='\0'
test0:	la	$t2, str		# $str[0] em $t2
	addu 	$t3, $t2, $t1	# &str[i] em $t3
	lb	$t4, 0($t3)		# str[i] em $t4
	beqz	$t4, end0
body0:
if1:	blt	$t4, '0', end1
	bgt	$t4, '9', end1

then1:	addi 	$t0, $t0, 1
end1:

next0:	addi	$t1, $t1, 1
	j	test0
	
end0:	la	$a0, result
	li 	$v0, 4
	syscall

	li	$v0, 10
	syscall
	