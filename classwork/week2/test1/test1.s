/*
    michael risher
    09/9/15
    Our first program
*/

.global _start
_start:
    mov R0, #65 /* put 65 in register 0 */
    mov R7, #1 /* put number 1 in register 7 */
    swi 0 /* software interrupt */

