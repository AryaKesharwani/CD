.data                    # Data section
hello_msg: .asciiz "Hello, World!\n"  # Define a null-terminated ASCII string

.text                    # Text section
.globl main              # Main function entry point
main:
    li $v0, 4             # Load system call code for printing string
    la $a0, hello_msg     # Load address of the string into $a0
    syscall               # Invoke system call to print the string

    li $v0, 10            # Load system call code for exit
    syscall               # Invoke system call to exit program
