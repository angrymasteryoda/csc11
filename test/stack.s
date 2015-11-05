.data
msg: .asciz "t1\n"
m: .asciz "=%d\n"
.text
.global main
main:
push {lr}
mov r5, #34
ldr r0, =msg
bl printf
push {r5}
bl part2
pop {r5}
ldr r0, =m
mov r1, r5
bl printf
pop {lr}
bx lr

.global part2
.global printf
