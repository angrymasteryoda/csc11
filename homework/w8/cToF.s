.data
.balign 4
msg: .asciz "Display Degree Centigrade to Degree Fahrenheit\nFahrenheit  Centigrade\n"

test: .asciz "%d"
.text

.global cToF:

/*
r0, inputBeg
r1, inputEnd
*/
cToF:
	ldr r2, =0x1CCCCCD @bp -4 9/5
	mov r1, r0
	ldr r0, =test
	
	
.global printf
	