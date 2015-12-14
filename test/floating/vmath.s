.data
f1: .float 5
i1: .float 4
s: .asciz "= %f"

.text

.global main
main:
push {lr}
ldr r1, =f1
vldr s12, [r1]

@ldr r1, =i1
@vldr s13, [r1]
mov r1, #4
vmov s13, r1
vcvt.f32.u32 s13, r13

vdiv.f32 s11, s12, s13
vcvt.f64.f32 d1, s11

ldr r0, =s
vmov r1, r2, d1
bl printf


pop {lr}
bx lr


