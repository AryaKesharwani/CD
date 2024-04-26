# MIPS assembly program to assign a value to a register, print a message, and exit

    .data
msg:    .asciiz "Value assigned to register $t0: 42\n"  # Define a string message

    .text
    .globl main

main:
    # Assign value 42 to register $t0
    li $t0, 42

    # Print message
    li $v0, 4           # Load system call code for print string (4)
    la $a0, msg         # Load address of the message string into $a0
    syscall             # Perform system call to print string

    # Exit the program
    li $v0, 10          # Load system call code for exit (10)
    syscall             # Perform system call to exit