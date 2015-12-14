.data
f1: .float 10.00
mf: .asciz "%f\n"
mi: .asciz "%d\n"
.text

.global main
main:
push {lr}

mov r2, #5

vmov s14, r2			@s14=10-try (int)
vcvt.f32.s32 s0, s14		@s0=10-try (float)

ldr r1, =f1
vldr s1, [r1]


vdiv.f32 s0, s0, s1

mov r2, #100
vmov s15, r2
vcvt.f32.s32 s1, s15

vmul.f32 s0, s0, s1

vcvt.f64.f32 d0, s0

ldr r0, =mf
vmov r1, r2, d0
bl printf

pop {lr}
bx lr

