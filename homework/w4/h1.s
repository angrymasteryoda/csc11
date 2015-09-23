/*
michael risher
homework 1
*/

.global _start

_start:
  mov r1, #88  /* bp0 width7 */
  ldr r2, =0x155556   /*bp-24 wd24 */
  mul r0, r2, r1  /*bp-24 wd 31*/
  lsr r0, #24
  mov r7, #1
  swi 0
