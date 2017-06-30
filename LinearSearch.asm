# CSCI 4720 Programming Assignment 2 Linear Search
# Mark Batson
# Write a MIPS assembly language program that searches for a number entered by user. The number is in an array with 20 integer numbers. Print the index of the number in the array if it is found.

.data
array1: .word 15, 5, 6, 11, 17, 2, 16, 10, 1, 3, 7, 18, 4, 8, 12, 9, 20, 13, 14, 19
str0:   .asciiz "Enter a number to find: "
str1:   .asciiz "Number found at index: "

.globl main

.text
main:	
	la $t4, array1      # load address array1 into $t0
	addi $t0, $t0, 4    # $t0 = 0
	addi $t7, $t7, 0    # $t7 = 0 counter

	li $v0, 4           # system call code for print_str
	la $a0, str0        # address of string to print
	syscall             # print the string "Enter a number to find: "

	addi $v0, $zero, 5  # read integer from user
	syscall
	add $s0, $zero, $v0 # store integer in $s0

loop1:	lw $t1, 0($t4)      # load word array1
	beq $s0, $t1, found # branch if integer is found 

	add $t4, $t4, $t0   # increment array1
	addi $t7, $t7, 1    # $t7 = $t7 + 1
	bne $t7, 20, loop1

found: 	li $v0, 4           # system call code for print_str
	la $a0, str1        # address of string to print
	syscall             # print the string "Number found at index: "

	li $v0, 1           # system call code for print_int
	add $a0, $zero, $t7 # value to print
	syscall             # print index where number is found

li	$v0, 10
	syscall