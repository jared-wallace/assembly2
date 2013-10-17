##########################################################################
# Jared Wallace, CS 2318-002, Assignment 2 Part 1 Program A
##########################################################################
# This program reads in and then outputs integer, string and char values
############################ data segment ################################

		.data
intprompt:	.asciiz		"Enter an integer \n"
strprompt:	.asciiz		"Enter a string \n"
charprompt:	.asciiz		"Enter a char \n"
intresponse:	.asciiz		"You entered the integer: "
strresponse:	.asciiz		"You entered the string: "
charresponse:	.asciiz		"\nYou entered the char "
newline:	.asciiz		"\n"
buffer:		.space		81
############################ code segment ################################
		.text
		.globl main
main:
				
		li $v0, 4		
		la $a0, intprompt
		syscall			# prompt for integer
		li $v0, 5		
		syscall			# get input
		move $t0, $v0		# copy input into temp register
		li $v0, 4		
		la $a0, intresponse
		syscall			# display labeled output
		li $v0, 1		
		move $a0, $t0
		syscall			# display integer
		
		li $v0, 4		
		la $a0, newline
		syscall			# endline
		
		la $a0, strprompt	
		syscall			# prompt for string
		li $v0, 8		
		la $a0, buffer			
		li $a1, 81
		syscall			# get string
		li $v0, 4		
		la $a0, strresponse
		syscall			# display labeled output
		la $a0, buffer		
		syscall			# display string
		
		li $v0, 4		
		la $a0, newline
		syscall			# endline
		
		la $a0, charprompt	
		syscall			# prompt for char
		li $v0, 12		
		syscall			# get char
		move $t0, $v0
		li $v0, 4
		la $a0, charresponse
		syscall			# display labeled output
		li $v0, 11
		move $a0, $t0
		syscall			# display char
			
		li $v0, 10
		syscall			# graceful exit