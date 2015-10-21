.data
.balign 4
msg: .asciz "Display Degree Centigrade to Degree Fahrenheit\nFahrenheit  Centigrade\n"

.balign 4
test: .asciz "%d"

.text

.global cToF

/*
r0, inputBeg
r1, inputEnd
*/
cToF:
	push {lr}
	pop {lr}
	bx lr	
.global printf
	