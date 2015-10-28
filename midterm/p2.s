.data
.balign 4
hours: .word 0

.balign 4
hoursPatt: .asciz "%d"


.text

.global p1
p1:
	push {lr}
	/* get character later */
	
parta:
	
end:
	pop {lr}
	bx lr


.global scanf
.global printf

