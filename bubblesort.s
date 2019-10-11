#bubblesort

.data

tlist: .word 10
list: .word 59,1,8,6,25,1050,69,32,655,48
guion: .asciiz "-"
sortedList: .asciiz "Lista Ordenada: "

.text
main:

	lw $t0, tlist($0)

LOOP1:
	lw $s0, tlist ($0)
	la $t1, list

LOOP2:
	lw $t2, 0($t1)
	lw $t3, 4($t1)
	
	ble $t3, $t2, SWAP
	j NOTSWAPORSWAPOUT

SWAP:
	sw $t3, 0($t1)
	sw $t2, 4($t1)
	j NOTSWAPORSWAPOUT

NOTSWAPORSWAPOUT:
	addi $t1, $t1, 4
	addi $s0, $s0, -1
	beq $s0, 1, LOOP2OUT
	j LOOP2
	
LOOP2OUT:
	addi $t0, $t0, -1
	beq $t0, 0, prePRINT
	j LOOP1
	
prePRINT:
	lw $s1, tlist($0)
	la $t1, list
	lw $t9, ($t1)
	
	la $a0, sortedList
	li $v0,4
	syscall
	
PRINT:
	add $a0, $t9, $0
	li $v0, 1
	syscall
	
	la $a0, guion
	li $v0, 4
	syscall
	
	addi $t1, $t1, 4
	lw $t9, ($t1)
	addi $s1, $s1, -1
	beq $s1, 0, EXIT
	j PRINT
	
EXIT:
	li $v0, 10
	syscall