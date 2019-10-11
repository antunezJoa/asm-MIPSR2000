.data
n: .asciiz "Cantidad de nros de la sucesion Fibonacci que desea: "
guion: .asciiz "-"
uno: .word 1

.text
main:

la $a0, n
li $v0, 4
syscall

li $v0,5			#int que indica la cantidad de numeros de fibonacci a obtener
syscall
move $t0, $v0

lw $s0, uno($0)		#guardo el int 1 en dos registros para posteriormente usar
lw $s1, uno($0)

add $a0, $s0, $0	#el usuario va a pedir desde 1 hasta n numeros de fibonacci asi que imprimo el primero (el 1)
li $v0,1
syscall

addi $t0, $t0, -1	#ya que imprimi el primer numero chequeo si solo queria el primero o si tengo que continuar
beq $t0, 0, EXIT

la $a0, guion
li $v0, 4
syscall

add $a0, $s1, $0	#evidentemente quiere mas numeros asi que continuo
li $v0,1
syscall

addi $t0, $t0, -1 	#le resto 1 al contador ya que imprimi otro numero

LOOP:				#creo el loop
	beq $t0, 0, EXIT#chequeo si el contador es 0 para finalizar el programa ya que si esto es asi ya imprimi los primeros numeros que el usuario queria
	la $a0, guion
	li $v0, 4
	syscall
	add $s2, $s1, $s0	#guardo en otro registro la suma de los dos numeros anteriores
	add $a0, $s2, $0	
	li $v0,1
	syscall
	addi $t0, $t0, -1	#le resto 1 al contador y chequeo si vale 0
	beq $t0, 0, EXIT
	la $a0, guion
	li $v0, 4
	syscall
	add $s0, $s2, $s1	#guardo en otro registro la suma de los dos numeros anteriores
	add $a0, $s0, $0
	li $v0,1
	syscall
	addi $t0, $t0, -1	#le resto 1 al contador y chequeo si vale 0
	beq $t0, 0, EXIT
	la $a0, guion
	li $v0, 4
	syscall
	add $s1, $s2, $s0	#guardo en otro registro la suma de los dos numeros anteriores
	add $a0, $s1, $0
	li $v0,1
	syscall
	addi $t0, $t0, -1	#le resto 1 al contador y chequeo si vale 0 y si no es asi vuelvo a iniciar el LOOP
	beq $t0, 0, EXIT
	j LOOP

EXIT:
	li $v0, 10
	syscall
