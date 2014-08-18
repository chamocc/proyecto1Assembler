.section .init 
.globl _start
_start:
b main
.section .text
main:
mov sp, #0x8000
	
	mov r0,#23
	mov r1,#0
	bl SetGpioFunction
	
	mov r0,#24
	mov r1,#0
	bl SetGpioFunction
	
	mov r0,#25
	mov r1,#0
	bl SetGpioFunction
	
	bl GetGpioAddress
	mov r4,r0
	

	
	
loop$:

	mov r0,#23
	bl Boton

	b loop$