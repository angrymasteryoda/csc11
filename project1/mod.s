.data
msg: .asciz "%d"
.text
.global main
main:
	push {lr}
mov r0, #152
mov r1, #6
	mov R5, r1
	mov  R2, R5
	cmp R2, R0
	bgt end
	b modStart
loop:
	cmp R2, R0
	bgt subtract
modStart:
	lsl R2, #1
	b loop
subtract:
	lsr R2, #1
	cmp R2, R5
	bmi end
	cmp R2, R0
	bgt subtract
	sub R0, R0, R2
	b subtract
end:
	mov r0, r1
	ldr r0, =msg
	bl printf
	pop {lr}
	mov R7, #1
	bx lr