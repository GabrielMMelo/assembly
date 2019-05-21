.data
cin: 		.asciiz "Enter a number for n:"
cout_success: 	.asciiz "It is a perfect integer!"
cout_fail: 	.asciiz "It isn't a perfect integer."
cout_error:	.asciiz "Please, make sure your number is greater than 0."

.text
.globl main

## main block ##
main:
	li   $v0, 4			# print "cin" string
	la   $a0, cin
	syscall
	li   $v0, 5			# read integer
	syscall
	
	move $t0, $v0			# move result to temporary register
	blez $t0, error			# check if it is greater than 0
	add  $t1, $zero, $zero		# init reg for sum
	add  $t2, $zero, 0 		# init counter
	
## iteration loop block ##
loop:
	add  $t2, $t2, 1		# increment the counter
	beq  $t2, $t0, result		# loop condition check
	div  $t0, $t2			# divide 
	mfhi $t3			# get the "mod" of division
	bne  $t3, 0, loop		# return to the loop 
	add  $t1, $t1, $t2		# increase the sum
	j    loop			# return to the loop
	
## check the after-loop status and branch ##
result:
	beq  $t0, $t1, success		# check if it is a perfect integer


## throw fail message ##
failed:
	li   $v0, 4			# print "fail" string
	la   $a0, cout_fail
	syscall
	li   $v0, 10			# exit program
	syscall

## throw success message ##	
success:
	li   $v0, 4			# print "success" string
	la   $a0, cout_success
	syscall
	li   $v0, 10			# exit program
	syscall

## throw error message ##
error:
	li   $v0, 4			# print "error" string
	la   $a0, cout_error
	syscall
