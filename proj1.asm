# CSCI 4720 Programming Assignment 1
# Mark Batson
# Write a MIPS assembly language program that adds two arrays with ten elements (element-by-element addition) and save them in an array. Print the sum.

.data
array1: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
array2: .word 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
array3: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
str1:   .asciiz "Array of Sums = "
str2:   .asciiz " "

.globl main

.text
main:	
	la $t4, array1      # load address array1 into $t0
	la $t5, array2      # load address array2 into $t1
	la $t6, array3      # load address array3 into $t2
	addi $t0, $t0, 4    # $t0 = 0
	addi $t7, $t7, 0    # $t7 = 0 counter

	li $v0, 4           # system call code for print_str
	la $a0, str1        # address of string to print
	syscall             # print the string

loop1:	lw $t1, 0($t4)      # load word array1
	lw $t2, 0($t5)      # load word array2
	add $t3, $t1, $t2   # add array1 to array2
	sw $t3, 0($t6)      # store word in array3

	li $v0, 1           # system call code for print_int
	lw $a0, 0($t6)      # value to print
	syscall             # print value

	li $v0, 4           # system call code for print_str
	la $a0, str2        # address of string to print
	syscall             # print space

	add $t4, $t4, $t0   # increment array1
	add $t5, $t5, $t0   # increment array2
	add $t6, $t6, $t0   # increment array3
	addi $t7, $t7, 1    # $t0 = $t0 + 1
	bne $t7, 10, loop1

li	$v0, 10
	syscall