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

.text
main:
    #TASK 1
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
    
    #end of task 1
    
    #TASK 3
    #checking if equal (if they are print "User inputs are the same")
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
