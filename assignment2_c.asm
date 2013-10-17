##########################################################################
# Jared Wallace, CS 2318-002, Assignment 2 Part 1 Program C
############################ data segment ################################	
		.data
array:		.word	111, 222, 333, 444
initial:	.asciiz "The initial order of array values is: "
space:		.asciiz " "
post:		.ascii "\nAfter swapping, the new order of values is: "
############################ code segment ################################
		.text
		.globl main
main:
		li $v0, 4		# print output string
		la $a0, initial
		syscall
		la $t0, array		# load the array base into $t0
		jal printArray
				
		lw $t1, 4($t0)		# put array[1] into $t1
		lw $t3, 12($t0)		# put array[3] into $t3
		sw $t1, 12($t0)		# put the value in $t3 into array[3]
		sw $t3, 4($t0)		# put the value in $t1 into array[1]
				
		lw $t1, 0($t0)		# put array[0] into $t1
		lw $t3, 8($t0)		# put array[2] into $t3
		sw $t1, 8($t0)		# put the value in $t1 into array[2]
		sw $t3, 0($t0)		# put the value in $t3 into array[0]
				
		li $v0, 4
		la $a0, post			
		syscall			# print output string
		jal printArray
				
		li $v0, 10
		syscall			# graceful exit
				
				
printSpace:
		li $v0, 4
		la $a0, space
		syscall			# print the space
		li $v0, 1		# reset $v0 for integer output
		jr $ra			# return to printArray
				
printArray:
		li $v0, 1
		lw $a0, 0($t0)
		syscall			# print array[0]
		move $t9, $ra		# save our return address
		jal printSpace
		lw $a0, 4($t0)
		syscall			# print array[1]
		jal printSpace
		lw $a0, 8($t0)
		syscall			# print array[2]
		jal printSpace
		lw $a0, 12($t0)
		syscall			# print array[3]
		jal printSpace
		jr $t9			# return to main
				
