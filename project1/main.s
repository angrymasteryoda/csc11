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
.text

.global main
main:
	mov r0, #0
	bl time
	bl srand
	push {lr}
	ldr r0, =intro
	bl printf
gameloop:
	bl gRand
	ldr r6, n1Addr
	mov r5, r0
	ldr r5, [r6]
	bl gRand
	ldr r6, n2Addr
	mov r5, r0
	ldr r5, [r6]
	bl gRand
	ldr r6, n3Addr
	mov r5, r0
	ldr r5, [r6]
	ldr r1, =n1Addr
	ldr r2, =n2Addr
	ldr r3, =n3Addr
	ldr r0, =lost
	bl printf
	
	
	
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
.global check
