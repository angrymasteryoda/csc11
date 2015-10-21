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
	mov r0, #15
	bx lr	
	