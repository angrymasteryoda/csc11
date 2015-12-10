.data
k1: .word 1000
m: .asciz "%d\n"

.text

.global main /*p1*/

p1: /*main:*/
push {lr}

mov r0, #0
bl time
bl srand
bl rand
mov r1, r0, asr #1
ldr r2, =k1
ldr r2, [r2]
bl divMod
@mov r0, r1

ldr r0, =m
bl printf



pop {lr}
bx lr
.global divMod
.global time
.global srand
.global rand