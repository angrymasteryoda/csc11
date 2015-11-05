.data
msg: .asciz "#=%d"
.text
.global part2
part2:
push {lr}
pop {r5}
mov r1, r5
ldr r0, =msg
bl printf
sub r5, r5, #1
pop {lr}
bx lr

.global printf

