.data
f1: .float 10.00
mf: .asciz "%f\n"
mi: .asciz "%d\n"
.text

.global main
main:
push {lr}

mov r0, #5
vmov s12, r0
vcvt.f32.s32 s2, s12


ldr r0, =f1
vldr s4, [r0]

vdiv.f32 s2, s2, s4

mov r0, #100
vmov s12, r0
vcvt.f32.s32 s4, s12

vmul.f32 s2, s2, s4


vcvt.f64.f32 d0, s2

ldr r0, =mf
vmov r1, r2, d0
bl printf

pop {lr}
bx lr

