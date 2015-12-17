.data
a: .float 0.073
b: .float 0.876
x: .float 0.0
o: .float 1.0
result: .asciz "result: %f\n"
.text
.global p4
p4:
	push {r4-r12,lr}
	@init counter
	mov r10, #0
	ldr r5, xAddr
	vldr s4, [r5]

loop:
	@load floats
	ldr r3, aAddr
	vldr s6, [r3]
	ldr r4, bAddr
	vldr s8, [r4]
	ldr r4, oAddr
	vldr s14, [r4]
	
	@do math
	vmul.f32 s2, s4, s4 @ x*x
	vmul.f32 s2, s2, s6 @ a*(x^2)
	vmul.f32 s10, s8, s4 @ b * x
	vadd.f32 s2, s2, s10 @ (a*(x^2)) + (b*x)
	
	ldr r0, =result
	vcvt.f64.f32 d0, s2
	vmov r1, r2, d0
	bl printf
	
	vadd.f32 s4, s4, s14
	add r10, r10, #1
	cmp r10, #255
	ble loop
end:
	pop {r4-r12,lr}
	bx lr

aAddr: .word a
bAddr: .word b
xAddr: .word x
oAddr: .word o

.global printf

