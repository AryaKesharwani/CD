.data
array:  .word 10, 20, 30, 40, 50  # Define an array of 5 integers
newline: .asciiz "\n"              # Define a newline character for printing

.text
.globl main

main:
    # Load base address of the array into $t0
    la $t0, array

    # Index of the element to modify (0-based index)
    li $t1, 2

    # New value to assign to the indexed element
    li $t2, 99

    # Calculate the memory offset for the indexed element (index * 4)
    sll $t3, $t1, 2

    # Add the offset to the base address to get the memory address of the indexed element
    add $t4, $t0, $t3

    # Store the new value at the memory address of the indexed element
    sw $t2, 0($t4)

    # Print the modified array
    li $t5, 0             # Initialize loop counter to 0
print_loop:
    lw $t6, array($t5)    # Load value from array[index] into $t6
    addi $t5, $t5, 4      # Increment loop counter (each integer takes 4 bytes)
    beq $t5, 20, exit_print_loop  # Exit loop when counter reaches end of array
    li $v0, 1             # Load system call code for print integer (1)
    move $a0, $t6         # Move the value to print into $a0
    syscall               # Perform system call to print integer
    li $v0, 4             # Load system call code for print string (4)
    la $a0, newline       # Load address of the newline character into $a0
    syscall               # Perform system call to print newline
    j print_loop          # Jump back to print_loop

exit_print_loop:
    # Exit the program
    li $v0, 10            # Load system call code for exit (10)
    syscall               # Perform system call to exit