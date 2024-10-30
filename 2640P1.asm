#Program 1: Getting Familiar with Assembly
#CS2640.02
#Names: Andy Quach and Matthew Pena
#Date: 10/30/24
#Tasks:
#1.) User Input and Output
#2.) Arithmetic Operation Practice
#3.) Conditions

.data
interger1: .asciiz "Please enter the first integer: "
interger2: .asciiz "Please enter the second integer: "
output1: .asciiz "First integer was: "
output2: .asciiz "\nSecond integer was: "
isEqual: .asciiz "\nUser inputs are the same"
notEqual: .asciiz "\nUser inputs are different"

addition: .asciiz "\nThe sum of $s0 & $s1 is: "
subtraction: .asciiz "\nThe difference of $s0 & $s1 is: "
multiplication: .asciiz "\nThe product of $s0 & $s1 is: "
quotent: .asciiz "\nThe quotent of $s0 & $s1 is: "
remainder: .asciiz "\nThe remainder is: "

task1: .asciiz "TASK 1\n"
task2: .asciiz "\nTASK 2"
task3: .asciiz "\nTASK 3"

.text
main:
    #TASK 1
    #Notify user of task 1
    li $v0, 4
    la $a0, task1
    syscall
    
    #printing interger1 message
    li $v0, 4
    la $a0, interger1
    syscall

    #getting input and storing in $s0
    li $v0, 5
    syscall
    move $s0, $v0

    #print interger2 message
    li $v0, 4 
    la $a0, interger2 
    syscall

    #getting second input and storing in $s1
    li $v0, 5
    syscall
    move $s1, $v0

    #prints output1 string
    li $v0, 4
    la $a0, output1
    syscall

    #prints interger1
    move $a0, $s0
    li $v0, 1
    syscall

    #prints output2
    li $v0, 4 
    la $a0, output2 
    syscall

    #prints interger2
    move $a0, $s1 
    li $v0, 1
    syscall

    #END OF TASK 1
    
    #TASK 2 - Perform the four arithmetic operations on $s0 and $s1
    #Notify user of task 2
    li $v0, 4
    la $a0, task2
    syscall
    
    #ADDITION
    add $t0, $s0, $s1
    
    #Print prompt for arithmetic operation
    li $v0, 4
    la $a0, addition
    syscall
    
    #Print result
    li $v0, 1
    move $a0, $t0
    syscall
    
    #SUBTRACTION
    sub $t0, $s0, $s1
    
    #Print prompt for arithmetic operation
    li $v0, 4
    la $a0, subtraction
    syscall
    
    #Print result
    li $v0, 1
    move $a0, $t0
    syscall
    
    #MULTIPLICATION
    mul $t0, $s0, $s1
    
    #Print prompt for arithmetic operation
    li $v0, 4
    la $a0, multiplication
    syscall
    
    #Print result
    li $v0, 1
    move $a0, $t0
    syscall
    
    #DIVISION
    div $s0, $s1
    
    #Move quotent and remainder from lo & hi to $t0 & $t1 registers
    mflo $t0
    mfhi $t1
    
    #Print quotent
    li $v0, 4
    la $a0, quotent
    syscall
    
    li $v0, 1
    move $a0, $t0
    syscall
    
    #Print remainder
    li $v0, 4
    la $a0, remainder
    syscall
    
    li $v0, 1
    move $a0, $t1
    syscall
    #END OF TASK 2

    #TASK 3
    #checking if equal (if they are print "User inputs are the same")
    #Notify user of task 3
    li $v0, 4
    la $a0, task3
    syscall
    
    beq $s0, $s1, equal #this checks if int1 and int2 are equal
    
    #if not then print "User inputs are different"
    li $v0, 4
    la $a0, notEqual 
    syscall
    #exit program
    li $v0, 10
    syscall

equal:
    #case for beq
    li $v0, 4
    la $a0, isEqual
    syscall
    
    #exit program
    li $v0, 10
    syscall
