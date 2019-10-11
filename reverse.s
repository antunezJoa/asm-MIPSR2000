#reverse list

.data
lista: .space 128
lista2: .space 128
cant: .asciiz "Cantidad de numeros: "
num: .asciiz "Ingrese numero: "
diferencia: .asciiz "La lista invertida: "
coma: .asciiz ","
fin: .asciiz "Fin del programa"

.text
main:

la $s0, lista
la $s1, lista2

ingresoCantidad:

    la $a0, cant
    li $v0,4
    syscall

    li $v0,5
    syscall
    move $t0, $v0
    move $t9, $v0
    move $t8, $v0
    move $t7, $v0

    beqz $v0, EXIT2

ingresoNumeros:

    beqz $t0, invertirLista

    la $a0, num
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    sw $v0, ($s0)

    addi $s0, $s0, 4
    addi $t0, $t0, -1

    j ingresoNumeros

invertirLista:

    beqz $t9, preImprimir

    lw $t4, -4($s0)
    sw $t4, ($s1)

    addi $s1, $s1, 4
    addi $s0, $s0, -4
    addi $t9, $t9, -1

    j invertirLista

preImprimir:

    la $s1, lista2

    li $v0, 4
    la $a0, diferencia
    syscall

imprimir:

    beqz $t7, EXIT1

    lw $t6, ($s1)

    li $v0, 1
    add $a0, $0, $t6 
    syscall

    li $v0, 4
    la $a0, coma
    syscall

    addi $s1, $s1, 4
    addi $t7, $t7, -1

    j imprimir

EXIT1:
    li $v0, 10
    syscall

EXIT2:

    la $a0, fin
    li $v0, 4
    syscall

    li $v0, 10
    syscall