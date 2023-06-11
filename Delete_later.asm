.data
lista:  .byte 'a', 'b', 'c', 'd', 'e', 'f'
str:    .asciiz "O conteudo do Array e': "
virgula:    .asciiz " , "

.text
.globl main

main:
    la $a0, str
    li $v0, 4
    syscall                 # Print str
    
    la $t0, lista           # Load the base address of lista into $t0
    li $t1, 6               # Set $t1 to the number of elements in the array
    
print_loop:
    lb $a0, ($t0)           # Load the byte at the address in $t0 into $a0
    li $v0, 11              # Set $v0 to 11 for printing a character
    syscall                 # Print the character
    
    la $a0, virgula         # Load the address of virgula into $a0
    li $v0, 4
    syscall                 # Print the comma
    
    addiu $t0, $t0, 1       # Increment the address in $t0
    
    subi $t1, $t1, 1        # Decrement the counter
    
    bgtz $t1, print_loop    # Branch back to print_loop if $t1 > 0 (more elements to print)
    
    li $v0, 10
    syscall                 # Exit the program
