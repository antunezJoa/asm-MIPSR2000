#simple menu to add, sub or mul two numbers

.data    
    num1:    .asciiz      "Primer numero: "
    num2:    .asciiz      "Segundo numero: "
    menu:    .asciiz      "1 para sumar, 2 para restar y 3 para multiplicar: "
    resultado:    .asciiz      "Resultado: "

.text
main:
    #Cargo los enteros que representan a las distintas opciones en los registros
	li $t1, 1
	li $t2, 2
	li $t3, 3

    #primer int

	li $v0, 4
	la $a0, num1
	syscall

	
	#entero
	li $v0, 5
	syscall
	move $t4, $v0
    	
    #segundo int    

	li $v0, 4
	la $a0, num2
	syscall

	
	#entero
	li $v0, 5
	syscall
	move $t5, $v0

    #tercer int, el que indica que operacion quiere realizar

	li $v0, 4
	la $a0, menu
	syscall


	#entero
	li $v0, 5
	syscall
	move $t6, $v0


    beq $t6,$t1,SUMA	#si t6 es igual a t1 (1) el usuario quiere sumar los numeros
    beq $t6,$t2,RESTA	#si t6 es igual a t2 (2) el usuario quiere restar los numeros
    beq $t6,$t3,MULTI	#si t6 es igual a t3 (3) el usuario quiere multiplicar los numeros


SUMA:
	
	li $v0,1 #escribir entero
	add $a0,$t4,$t5 #operacion suma
	syscall
	j EXIT

RESTA:
	li $v0,1 #escribir entero
	sub $a0,$t4,$t5 #operacion resta
	syscall
	j EXIT

MULTI:

	li $v0,1 #escribir entero
	mul $a0,$t4,$t5 #operacion multiplicacion
	syscall
    j EXIT
	    	
EXIT:
	li $v0,10
	syscall
