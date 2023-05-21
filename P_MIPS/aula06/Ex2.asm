	.text
	.globl main

main: 	li 	$t0, 0x12345678
	li 	$t1, 0xF0000003
	
	#Shift Left Logical
	sll 	$t2, $t0, 1
	sll 	$t3 $t0, 4
	sll 	$t4, $t0, 2
	sll 	$t5, $t1, 4
	
	##Shift Right Logical
	#srl	$t2, $t0, 1
	#srl 	$t3 $t0, 4
	#srl 	$t4, $t0, 2
	#srl 	$t5, $t1, 4
	
	##Shift Right Aritmetical
	#sra	$t2, $t0, 1
	#sra	$t3 $t0, 4
	#sra	$t4, $t0, 2
	#sra	$t5, $t1, 4
	
	li $v0, 10
	syscall