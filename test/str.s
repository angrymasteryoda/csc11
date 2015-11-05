.data
num: .word 15
m: .asciz "%d\n"
.text

.global main
main:
push {lr}
ldr r1, numA
mov r3, #3
str r3, [r1]

ldr r1, numA
ldr r1, [r1]
ldr r0, =m
bl printf
pop {lr}
bx lr

.global printf

numA: .word num
