# Title: Exercicio 7
# Date: 20/05/2019
# Descrição: Dado um inteiro positivo n, calcular e imprimir o valor da seguinte soma: 1/n + 2/n-1 + ... + n/1
# Input: Inteiro positivo n
# Output: O resultado da soma

################# Data segment #####################

.data
description: .asciiz "Calculo da soma (1/n) + (2/n-1) + ... +  (n/1)\n\n"
cinN: .asciiz "Digite o valor de n: "
result: .asciiz "Resultado da soma = "
zero: .double 0.0
one: .double 1.0

################# Code segment #####################

.text
.globl main

main:	# main program entry
	# Print description string
	la $a0, description
	li $v0, 4
	syscall
	
	# Print cinN string
	la $a0, cinN
	li $v0, 4
	syscall

	# Read n
	li $v0, 7
	syscall
		
	mov.d $f2, $f0  #init $f2 denominator witch n
	
	l.d $f4, one # init $f4 numerator witch 1
	
	l.d $f6, zero # init $f6 result registrator witch 0
	
	l.d $f8, one # init $f8 to control witch 0
	
loop:
	div.d $f10, $f4, $f2 # $f10 = numerator / denominator 
	add.d $f6, $f6, $f10 # $f6 = $f6 + new fraction calc
	add.d $f4, $f4, $f8 # numerator++
	sub.d $f2, $f2, $f8 # denominator--
	c.le.d $f8, $f2 # if denominator >= 1.0
	bc1t loop # branch to loop
		
exit:
	# Print result string
	la $a0, result
	li $v0, 4
	syscall
	
	# Show result value
	mov.d $f12, $f6
	li $v0, 3
	syscall
	
	# Exit program
	li $v0, 10
	syscall