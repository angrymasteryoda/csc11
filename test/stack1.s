.data
msg: .asciz "#=%d"
.text
.global part2
part2:
push {lr}
pop {r1}
ldr r0, =msg
bl printf
pop {lr}
bx lr

.global printf

