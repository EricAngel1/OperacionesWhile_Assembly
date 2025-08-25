.file	"operaciones.c"              ; Nombre del archivo
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"             ; Sección de datos de solo lectura
	.align 4

;Funciones de texto ASCII
LC0:
	.ascii "Ingresa el primer numero (para la variable a):\0"  ;Mensaje a imprimir
LC1:
	.ascii "%d\0"  ;Formato para enteros (scanf/printf)                                        
	.align 4
LC2:
	.ascii "Ingresa el segundo numero (para la variable b):\0" 
	.align 4
LC3:
	.ascii "Calculando operaciones matematicas...\0"          
LC4:
	.ascii "Suma: %d + %d = %d\12\0"                          
LC5:
	.ascii "Resta: %d - %d = %d\12\0"                         
LC6:
	.ascii "Multiplicacion: %d * %d = %d\12\0"                
LC7:
	.ascii "Division: %d / %d = %d\12\0"                      

;Inicio del Main
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB10:
	.cfi_startproc
	pushl	%ebp                         ; Transferencia de Datos
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp                   ; Transferencia de Datos
	.cfi_def_cfa_register 5
	andl	$-16, %esp                   ; Lógica
	subl	$32, %esp                    ; Aritmética
	call	___main                      ; Control de Flujo

;Lectura de variable a
	movl	$LC0, (%esp)                ; Transferencia de Datos
	call	_puts                       ; Control de Flujo
	leal	24(%esp), %eax              ; Transferencia de Datos
	movl	%eax, 4(%esp)               ; Transferencia de Datos
	movl	$LC1, (%esp)                ; Transferencia de Datos
	call	_scanf                      ; Control de Flujo

;Lectura de la variable b
	movl	$LC2, (%esp)                 ; Transferencia de Datos
	call	_puts                        ; Control de Flujo
	leal	20(%esp), %eax               ; Transferencia de Datos
	movl	%eax, 4(%esp)                ; Transferencia de Datos
	movl	$LC1, (%esp)                 ; Transferencia de Datos
	call	_scanf                       ; Control de Flujo

;Mensaje de operaciones
	movl	$LC3, (%esp)                ; Transferencia de Datos
	call	_puts                       ; Control de Flujo

;Inicio del ciclo While
	jmp	L2                             ; Salta a verificación del while   ; Control de Flujo
L3:

;Operación de suma
	movl	24(%esp), %edx              ; Transferencia de Datos
	movl	20(%esp), %eax              ; Transferencia de Datos
	addl	%edx, %eax                  ; Aritmética
	movl	%eax, 28(%esp)              ; Transferencia de Datos
	movl	20(%esp), %edx              ; Transferencia de Datos
	movl	24(%esp), %eax              ; Transferencia de Datos
	movl	28(%esp), %ecx              ; Transferencia de Datos
	movl	%ecx, 12(%esp)              ; Transferencia de Datos
	movl	%edx, 8(%esp)               ; Transferencia de Datos
	movl	%eax, 4(%esp)               ; Transferencia de Datos
	movl	$LC4, (%esp)                ; Transferencia de Datos
	call	_printf                     ; Control de Flujo

;Operación resta
	movl	24(%esp), %edx              ; Transferencia de Datos
	movl	20(%esp), %eax              ; Transferencia de Datos
	subl	%eax, %edx                  ; Aritmética
	movl	%edx, %eax                  ; Transferencia de Datos
	movl	%eax, 28(%esp)              ; Transferencia de Datos
	movl	20(%esp), %edx              ; Transferencia de Datos
	movl	24(%esp), %eax              ; Transferencia de Datos
	movl	28(%esp), %ecx              ; Transferencia de Datos
	movl	%ecx, 12(%esp)              ; Transferencia de Datos
	movl	%edx, 8(%esp)               ; Transferencia de Datos
	movl	%eax, 4(%esp)               ; Transferencia de Datos
	movl	$LC5, (%esp)                ; Transferencia de Datos
	call	_printf                     ; Control de Flujo

;Operación multiplicación
	movl	24(%esp), %edx              ; Transferencia de Datos
	movl	20(%esp), %eax              ; Transferencia de Datos
	imull	%edx, %eax                  ; Aritmética
	movl	%eax, 28(%esp)              ; Transferencia de Datos
	movl	20(%esp), %edx              ; Transferencia de Datos
	movl	24(%esp), %eax              ; Transferencia de Datos
	movl	28(%esp), %ecx              ; Transferencia de Datos
	movl	%ecx, 12(%esp)              ; Transferencia de Datos
	movl	%edx, 8(%esp)               ; Transferencia de Datos
	movl	%eax, 4(%esp)               ; Transferencia de Datos
	movl	$LC6, (%esp)                ; Transferencia de Datos
	call	_printf                     ; Control de Flujo

;Operación división
	movl	24(%esp), %eax             	; Transferencia de Datos
	movl	20(%esp), %ecx             	; Transferencia de Datos
	cltd                               	; Lógica
	idivl	%ecx                       	; Aritmética
	movl	%eax, 28(%esp)             	; Transferencia de Datos
	movl	20(%esp), %edx             	; Transferencia de Datos
	movl	24(%esp), %eax             	; Transferencia de Datos
	movl	28(%esp), %ecx             	; Transferencia de Datos
	movl	%ecx, 12(%esp)             	; Transferencia de Datos
	movl	%edx, 8(%esp)              	; Transferencia de Datos
	movl	%eax, 4(%esp)              	; Transferencia de Datos
	movl	$LC7, (%esp)               	; Transferencia de Datos
	call	_printf                    	; Control de Flujo
	movl	24(%esp), %eax             	; Transferencia de Datos
	subl	$5, %eax                   	; Aritmética
	movl	%eax, 24(%esp)             	; Transferencia de Datos

;Condición ciclo While
L2
	movl	24(%esp), %eax           ; Transferencia de Datos
	testl	%eax, %eax ;eax > 0              ; Lógica
	jg	L3  ;Si es mayor a 0 repite el ciclo     ; Control de Flujo

;Retorno Main
	movl	$0, %eax   				; Transferencia de Datos                    
	leave                            ; Transferencia de Datos
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret                              ; Control de Flujo
	.cfi_endproc
LFE10:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef

