.file	"operaciones.c"              ; Nombre del archivo fuente en C
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"             ; Sección de datos de solo lectura (constantes)
	.align 4
LC0:
	.ascii "Ingresa el primer numero (para la variable a):\0"   ; Cadena para puts()  ; Transferencia de Datos
LC1:
	.ascii "%d\0"                                             ; Formato para scanf() ; Transferencia de Datos
	.align 4
LC2:
	.ascii "Ingresa el segundo numero (para la variable b):\0" ; Cadena para puts()  ; Transferencia de Datos
	.align 4
LC3:
	.ascii "Calculando operaciones matematicas...\0"          ; Mensaje inicial     ; Transferencia de Datos
LC4:
	.ascii "Suma: %d + %d = %d\12\0"                          ; Formato printf suma ; Transferencia de Datos
LC5:
	.ascii "Resta: %d - %d = %d\12\0"                         ; Formato printf resta; Transferencia de Datos
LC6:
	.ascii "Multiplicacion: %d * %d = %d\12\0"                ; Formato printf mult ; Transferencia de Datos
LC7:
	.ascii "Division: %d / %d = %d\12\0"                      ; Formato printf div  ; Transferencia de Datos

;Inicio del Main
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB10:
	.cfi_startproc
	pushl	%ebp                         ; Guarda base frame anterior        ; Transferencia de Datos
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp                   ; Nuevo base frame                 ; Transferencia de Datos
	.cfi_def_cfa_register 5
	andl	$-16, %esp                   ; Alinea stack en múltiplos de 16  ; Lógica
	subl	$32, %esp                    ; Reserva 32 bytes para variables  ; Aritmética
	call	___main                      ; Llama inicializador runtime C    ; Control de Flujo

;Lectura de variable a
	movl	$LC0, (%esp)                 ; Dirección de mensaje LC0         ; Transferencia de Datos
	call	_puts                        ; puts("Ingresa el primer...")     ; Control de Flujo
	leal	24(%esp), %eax               ; Dirección local de a             ; Transferencia de Datos
	movl	%eax, 4(%esp)                ; Arg2 = &a                        ; Transferencia de Datos
	movl	$LC1, (%esp)                 ; Arg1 = "%d"                      ; Transferencia de Datos
	call	_scanf                       ; scanf("%d",&a)                   ; Control de Flujo

;Lectura de la variable b
	movl	$LC2, (%esp)                 ; Dirección mensaje LC2            ; Transferencia de Datos
	call	_puts                        ; puts("Ingresa el segundo...")    ; Control de Flujo
	leal	20(%esp), %eax               ; Dirección local de b             ; Transferencia de Datos
	movl	%eax, 4(%esp)                ; Arg2 = &b                        ; Transferencia de Datos
	movl	$LC1, (%esp)                 ; Arg1 = "%d"                      ; Transferencia de Datos
	call	_scanf                       ; scanf("%d",&b)                   ; Control de Flujo

;Mensaje de operaciones
	movl	$LC3, (%esp)                 ; Dirección mensaje LC3            ; Transferencia de Datos
	call	_puts                        ; puts("Calculando...")            ; Control de Flujo

;Inicio del ciclo While
	jmp	L2                             ; Salta a verificación del while   ; Control de Flujo
L3:

;Operación de suma
	movl	24(%esp), %edx               ; EDX = a                          ; Transferencia de Datos
	movl	20(%esp), %eax               ; EAX = b                          ; Transferencia de Datos
	addl	%edx, %eax                   ; EAX = a + b                      ; Aritmética
	movl	%eax, 28(%esp)               ; suma = resultado                 ; Transferencia de Datos
	movl	20(%esp), %edx               ; EDX = b                          ; Transferencia de Datos
	movl	24(%esp), %eax               ; EAX = a                          ; Transferencia de Datos
	movl	28(%esp), %ecx               ; ECX = suma                       ; Transferencia de Datos
	movl	%ecx, 12(%esp)               ; Arg3 = suma                      ; Transferencia de Datos
	movl	%edx, 8(%esp)                ; Arg2 = b                         ; Transferencia de Datos
	movl	%eax, 4(%esp)                ; Arg1 = a                         ; Transferencia de Datos
	movl	$LC4, (%esp)                 ; Formato printf suma              ; Transferencia de Datos
	call	_printf                      ; printf("Suma...")                ; Control de Flujo

