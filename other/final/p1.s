.data
.align 4
k1: .word 1000
.align 4
num: .word 0
.align 4
guesses: .word 10
.align 4
in: .word 0

low: .asciz "To low. Try agian"
high: .asciz "To high. Try agian"
many: .asciz "To many tries"
won: .asciz "Congratulations, You guessed the number!\nWould you like to play again(y or n)?"
inPatt: .asciz "%d"
inStr: .asciz "Enter num: "
m: .asciz "%d\n"

.text

.global main /*p1*/

main:/*p1*/
push {lr}
@make the random number
mov r0, #0
bl time
bl srand
bl rand
mov r1, r0, asr #1
ldr r2, =k1
ldr r2, [r2]
bl divMod
mov r0, r1
add r0, r0, #1
@got random num lets store it
ldr r1, =num
str r0, [r1]

@output input message
ldr r0, =inStr
bl printf

@get input
ldr r0, =inPatt
ldr r1, inAddr
bl scanf

ldr r0, =m
ldr r1, =in
ldr r1, [r1]
bl printf


pop {lr}
bx lr

inAddr: .word in

.global scanf
.global printf
.global divMod
.global time
.global srand
.global rand

