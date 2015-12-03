.data
.align 4
a: .skip 12
m: .asciz "%d, "
m1: .asciz "test\n"

.text
.global main
main:
push {lr}
ldr r0, =m1
bl printf

ldr r2, addr_a
mov r3, #1
str r3, [r2]
mov r3, #2
str r3, [r2, +#4]
mov r3, #3
str r3, [r2, +#8]

ldr r1, [r2, +#8]
ldr r0, =m
bl printf
pop {lr}
bx lr


addr_a: .word a

.global printf
