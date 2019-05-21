# Title: Exercicio 6
# Date: 17/05/2019
# Description: . Escreva um programa que calcule a potência de um número inteiro m elevado a
# potência de outro número inteiro n. O programa deve ser possuir uma função P(m, n) que recebe 
# as entradas para os valores e apresenta o resultado na tela do simulador.
# Input: m - Base | n - Expoente 
# Output: resultado de P(m,n)


################# Data segment #####################

.data

description: .asciiz "Calculo da potencia de n na base m - P(m,n), "
cinM: .asciiz "digite o valor de m: "
cinN: .asciiz "Digite o valor de n: "
result: .asciiz "Resultado = "

################# Code segment #####################

.text

.globl main

main:	# main program entry
	# Print description string
	la $a0, description 
	li $v0, 4
	syscall 
	
	# Print cinM string
	la $a0, cinM
	li $v0, 4
	syscall 
	
	# Read M
	li $v0, 5
	syscall
	move $t0, $v0 # move to register t0 the inputed value
	
	# Print cinN string
	la $a0, cinN
	li $v0, 4
	syscall 
	
	# Read N
	li $v0, 5
	syscall
	move $t1, $v0 # move to register t1 the inputed value

	addi $t3, $zero, 1 # t3 = 1 for case to N = 0
	
loop:
	beqz  $t1, exit # if n = 0 jump to program's exit
	mul  $t3, $t3, $t0 # $t3 = $t3 * m
	subi $t1, $t1, 1 # n--
	j loop 
	
exit:	
	# Print result string
	la $a0, result
	li $v0, 4
	syscall 
	
	# Show result value
	move $a0, $t3
	li $v0, 1
	syscall
	
	li $v0, 10	# Exit program
	syscall