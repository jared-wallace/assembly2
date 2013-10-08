# Jared Wallace CS 2318-002, Assignment 2 Part 1 Program A

				.data
intprompt:			.asciiz		"Enter an integer \n"
strprompt:			.asciiz		"Enter a string \n"
charprompt:			.asciiz		"Enter a char \n"
intresponse:			.asciiz		"You entered the integer: "
strresponse:			.asciiz		"You entered the string: "
charresponse:			.asciiz		"You entered the char "
newline:			.asciiz		"\n"
buffer:				.space		81
				.text
				.globl main
main:
				#prompt for integer
				li $v0, 4
				la $a0, intprompt
				syscall
				#get input
				li $v0, 5
				syscall
				#copy input into temp register
				move $t0, $v0
				#display labeled output
				li $v0, 4
				la $a0, intresponse
				syscall
				#display integer
				li $v0, 1
				move $a0, $t0
				syscall
				#endline
				li $v0, 4
				la $a0, newline
				syscall
				
				#prompt for string
				la $a0, strprompt
				syscall
				#get string
				li $v0, 8
				la $a0, buffer
				li $a1, 81
				syscall
				#display labeled output
				li $v0, 4
				la $a0, strresponse
				syscall
				#display string
				la $a0, buffer
				syscall
				
				
				
				li $v0, 10
				syscall
				
				
				