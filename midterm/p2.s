.data
.balign 4
hourMsg: .asciz "Enter hours: "
.balign 4
hours: .word 0
.balign 4
hoursPatt: .asciz "%d"



.text
/*
r8 = hours;
r1 = result
*/
.global p1
p1:
	push {lr}
	/* get character later */
	ldr r0, =hourMsg
	bl printf
	ldr r0, =hoursPatt
	ldr r1, =hours
	bl scanf
	ldr r1, hoursAddr
	ldr r8, [r1]
	b parta
parta:
	cmp r8, #11
	bgt amore11
amore11:
	cmp r8, #22
	bgt amax
	mov r1, #30 @base of $30
	sub r2, r8, #11 @hrs - 11
	mov r3, #3 @ temp register for mul
	mul r3, r2, r3
	add r1, r1, r3
amax:
	mov r1, #30 @base of $30
	mov r2, #11 @ 22-11 is always 11
	mov r3, #3 @ temp register for mul
	mul r3, r2 , r3 @ (22-11)*3
	add r1, r1, r3 @add it to result
	sub r2, r8, #22 @ (hrs - 22)
	mov r3, #6 @temp
	mul r3, r2, r3 @(hrs - 22) * 6
	add r1, r1, r3 @added to total
end:
	pop {lr}
	bx lr

hoursAddr: .word hours
.global scanf
.global printf

