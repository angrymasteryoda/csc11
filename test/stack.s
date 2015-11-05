.data
msg: .asciz "t1"
.text
.global main
main:
push {lr}
mov r5, #34
ldr r0, =msg
bl printf
@push {r5}
bl part2
pop {lr}
bx lr

.global part2
.global printf
