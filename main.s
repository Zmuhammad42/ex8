.data
done: .asciiz "Stack Exercise Complete!\n"

.text
.globl main
main:
    # You can safely ignore this. I am setting sp to a 'safe', 
    # static address in memory so that my grading script can properly grade your work.
    # Without doing this, the address where sp started and ended would be very unreliable and inconsistent.
    # If you have any interest, I recommend looking into how memory zone are alloted to special registers, and why it isn't consistent.
    li   sp, 0x7FFFF000 


    # Provided code: Here are some initial values
    li t0, 15
    li t1, 24
    li t2, 38
    li t3, 66

    # TODO: Allocate a 16-byte stack frame and save t0-3
    # Save them in register order starting at 0(sp).
addi sp, sp, -16
sw t0, 0(sp)
sw t1, 4(sp)
sw t2, 8(sp)
sw t3, 12(sp)



    # TODO: Add 3 to t0, add the new value of t0 to t1, double the value of t2, and subtract 33 from t3
addi t0, t0, 3
add t1, t1, t0
add t2, t2, t2
addi t3, t3, -33


    # TODO: Restore the values you saved to the stack (t0-3) and place them in registers a2-5.
    # The value saved from t0 should be placed in a2, t1 in a3, t2 in a4, and t3 in a5.
lw a2, 0(sp)
lw a3, 4(sp)
lw a4, 8(sp)
lw a5, 12(sp)


    # TODO: Deallocate the stack frame.
addi sp, sp, 16


    # Print completion message
    la a1, done
    li a0, 4
    ecall

    # Exit
    li a0, 10
    ecall
