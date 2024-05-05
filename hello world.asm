
; we are going to write a program that displays hello, world

msg DB "Hello, World! $"
                         

; start of processor instruction                         
org 100h

MOV DX, OFFSET msg

MOV AH, 09h
INT 21h

; end of processor instruction
ret




