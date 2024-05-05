; Header section
include 'emu8086.inc'
TITLE "input output operation" ;quotes could be single or double
NAME "IO" ; compiled version of this code is this
.MODEL small ;indicating the number of data and stack section in the program 
.8086

; STACK SEGMENT SECTION
.STACK 100H ; SPECIFIYING THE SIZE OF THE STACK

; DATA SEGMENT SECTION  :  WHERE WE DEFINE VARIABLES, POINTERS OR CONSTANTS
.DATA
    N1 DB 5
    N2 DB 2 ; two variables n1 and n2 initialized 
    SUM DB ? ; Uninitialized variables       
    
    ; constant variables using the EQU directive
    LF EQU OAh
    CR EQU 0Dh
    HT EQU 09h 
    
    msg1 DB "Enter the first number: $"
    msg2 DB "Enter the second number: $"
    msg3 DB "Sum = $"
    
; CODE SEGMENT SECTION: WHERE THE ACTUAL PROGRAM RESIDES
.CODE
MAIN PROC    
    MOV AX, @DATA
    MOV DS, AX
              
    ; the following three lines do a basic print statement          
    LEA DX, msg1
    MOV AH, 09h
    INT 21h
    ; print statement over
    
    ; read single character with echo
    MOV AH, 01h
    INT 21h
    ; end read singe char
    
    
    ; read single character without echo
    ;MOV AH, 08h
    ;INT 21h
    ; end read singe char   
    
    MOV bl, al   
    
    ; new line statement
    MOV DL, 0Ah
    MOV AH, 02h
    INT 21h
         
    MOV DL, 0Dh
    MOV AH, 02h
    INT 21h
    
    
    ; display message two
    LEA DX, msg2
    MOV AH, 09h
    INT 21h        
    
    
    MOV AH, 1
    INT 21h
    MOV bh, al        
    
    ; new line statement
    MOV DL, 0Ah
    MOV AH, 02h
    INT 21h
         
    MOV DL, 0Dh
    MOV AH, 02h
    INT 21h
    
    
    LEA DX, msg3
    MOV AH, 9
    INT 21h   
    
    ADD BL, BH  ;BL=BL+BH
    MOV DL, BL 
    MOV AH, 02H
    INT 21H
    
    
    
    
    
    
    ; echo lets the user see what they are inputting on the console
      

; CLOSING SECTION
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN