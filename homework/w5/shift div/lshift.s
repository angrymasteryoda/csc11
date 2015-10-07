/*
shifting division with lehr code
*/

.global _start

_start:
    mov r0, #21 @r5%r4 result
    mov r1, #0  @r5/r4 result
    mov r2, #1  @increment val
    mov r3, #10
shiftLeft:
    lsl r3, #1
    lsl r2, #1
    cmp r0, r3
    bgt shiftLeft
    lsr r3, #1
    lsr r2, #1
subtract:
    cmp r0, r3
    blt output
    add r1, r1, r2
    sub r0, r0, r3
shiftRight:
    cmp r2, #1
    beq subtract
    cmp r3, r0
    ble subtract
    lsr r2, #1
    lsr r3, #1
    bal shiftRight
    bal output
output:
    mov r4, r0
    mov r0, r1
    mov r7, #1
    swi 0
