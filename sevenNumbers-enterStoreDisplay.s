#enter, store and display seven numbers

.data
lista: .space 128
inumero: .asciiz "Ingrese numero: "
pnumero: .asciiz "Los numeros que usted ingreso son: "
coma: .asciiz ","

.text
main:

li $s0, 7	#contador
la $s1, lista	#puntero

LOOP:
beq $s0, $0, prePRINT

la $a0, inumero
li $v0, 4
syscall

li $v0, 5
syscall
sw $v0, 0($s1)

addi $s1, $s1, 4
addi $s0, $s0, -1

j LOOP

prePRINT:

li $s0, 7	#contador
la $s1, lista	#puntero

li $v0, 4
la $a0, pnumero
syscall

PRINT:

beqz $s0, EXIT
lw $t1, 0($s1)	#elemento lista

li $v0, 1
add $a0, $0, $t1
syscall

li $v0, 4
la $a0, coma
syscall

addi $s1, $s1, 4
addi $s0, $s0, -1

j PRINT

EXIT:
li $v0, 10
syscall
