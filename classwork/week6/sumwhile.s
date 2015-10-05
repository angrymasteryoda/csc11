/*
sum of 1 to 10
*/

.global _start

_start:
    mov r0, #0
    mov r1, #1
loop:
    cmp r1, #10
    bgt end
    add r0, r0, r1
    add r1, r1, #1
    bal loop
end:
    mov r7, #1
    swi 0
