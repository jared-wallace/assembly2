##########################################################################
# Jared Wallace, CS 2318-002, Assignment 2 Part 1 Program D
############################ data segment ################################
		.data
legend1:	.asciiz "0: less than 32\n"
legend2:	.asciiz "1: 32 or higher\n"
inPrompt:	.asciiz "Enter an integer between 0 and 255: "
outLab:		.asciiz "It is "
############################ code segment ################################
		.text
		.globl main
main:
		li $v0, 4
		la $a0, legend1        
		syscall                 # print legend line 1
		la $a0, legend2        
		syscall                 # print legend line 2
		la $a0, inPrompt        
		syscall                 # print input prompt
		
		li $v0, 5
		syscall                 # read input integer
		
		srl $a0, $v0, 5		# remove all but 3 msb's
		andi $t0, $a0, 0x1	# hide the two msb's
		or $t0, $t0, $0		# OR lsb with 0, store in $t0
		srl $a0, $a0, 1		# remove the lsb
		andi $t1, $a0, 0x1	# hide msb
		or $t1, $t1, $0		# OR the lsb with 0
		or $t0, $t1, $t0	# OR the two results so far
		srl $a0, $a0, 1		# remove the lsb
		or $a0, $a0, $0		# OR remaining bit with 0
		or $a0, $a0, $t0	# OR result with previous result

		li $v0, 1
		syscall
		
                ##########################################################
                                
terminate:	li $v0, 10               # graceful exit
		syscall
		

