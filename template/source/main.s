/*
* Programa para pruebas con boton de entrada y LED del Raspberry
* GPIO 14: boton de entrada
* GPIO 7: led en protoboard, enciende si el boton NO esta presionado
* GPIO 8: led en protoboard, enciende si el boton SI esta presionado
* Por: Juana Rivera
* 31 julio 2013
*/

.section .init
.globl _start
_start:
	
	/* Configuracion de puertos GPIO */
	mov r0,#14
	mov r1,#0
	bl SetGpioFunction
	
	mov r0,#7
	mov r1,#1
	bl SetGpioFunction
	
	mov r0,#8
	mov r1,#1
	bl SetGpioFunction
	
	/* Direccion GPIO base */
	bl GetGpioAddress
	mov r4,r0	
infinito:	
	
	/* Revision del boton
	 * Para revisar si el nivel de un GPIO esta en alto o bajo se revisa 
	 * la direccion 0x2020 0034 para los GPIO 0 - 31 */
	ldr r5,[r4,#0x34]
	mov r0,#1
	lsl r0,#14
	and r5,r0 

	/* Si el boton esta en nivel alto se enciende el GPIO 8, y se apaga el GPIO 7 */
	teq r5,#0
	movne r0,#8
	movne r1,#1
	blne SetGpio
	
	movne r0,#7
	movne r1,#0
	blne SetGpio
	
	/* Sino se enciende el GPIO 7, y se apaga el GPIO 8 */
	teq r5,#0
	moveq r0,#8
	moveq r1,#0
	bleq SetGpio
	
	moveq r0,#7
	moveq r1,#1
	bleq SetGpio
	
	/* Loop infinito */
	b infinito