.data
cin_x: 		.asciiz "Enter a float number for x:"
cin_y: 		.asciiz "Enter a float number for y:"
cout_success: 	.asciiz "It belongs to H!"
cout_fail: 	.asciiz "It doesn't belongs to H."
zero.d: 	.double 0.0
one.d:		.double 1.0

.text
.globl main

## main block ##
main:
	li      $v0, 4			# print "cin_x" string
	la      $a0, cin_x
	syscall
	li      $v0, 7			# read double
	syscall

	mov.d   $f2, $f0		        # move x to a new register
	
	li      $v0, 4			# print "cin_y" string
	la      $a0, cin_y
	syscall
	li      $v0, 7			# read double
	syscall

	mov.d   $f4, $f0			# move y to a new register		

## do the arithmetic operations and branch ##	
body:
	l.d 	$f0, zero.d		# load 0.0 to $f0
	c.lt.d  $f2, $f0		# check if x is less than 0
	bc1t    fail			# if condition above is true, branch to fail
	c.lt.d  $f4, $f0		# check if y is less than 0
	bc1t    fail			# if condition above is true, branch to fail
		
	mul.d   $f2, $f2, $f2		# x * x
	mul.d   $f4, $f4, $f4		# y * y
	add.d   $f6, $f2, $f4		# x² + y² 
	
	l.d 	$f10, one.d		# load 1.0 to $f10
	c.le.d	$f6, $f10		# check if (x² + y²) <= 1
	bc1t	success			# if condition above is true, branch to success

## throws fail message ##
fail:
	li      $v0, 4			# print "fail" string
	la      $a0, cout_fail
	syscall
	li      $v0, 10			# exit program
	syscall

## throws success message ##
success:
	li      $v0, 4			# print "success" string
	la      $a0, cout_success
	syscall
	li      $v0, 10			# exit program
	syscall	