;Operación resta
	movl	24(%esp), %edx               ; EDX = a                          ; Transferencia de Datos
	movl	20(%esp), %eax               ; EAX = b                          ; Transferencia de Datos
	subl	%eax, %edx                   ; EDX = a - b                      ; Aritmética
	movl	%edx, %eax                   ; EAX = resultado                  ; Transferencia de Datos
	movl	%eax, 28(%esp)               ; resta = resultado                ; Transferencia de Datos
	movl	20(%esp), %edx               ; EDX = b                          ; Transferencia de Datos
	movl	24(%esp), %eax               ; EAX = a                          ; Transferencia de Datos
	movl	28(%esp), %ecx               ; ECX = resta                      ; Transferencia de Datos
	movl	%ecx, 12(%esp)               ; Arg3 = resta                     ; Transferencia de Datos
	movl	%edx, 8(%esp)                ; Arg2 = b                         ; Transferencia de Datos
	movl	%eax, 4(%esp)                ; Arg1 = a                         ; Transferencia de Datos
	movl	$LC5, (%esp)                 ; Formato printf resta             ; Transferencia de Datos
	call	_printf                      ; printf("Resta...")               ; Control de Flujo

;Operación multiplicación
	movl	24(%esp), %edx               ; EDX = a                          ; Transferencia de Datos
	movl	20(%esp), %eax               ; EAX = b                          ; Transferencia de Datos
	imull	%edx, %eax                   ; EAX = a * b                      ; Aritmética
	movl	%eax, 28(%esp)               ; mult = resultado                 ; Transferencia de Datos
	movl	20(%esp), %edx               ; EDX = b                          ; Transferencia de Datos
	movl	24(%esp), %eax               ; EAX = a                          ; Transferencia de Datos
	movl	28(%esp), %ecx               ; ECX = mult                       ; Transferencia de Datos
	movl	%ecx, 12(%esp)               ; Arg3 = mult                      ; Transferencia de Datos
	movl	%edx, 8(%esp)                ; Arg2 = b                         ; Transferencia de Datos
	movl	%eax, 4(%esp)                ; Arg1 = a                         ; Transferencia de Datos
	movl	$LC6, (%esp)                 ; Formato printf mult              ; Transferencia de Datos
	call	_printf                      ; printf("Multiplicacion...")      ; Control de Flujo

;Operación división
	movl	24(%esp), %eax               ; EAX = a                          ; Transferencia de Datos
	movl	20(%esp), %ecx               ; ECX = b                          ; Transferencia de Datos
	cltd                                ; Sign-extend EAX->EDX:EAX          ; Lógica
	idivl	%ecx                         ; EAX = a / b                      ; Aritmética
	movl	%eax, 28(%esp)               ; div = resultado                  ; Transferencia de Datos
	movl	20(%esp), %edx               ; EDX = b                          ; Transferencia de Datos
	movl	24(%esp), %eax               ; EAX = a                          ; Transferencia de Datos
	movl	28(%esp), %ecx               ; ECX = div                        ; Transferencia de Datos
	movl	%ecx, 12(%esp)               ; Arg3 = div                       ; Transferencia de Datos
	movl	%edx, 8(%esp)                ; Arg2 = b                         ; Transferencia de Datos
	movl	%eax, 4(%esp)                ; Arg1 = a                         ; Transferencia de Datos
	movl	$LC7, (%esp)                 ; Formato printf div               ; Transferencia de Datos
	call	_printf                      ; printf("Division...")            ; Control de Flujo
	movl	24(%esp), %eax               ; EAX = a                          ; Transferencia de Datos
	subl	$5, %eax                     ; EAX = a - 5                      ; Aritmética
	movl	%eax, 24(%esp)               ; a = resultado                    ; Transferencia de Datos

;Condición ciclo While
L2:
	movl	24(%esp), %eax               ; EAX = a                          ; Transferencia de Datos
	testl	%eax, %eax                   ; Prueba si a > 0                  ; Lógica
	jg	L3                             ; Salta al ciclo si a > 0           ; Control de Flujo

;Retorno Main
	movl	$0, %eax                     ; return 0                         ; Transferencia de Datos
	leave                              ; Restaura stack                   ; Transferencia de Datos
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret                                ; Retorna de main                  ; Control de Flujo
	.cfi_endproc
LFE10:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef

