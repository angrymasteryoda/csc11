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
	
	bx lr	
.global printf
	