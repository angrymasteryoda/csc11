.data
.balign 4
msg: .asciz "Display Degree Centigrade to Degree Fahrenheit\nFahrenheit  Centigrade\n"

.balign 4
test: .asciz "%d"

.text

.global fToC

/*
r0, inputBeg
r1, inputEnd
*/
fToC:
	push {lr}
	mov r0, r2
	ldr r0, =msg
	bl printf
	pop {lr}
	bx lr	
.global printf
	