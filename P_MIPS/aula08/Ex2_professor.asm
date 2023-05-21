	.data
	
minus:	.asciiz "texto em minusculas"
maius:	.space 20

	.text
	.globl main

main: 

# $s0 = array base address = chararr = &chararr[0] 

# $s1 = i

addi $s1, $0, 0 # i = 0

addi $t0, $0, 10 # $t0 = 10

# for loop

for:

beq $s1, $t0, done # if (i==10) done

# $t1 = chararr + i = &chararr[i] 

# não é necesário multiplicar o valor de i ($s1), porquê?

add $t1, $s1, $s0 # $t1 = address of chararr[i]

lb $t2, 0($t1) # $t2 = chararr[i]

addi $t2, $t2, -32 # conv_to_upcase: $t2 = $t2 - 32

sb $t2, 0($t1) # chararr[i] = chararr[i]-32

addi $s1, $s1, 1 # i++

j for # repeat

done:	li $v0, 10		#end
	syscall