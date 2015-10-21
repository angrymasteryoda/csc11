.data
.balign 4
msg: .asciz "Display Degree Centigrade to Degree Fahrenheit\nFahrenheit  Centigrade\n"

test: .asciz "end %d"
.text

.global cToF

/*
r0, inputBeg
r1, inputEnd
*/
cToF:
	ldr r0, =test
	bl printf
	bx lr	
.global printf
	