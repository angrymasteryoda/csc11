.data
intro: .asciz "Mastermind!\nGuess the 3 digit octal in 10 tries\n"
showAsk: .asciz "Show number? (y/n)\n"
showPatt: .asciz "%1s"
inAsk: .asciz "Enter a 3 digit number separated with spaces\n" 
inPatt: .asciz "%d %d %d"
ans: .asciz "The number is %d%d%d\n"
won: .asciz "You Won!\n"
guesses: .asciz "It took %d guesses\n"
lost: .asciz "You lost the correct number was %d%d%d\n"
again: .asciz "Play again? (y/n)\n"
rightplace: .asciz "%d digit(s) are correct and in the right place\n"
correct: .asciz  "%d digit(s) are correct\n"
.balign 4
in: .word 0
.balign 4
n1: .word 0
.balign 4
n2: .word 0
.balign 4
n3: .word 0
.balign 4
y: .word 'y'
.balign 4
n: .word 'n'
.balign 4
r1: .word 0
.balign 4
r2: .word 0
.balign 4
r3: .word 0
.text

.global main
main:
	push {lr}
	mov r0, #0
	bl time
	bl srand
	ldr r0, =intro
	bl printf
gameloop:
	@make the random numbers and store them
	bl gRand
	mov r7, r0
	ldr r1, =r1
	str r7, [r1]
	bl gRand
	mov r8, r0
	ldr r1, =r2
	str r8, [r1]
	bl gRand
	mov r9, r0
	ldr r1, =r3
	str r9, [r1]
	@ as if you want to see the number
	ldr r0, =showAsk
	bl printf
	ldr  r0, =showPatt
	ldr r1, =in
	bl scanf
	ldr r1, =in
	ldr r1, [r1]
	ldr r2, =y
	ldr r2, [r2]
	cmp r1, r2
	beq showNumber
	b startLoop
startLoop:
	mov r10, #0 @loop counter
	b loop
loop:
	ldr r0, =inAsk
	bl printf
	ldr r0, =inPatt
	ldr r1, =n1
	ldr r2, =n2
	ldr r3, =n3
	bl scanf
	@ reload the numbers
	ldr r3, =n1
	ldr r3, [r3]
	ldr r4, =n2
	ldr r4, [r4]
	ldr r5, =n3
	ldr r5, [r5]
	mov r0, r7 @mov correct numbers to r0-r2
	mov r1, r8
	mov r2, r9
	@check the inputs
	b check
afterCheck:
	ldr r7, =r1
	ldr r7, [r7]
	ldr r8, =r2
	ldr r8, [r8]
	ldr r9, =r3
	ldr r9, [r9]
	@pop {r7-r10, lr}
	cmp r6, #1
	beq win
	add r10, r10, #1
	cmp r10, #10
	beq lose
	b loop
showNumber:
	ldr r0, =ans
	mov r1, r7
	mov r2, r8
	mov r3, r9
	bl printf
	b startLoop
win:
	ldr r0, =won
	bl printf
	add r1, r10, #1
	ldr r0, =guesses
	bl printf
	b end
lose:
	ldr r0, =lost
	mov r1, r7
	mov r2, r8
	mov r3, r9
	bl printf
	b end
check:
	mov r6, #0 @did we win
	mov r7, #0 @right place
	mov r8, #0 @correct number
	cmp r3, r0
	beq r3eqr0
	cmp r3, r1
	addeq r8, r8, #1
	cmp r3, r2
	addeq r8, r8, #1
	b checkn2
r3eqr0:
	add r7, r7, #1
	b checkn2
checkn2:
	cmp r4, r1
	beq r4eqr1
	cmp r4, r0
	addeq r8, r8, #1
	cmp r4, r2
	addeq r8, r8, #1
	b checkn3
r4eqr1:
	add r7, r7, #1
	b checkn3
checkn3:
	cmp r5, r2
	beq r5eqr2
	cmp r5, r1
	addeq r8, r8, #1
	cmp r5, r0
	addeq r8, r8, #1
	b output
r5eqr2:
	add r7, r7, #1
	b output
output:
	mov r3, r0
	mov r4, r1
	mov r5, r2
	cmp r7, #3
	moveq r6, #1
	movne r6, #0
	ldr r0, =rightplace
	mov r1, r7
	bl printf
	ldr r0, =correct
	mov r1, r8
	bl printf
	b afterCheck
end:
@*/
	ldr r0, =again
	bl printf
	ldr r0, =showPatt
	ldr r1, =in
	bl scanf
	ldr r0, =in
	ldr r0, [r0]
	ldr r1, =y
	ldr r1, [r1]
	cmp r0, r1
	beq gameloop
	pop {lr}
	bx lr

inAddr: .word in
n1Addr: .word n1
n2Addr: .word n2
n3Addr: .word n3

.global time
.global srand
.global gRand
.global printf
.global scanf
