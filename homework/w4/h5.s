/*
michael risher
homework 1
problem 4
6.8
6800 bp-3
3.243
3243 bp-3
*/

.global _start

_start:
  ldr r1, =0x6800  /* bp-12 wd16 */
  ldr r2, =0x3243 /*bp-12 wd16 */
  mul r0, r2, r1  /*bp-24 wd 32*/
  lsr r0, #24
  mov r7, #1
  swi 0
