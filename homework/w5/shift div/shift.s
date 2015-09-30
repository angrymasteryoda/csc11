/*
Michael Risher
shifting division
*/

.global _start

_start:
    mov r0, #0
    mov r1, #45
    mov r2, #6
    mov r3, #1
    mov r4, r2
    mov r5, #0
shift:
    lsl r4, #1
    lsl r3, #1
    cmp r4, r1
    blt shift
    lsr r4, #1
    lsr r3, #1
subtract:
    sub r1, r1, r4
    add r5, r5, r3
    lsr r4, #1
    lsr r3, #1
    cmp r4, r1
    blt subtract
    mov r0, r5
    mov r7, #1
    swi 0
