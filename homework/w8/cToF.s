.data
.balign 4
msg: .asciz "Display Degree Centigrade to Degree Fahrenheit\nFahrenheit  Centigrade\n"

.balign 4
return2: .word 0


.text

.global cToF

/*
r0, inputBeg
r1, inputEnd
*/
cToF:
	ldr r1, return2Addr
	str lr, [r1]
	ldr lr, return2Addr
	ldr lr, [lr]
	bx lr

return2Addr: .word return2
	