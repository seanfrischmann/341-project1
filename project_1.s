.globl main
.globl string
#.globl convert
#.globl mean
#.globl median
.globl disString
#.globl disArray
.globl exitProgram
.data
string_buffer:
	.space 100
		#start at spot 0, end at spot 99
string_array:
	.space 100
		#start at spot 100, end at spot 199
convert_array:
	.space 100
		#start at spot 200, end at spot 299
string_prompt:
	.asciiz "Enter a string of ASCII comma seperated signed integers\n"
		#start at spot 300, end at spot 356
display_string_prompt:
	.asciiz "Your string is\n"
		#start at spot 357, end at spot 372
main_menu_prompt:
	.asciiz "Enter:\n 1-Input String 2-Display String 3-Convert String\n"
		#start at spot 373, end at spot 431
	.asciiz " 4-Mean 5-Median 6-Display Array\n 7-Exit Program\n"
		#start at spot 431, end at spot 481
	.asciiz "Please enter a nunmber from the given menu\n"
		#start at spot 481, end at spot 525
exit_prompt:
	.asciiz "Program is now exiting, Have a Nice Day!\n"
		#start at spot 525, end at spot 567
.text

main:
		#addi $sp, $sp, -4	#Save return register to stack
		#sw $ra, ($sp)

		addi $v0, $0, 4			#print main_menu_prompt
		lui $a0, 0x1000			#load data array
		addi $a0, $a0, 373		#prompt location in the array
		syscall

		addi $v0, $0, 4			#print main_menu_prompt
		lui $a0, 0x1000			#load data array
		addi $a0, $a0, 431		#prompt location in the array
		syscall

		addi $v0, $0, 5			#Read Integer
		syscall

		add $t0, $0, $v0		#add v0 to t0

		beq $t0, 1,string		#branch to string
		beq $t0, 2, disString
		beq $t0, 7, exitProgram	#branch to exit

		addi $v0, $0, 4			#print main_menu_prompt
		lui $a0, 0x1000			#load data array
		addi $a0, $a0, 481		#prompt location in the array
		syscall

		j main					#Return to top of main
		or $0, $0, $0			#Delay Slot (Branch)

string:
		addi $v0, $0, 4			#print prompt
		lui $a0, 0x1000			#load data array
		addi $a0, $a0, 300		#prompt location in the array
		syscall

		addi $v0, $0, 8			#read input_string
		lui $a0, 0x1000			#load data array
		addi $a1, $0, 100		#sets max string length
		add $s0, $0, $a0		#add input_string to s0
		syscall


		j main					#Return to Main
		or $0, $0, $0			#Delay Slot(branch)

disString:
		addi $v0, $0, 4			#print display_string_prompt
		lui $a0, 0x1000			#load data array
		addi $a0, $a0, 357		#prompt location in the array
		syscall
		addi $v0, $0, 4			#print input_string
		add $a0, $0, $s0		#add input_string to a0
		syscall
		j main					#Return to Main
		or $0, $0, $0			#Delay Slot(branch)

convert:
		l $t0, 0($s0)			#Load s0

exitProgram:
		addi $v0, $0, 4			#print exit_prompt
		lui $a0, 0x1000			#load data array
		addi $a0, $a0, 525		#prompt location in the array
		syscall

		addi $v0, $0, 10		#Exit command
		syscall

