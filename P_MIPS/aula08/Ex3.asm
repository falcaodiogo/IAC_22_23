	.data
str1:   	.asciiz "Introduza uma string\n"
str:    	.space 40
result: 	.asciiz "Numero: "

	.text
	.globl main

main:
    	li  $v0, 4
    	la  $a0, str1
    	syscall           	# imprimir str1

    	la  $a0, str       	# $a0 = str

    	li  $a1, 40       	# tamanho máximo da string (40)
    	li  $v0, 8        	# ler string
    	syscall

    	li  $t0, 0         # $t0 = 0 (contador de caracteres alfabéticos)
    	li  $t1, 0         # $t1 = 0 (índice do caractere atual)

loop:
    	lb  $t2, str($t1)  	# carregar o caractere atual em $t2
    	beqz $t2, end     	# sair do loop se o caractere for nulo (\0)

    	blt $t2, 'a', next 	# verificar se o caractere é menor que 'a'
    	bgt $t2, 'z', next 	# verificar se o caractere é maior que 'z'

    	addi $t0, $t0, 1   	# incrementar o contador de caracteres alfabéticos

next:
    	addi $t1, $t1, 1   	# incrementar o índice do caractere
    	j loop

end:
    	la  $a0, result
    	li  $v0, 4
    	syscall

    	move $a0, $t0     	# carregar o número de caracteres alfabéticos em $a0
    	li   $v0, 1       	# imprimir inteiro
    	syscall

    	li   $v0, 10      	# sair do programa
    	syscall
