.data
.balign 4
msg: .asciz "Display Degree Centigrade to Degree Fahrenheit\nFahrenheit  Centigrade\n"

test: .asciz "end %d"
.text

.global cToF

/*
r0, inputBeg
r1, inputEnd
returns r1 for some reason
*/
cToF:
	
	mov r0, #15
	mov r1, #20
	bx lr	
	