.data
	arg1: 	.asciz "Введите числитель: "
	arg2: 	.asciz "Введите знаменатель: "
	arg3: 	.asciz "Результат: "
	arg4: 	.asciz "Остаток: "
	ln:   	.asciz "\n"
	arg5: 	.asciz "Деление на 0 невозможно\n"
.text
	#Ввод числителя
	la a0, arg1
	li a7, 4	
	ecall
	li a7, 5
	ecall
	mv s0, a0
	
	#Ввод знаменателя
	la a0, arg2
	li a7, 4	
	ecall
	li a7, 5
	ecall
	mv s1, a0
	
	#проверки
	beqz s1, printDivideByZero
	beqz s0, print
	bgtz s0, s0GTZ
	bltz s0, s0LTZ
s0GTZ:
	bgtz s1, positiveResult
	bltz s1, negativeResult
s0LTZ:
	neg s0, s0
	bgtz s1, negativeResult
	bltz s1, positiveResult
positiveResult:
	li s3, 1
	bltz s1, absToS1
	j divide
negativeResult:
	li s3, -1
	bltz s1, absToS1
	j divide
absToS1:
	neg s1, s1
	j divide
	
	#деление
divide:
	sub s0, s0, s1
	addi s2, s2, 1
	bge s0, s1, divide
	bltz s3, negToResult
	j print
negToResult:
	neg s2, s2
	j print
print:
	la a0, arg3
	li a7, 4	
	ecall
	mv a0, s2
	li a7, 1
	ecall
	la a0, ln
	li a7, 4
	ecall
	la a0, arg4
	li a7, 4	
	ecall
	mv a0, s0
	li a7, 1
	ecall
	la a0, ln
	li a7, 4
	ecall
	li a7, 10
	ecall
printDivideByZero:
	la a0, arg5
	li a7, 4	
	ecall
	li a7, 10
	ecall