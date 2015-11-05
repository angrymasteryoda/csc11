.data
msg: .asciz "#=%d"
.text
.global main
main:
push {lr}
mov r5, #34
push {r5}
bl part2
pop {lr}
bx lr

.global part2
