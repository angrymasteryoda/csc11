.data
msg: .asciz "#=%d"
.text
.global main
main:
push {lr}
mov r2, #34
push {r2}
bl part2
pop {lr}
bx lr

.global part2
