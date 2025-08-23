.file	"operaciones.c"           ; Nombre del archivo fuente en C
	.section .rdata,"dr"        ; Sección de datos de solo lectura (cadenas constantes)
LC0:
	.ascii "Ingresa el primer numero (para la variable a):\0"
LC1:
	.ascii "%d\0"
LC2:
	.ascii "Ingresa el segundo numero (para la variable b):\0"
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
_main:
	pushl	%ebp                    ; Guarda el frame anterior              ; Transferencia de Datos
	movl	%esp, %ebp              ; Configura nuevo frame de stack        ; Transferencia de Datos
	andl	$-16, %esp              ; Alinea la pila                        ; Lógica
	subl	$32, %esp               ; Reserva espacio local (32 bytes)      ; Aritmética
	call	___main                 ; Llama a inicializador de C runtime    ; Control de Flujo
	
    ;Lectura de la variable a
    movl	$LC0, (%esp)            ; Dirección del string LC0              ; Transferencia de Datos
	call	_puts                   ; printf("Ingresa el primer numero..."); Control de Flujo

	leal	24(%esp), %eax          ; Dirección de variable local "a"       ; Transferencia de Datos
	movl	%eax, 4(%esp)           ; Pasa &a como argumento                ; Transferencia de Datos
	movl	$LC1, (%esp)            ; Formato "%d"                          ; Transferencia de Datos
	call	_scanf                  ; scanf("%d",&a);                       ; Control de Flujo

    ;Lectura de la variable b
	movl	$LC2, (%esp)            ; Dirección del string LC2              ; Transferencia de Datos
	call	_puts                   ; printf("Ingresa el segundo numero..."); Control de Flujo

	leal	20(%esp), %eax          ; Dirección de variable local "b"       ; Transferencia de Datos
	movl	%eax, 4(%esp)           ; Pasa &b como argumento                ; Transferencia de Datos
	movl	$LC1, (%esp)            ; Formato "%d"                          ; Transferencia de Datos
	call	_scanf                  ; scanf("%d",&b);                       ; Control de Flujo

    ;Mensaje de operaciones
	movl	$LC3, (%esp)            ; Dirección del string LC3              ; Transferencia de Datos
	call	_puts                   ; printf("Calculando operaciones...");  ; Control de Flujo


    ;Inicio del ciclo While
	jmp	L2                       ; Salta a verificación de condición     ; Control de Flujo

L3: ; Bloque del while

    ;Operacion de Suma
	movl	24(%esp), %edx          ; Carga a en EDX                       ; Transferencia de Datos
	movl	20(%esp), %eax          ; Carga b en EAX                       ; Transferencia de Datos
	addl	%edx, %eax              ; EAX = b + a                          ; Aritmética
	movl	%eax, 28(%esp)          ; Guarda en suma                       ; Transferencia de Datos

    ;Operacion de Resta
	movl	24(%esp), %edx          ; a -> EDX                             ; Transferencia de Datos
	movl	20(%esp), %eax          ; b -> EAX                             ; Transferencia de Datos
	subl	%eax, %edx              ; EDX = a - b                          ; Aritmética
	movl	%edx, %eax              ; Copia resultado a EAX                ; Transferencia de Datos
	movl	%eax, 28(%esp)          ; resta = resultado                    ; Transferencia de Datos

    ;Operacion de Multiplicacion
    movl	24(%esp), %edx          ; a -> EDX                             ; Transferencia de Datos
	movl	20(%esp), %eax          ; b -> EAX                             ; Transferencia de Datos
	imull	%edx, %eax              ; EAX = b * a                          ; Aritmética
	movl	%eax, 28(%esp)          ; mult = resultado                     ; Transferencia de Datos

    ;Operacion de Division
	movl	24(%esp), %eax          ; a -> EAX                             ; Transferencia de Datos
	movl	20(%esp), %ecx          ; b -> ECX                             ; Transferencia de Datos
	cltd                           ; Extiende signo EAX a EDX:EAX          ; Lógica
	idivl	%ecx                    ; EAX = a / b                          ; Aritmética
	movl	%eax, 28(%esp)          ; div = resultado                      ; Transferencia de Datos

    ;Operacion de resta
    movl	24(%esp), %eax          ; a -> EAX                             ; Transferencia de Datos
	subl	$5, %eax                ; EAX = a - 5                          ; Aritmética
	movl	%eax, 24(%esp)          ; a = resultado                        ; Transferencia de Datos

    ;Condición del While
L2:
	movl	24(%esp), %eax          ; Carga a                              ; Transferencia de Datos
	testl	%eax, %eax              ; Verifica si a > 0                    ; Lógica
	jg	L3                        ; Si a > 0, repetir ciclo               ; Control de Flujo

    ;Retorno del Main
	movl	$0, %eax                ; return 0                             ; Transferencia de Datos
	leave                          ; Restaura frame                       ; Transferencia de Datos
	ret                            ; Retorna de main                      ; Control de Flujo
