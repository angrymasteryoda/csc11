/* To Compile
	gcc -c mainDivModFuncV2.s
	gcc -c mainDivModV2.s
	gcc mainDivModFuncV2.o mainDivModV2.o -o divMod
	./factorial
*/
.data
message3: .asciz "The outputs are a div b = %d and a mod b = %d\n"
 
.text
.globl main
main:
    push {lr}
	mov r1, #6
	mov r2, #3
	bl divMod
	mov r2,r1					 /* divMod returns r0,r1 -> need r1,r2 for printf */
	mov r1,r0
    ldr r0, =message3  /* Set &message3 as the first parameter of printf */
    bl printf                    /* Call printf */
    pop {lr}
    bx lr                        /* Leave main */
 
address_of_message3: .word message3
