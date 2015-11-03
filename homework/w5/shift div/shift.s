/*
Michael Risher
shifting division
*/

.global _start

_start:
    mov r0, #0		@result
    mov r1, #45	@number
    mov r2, #6		@divisor
    mov r3, #1		@scale
    mov r4, r2		@divisor that we edit
    mov r5, #0		@counter
shift:
    lsl r4, #1		@shift left on divisor
    lsl r3, #1		@shift scale
    cmp r4, r1
    blt shift		@r4 < r1
    lsr r4, #1		@else right shift to fix the over shift
    lsr r3, #1
subtract:
    sub r1, r1, r4	@do subtract
    add r5, r5, r3	@add to counter
    lsr r4, #1		@shift right 
    lsr r3, #1		@shift right
    cmp r4, r1
    blt subtract	@r4 < r1
    mov r0, r5		@done get ready to print
    mov r7, #1
    swi 0
