.data
enter: .asciiz "\n"
num: .asciiz "Ingrese el numero para calcular su factorial: "

.text
main:

jal INGRESAR
jal UNO
addi $t1, $t0, -1
mul $s0, $t0, $t1
jal FACT
jal PRINT
j EXIT

INGRESAR:

	la $a0, enter
	li $v0, 4
	syscall

	la $a0, num
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	j DONE

UNO:

	beq $t0, 1,PRINT1
	j DONE

	PRINT1:
	add $a0, $0, $t0
	li $v0, 1
	syscall

	j DONE

FACT:

	LOOP:
	addi $t1, $t1, -1
	addi $t0, $t0, -1
	beq $t0, 1, DONE	
	mul $s0, $s0, $t1
	j LOOP

PRINT:
	add $a0, $0, $s0
	li $v0,1
	syscall

DONE:
	jr $ra
EXIT: