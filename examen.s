.data
lista: .space 128
lista2: .space 128
lista3: .space 128
cant: .asciiz "Cantidad de numeros: "
num: .asciiz "Ingrese numero: "
diferencia: .asciiz "La diferencia de los cuadrados: "
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

    beqz $t9, preDif

    lw $t4, -4($s0)
    sw $t4, ($s1)

    addi $s1, $s1, 4
    addi $s0, $s0, -4
    addi $t9, $t9, -1

    j invertirLista

preDif:

   la $s1, lista2
   la $s2, lista3
   addi $t8, $t8, -1

dif:
    beqz $t8, preImprimir

    lw $t0, ($s1)
    lw $t9, 4($s1)

    mul $t0, $t0, $t0
    mul $t9, $t9, $t9

    sub $s7, $t9, $t0
    sw $s7, ($s2)

    addi $s1, $s1, 4
    addi $s2, $s2, 4
    addi $t8, $t8, -1

    j dif

preImprimir:

    la $s2, lista3
    addi $t7, $t7, -1

    li $v0, 4
    la $a0, diferencia
    syscall

imprimir:

    beqz $t7, EXIT1

    lw $t6, ($s2)

    li $v0, 1
    add $a0, $t6, $0
    syscall

    li $v0, 4
    la $a0, coma
    syscall

    addi $s2, $s2, 4
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