.data 
        message1: .asciiz "Enter the height of the pattern (must be greater than 0):\t"
        message2: .asciiz "Invalid Entry!\n"
        sters: .asciiz "*"
        space: .asciiz "\t"
        line: .asciiz "\n"
.text 
main:
        la $a0, message1
        li $v0, 4
        syscall
        li $v0, 5 # read user input
        syscall
        addi $t0, $zero, 0 # set $t0 = 0
        Error:
                bgt $v0, $t0, valid
                li $v0, 4
                la $a0, message2  # print error message
                syscall
                li $v0, 4
                la $a0, message1  # print ask message
                syscall
                li $v0, 5   # read input 
                syscall
                j Error 
        valid:
        	add $s0, $zero, $v0 # $s0 = rows
        	addi $s1, $zero, 1 # $s1 start from 1
        	add $t0, $zero, 1  # i = 0, used to loop $s0 times
        	loop1:
                	bgt $t0, $s0, PrintLastLine  # if i > i, exitloop 
                	addi $t1, $zero, 1 # compare the value for loop2
                	sub $t2, $s0, $t0 # $t2 = rows - i
                loop2:
                        bgt $t1, $t2, Algorithm # if j > rows - i, go Algorithm
                        li $v0, 4  # else print tabs 
                        la $a0, space
                        syscall
                        addi $t1, $t1, 1 # increment j, i.e j++;
                        j loop2  # loop again
                Algorithm:
                        add $a0, $zero, $s1  # print the number
                        li $v0, 1
                        syscall
                        addi $s1, $s1, 1 
                        addi $t2, $zero, 1      # $t2 = 1
                        beq $t0, $t2, Exit
                        add $t3, $zero, $zero
                        add $t4, $zero, $t0 # $t4 = i
                        sll $t4, $t4, 1 # $t4 = (2*i)
                        sub $t4, $t4, 3 # $t4 = {(2*i) - 3}
                Condition:
                        bge $t3, $t4, ExitCondition
                        li $v0, 4     # first print the tab
                        la $a0, space
                        syscall
                        li $v0, 4
                        la $a0, sters # print the star
                        syscall
                        addi $t3, $t3, 1 # increment loop counter
                        j Condition
                ExitCondition:
                	li $v0, 4
                        la $a0, space 
                        syscall
                        add $a0, $zero, $s1  # print the next number
                        li $v0, 1
                        syscall
                        addi $s1, $s1, 1 # increment the number
        Exit:
                li $v0, 4
                la $a0, line # print newline
                syscall 
                addi $t0, $t0, 1 # increment the number
                j loop1         
        PrintLastLine:
        	li $v0, 4
                la $a0, line # print one more line at the end
                syscall
        li $v0, 10 # end
        syscall			
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		