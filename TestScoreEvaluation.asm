
include Irvine32.inc
.386
; .model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
prompt BYTE " is your numerical grade. Your Letter Grade is: ", 0
grade BYTE ?

.code


main proc
	;call Randomize
	mov ecx, 10
	push ecx
	call GradeCalc
main endp

AddMoreDigits proc
	add eax, 50
	ret
AddMoreDigits endp

printGrade proc
	mov edx, OFFSET prompt
	call writeString
	call writeChar
	call crlF
	ret
printGrade endp

GradeCalc proc  
L1:
	cmp ecx, 0					
	je Quit
	
	
	
	mov eax, 101
	call RandomRange
	cmp eax, 50
	jnae L1					;if the random number is below 50, jump back to L1. We want nothing to do with your shenanigans.
	call writeDec

	Grade_A:
	cmp eax, 90
	jnge Grade_B			;jump to Grade_B if not greater or equal to
	mov al, 'A'
	call printGrade
	cmp ecx, 0
	je Quit
	loop L1

	Grade_B:
	cmp eax, 80
	jnge Grade_C
	mov al, 'B'
	call printGrade
	cmp ecx, 0
	je Quit
	loop L1

	Grade_C:
	cmp eax, 70
	jnge Grade_D
	mov al, 'C'
	call printGrade
	cmp ecx, 0
	je Quit
	loop L1

	Grade_D:
	cmp eax, 60
	jnge Grade_F
	mov al, 'D'
	call printGrade
	cmp ecx, 0
	je Quit
	loop L1

	Grade_F:
	cmp eax, 60
	jg L1
	mov al, 'F'
	call printGrade
	cmp ecx, 0
	je Quit
	loop L1
	
	Quit:								;Quit if ecx = 0
	exit
	GradeCalc endp

invoke ExitProcess,0
end main