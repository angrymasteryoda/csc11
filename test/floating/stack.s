.data

m: .asciz "%d\n"
.text
.global main

main:
push {lr}
mov r1, #5

push {r1}

mov r1, #6
ldr r0, =m
bl printf

pop {r1}
ldr r0, =m
bl printf

/* test 2 */
sub sp, sp, #4

mov r1, #7
str r1, [sp, #4]

mov r1, #50

ldr r0, =m
ldr r1, [sp, #4]
bl printf

add sp, sp, #4

pop {lr}
bx lr
