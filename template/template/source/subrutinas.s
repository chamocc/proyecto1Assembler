.globl Boton
	
	Boton:	
	push {lr}
	push {r0}

	ldr r6,[r4,#0x34]
	mov r0,#1
	pop {r7}
	lsl r0,r7
	and r6,r0
	
	teq r6,#1
	movne r0,#8
	movne r1,#1
	blne SetGpio	


	pop {pc}
	
	
	
	