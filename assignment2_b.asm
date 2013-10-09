# Jared Wallace, CS 2318-02, Assignment 2 Part 1 Program B
#
# Prompt the user to enter the integer scores for Exam 1, Exam 2 and Final Exam,
# read the scores, compute the weighted average score (using the following formula),
# and display a labeled output about the weighted average score.

					.data
e1:					.word	0:1
e2:					.word	0:1
final:					.word	0:1
prompt1:				.asciiz	"Please enter the first exam score "
prompt2:				.asciiz	"Please enter the second exam score "
prompt3:				.asciiz	"Please enter the final exam score "
output:				.asciiz	"The weighted average is "
newline:				.asciiz	"\n"
					.text
					.globl main
main:
					# prompt for exam 1
					la $a0, prompt1
					li $v0, 4
					syscall
					# read in exam 1
					li $v0, 5
					syscall
					#multiply by 512
					sll $t0, $v0, 9
					#divide by 2558
					li $t1, 2558
					div $t0, $t1
					mflo $t0
					
					# prompt for exam 2
					la $a0, prompt2
					li $v0, 4
					syscall
					# read in exam 2
					li $v0, 5
					syscall
					# multiply by 614
					li $t1, 614
					mult $t1, $v0
					mflo $t1
					# divide by 2048
					srl $t1, $t1, 11
					
					# Prompt for final grade
					la $a0, prompt3
					li $v0, 4
					syscall
					# Read in final exam
					li $v0, 5
					syscall
					# divide by 2
					srl $v0, $v0, 1
					
					# Sum three weighted averages
					add $v0, $v0, $t0
					add $t1, $v0, $t1
					# Display output
					la $a0, output
					li $v0, 4
					syscall
					move $a0, $t1
					li $v0, 1
					syscall
					
					li $v0, 10
					syscall