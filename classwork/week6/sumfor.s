/*
sum of 1 to 10
*/

global _start:

_start:
    mov r0, #0
    mov r1, #1   @counter
    mov r2, #0
loop:
    add r0, r0, r1
    add r1, r1, #1
    cmp r1, #10
    bge loop
    mov r7, #1
    swi 0