.data
m: .asciz "r"
msg: .asciz "#=%d"
.text
.global part2
part2:
push {lr}
ldr r0, =mov
bl printf
pop {r5}
mov r1, r5
ldr r0, =msg
bl printf
sub r5, r5, #1
pop {lr}
bx lr

.global printf

