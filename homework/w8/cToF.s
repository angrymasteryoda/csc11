.data
.balign 4
msg: .asciz "Display Degree Centigrade to Degree Fahrenheit\nFahrenheit  Centigrade\n"

test: .asciz "%d"

.text

.global cToF

/*
r0, inputBeg
r1, inputEnd
*/
cToF:
	push {lr}
	mov r0, r2
	ldr r0, =msg
	bl printf
	pop {lr}
	bx lr	
.global printf
	