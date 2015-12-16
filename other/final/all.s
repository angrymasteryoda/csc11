.data

inputMsg: .asciz "Enter menu number or 5 to exit: "
scanPatt: .asciz "%d"
.balign 4
input: .word 0
test: .asciz "entered %d\n"

a: .float 0.073
b: .float 0.876
result: .asciz "result: %f\n"
.text
p4:
	push {r4, lr}
	mov r10, #0
loop:
	@load floats
	ldr r3, aAddr
	vldr s6, [r3]
	ldr r4, bAddr
	vldr s8, [r4]

	vmov s15, r10
	vcvt.f32.s32 s4, s15

	vmul.f32 s2, s4, s4 @ x*x
	vmul.f32 s2, s2, s6 @ a*(x^2)
	vmul.f32 s10, s8, s4 @ b * x
	vadd.f32 s2, s2, s10 @ (a*(x^2)) + (b*x)

	ldr r0, =result
	vcvt.f64.f32 d0, s2
	vmov r1, r2, d0
	bl printf

	add r10, r10, #1
	cmp r10, #255
	ble loop

end:
	pop {r4, lr}
	bx lr
	
.global main
main:
	push {r4, lr}
menuloop:
	ldr r0, =inputMsg
	bl printf
	
	ldr r0, =scanPatt
	ldr r1, =input
	bl scanf
	
	ldr r1, inputAddr
	ldr r1, [r1]
	
	cmp r1, #4
	beq problem4
	bal exit
problem4:
	bl p4
	b menuloop
exir:
	pop {r4, lr}
	bx lr
	
inputAddr: .word input
aAddr: .word a
bAddr: .word b
.global printf
.global scanf
