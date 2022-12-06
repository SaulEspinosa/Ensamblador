
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

data segment
    
buffer db 7,?, 5 dup (0),0,0

binary dw ?

ten dw 10

char db ?, '$'

opcion db 0 ;Almacena la opcion seleccionada

salto db 10,13, ' ','$' ;Espacio

;MENU
hola db 10,13, 'Seleccione una opcion: $' ;Mensaje para seleccionar opcion
menu1 db 10,13, '1.-Decimal -> Binario$' ;Mensaje de seleccion de suma
menu2 db 10,13, '2.-Binario -> Decimal$' ;Mensaje de seleccion de resta
menu3 db 10,13, '3.-Decimal -> Hexadecimal$' ;Mensaje de seleccion de multiplicacion
menu4 db 10,13, '4.-Hexadecimal -> Decimal$' ;Mensaje de seleccion de division
menuExt db 10,13, '5.-Salir...$' ;Mensaje de seleccion para salir


menuOp db 10,13, 'Seleccione una opcion por su numero: $' ;Seleccion de opcion

;Mensajes
num db 0dh,0ah, 'Ingresa tu numero: $'

r1 db 13,10, 'La conversion de Decimal a Binario es: $' ;Mensaje de resultario binario
r2 db 13,10, 'La conversion de Binario a Decimal es: $' ;Mensaje de resultado a decimal
r3 db 13,10, 'La conversion de Decimal a Hexadecimal es: $' ;Mensaje de resultado a hexadecimal
r4 db 13,10, 'La conversion de Hexadecimal a Decimal es; $' ;Mensaje de resultado a decimal

m1 db 13,10, 'Ha elegido convertir de Decimal a Binario $' ;Selecciono convertir a binario
m2 db 13,10, 'Ha elegido convertir de Binario a Decimal $' ;Selecciono convertir a decimal
m3 db 13,10, 'Ha elegido convertit de Decimal a Hexadecimal $' ;Selecciono convertir a hexadecimal
m4 db 13,10, 'Ha elegido convertir de Hexadecimal a Decimal $' ;Selecciono convertir a decimal

ends ;Termina el segmento data

stack segment ; Segmento de pila
    
dw 128 dup(0) ;Espacio de 128
ends ;Termina el segmento pila


code segment ;Segmento code
    
main: ;Etiqueta que indica el inicio del codigo

mov ax,@data ;Se mueve el segmento data a ax
mov ds,ax ;Se mueve el segmento ax a ds

call menu ;Se llama al procedimineto menu
    .exit ;Finaliza
    
menu proc near

mov ah,09h
lea dx,hola
int 21h
lea dx,menu1
int 21h
lea dx,menu2
int 21h
lea dx,menu3
int 21h
lea dx,menu4
int 21h
lea dx,menuExit
int 21h
lea dx,salto
int 21h

;Leer seleccion de opcion
lea dx,menuOp
int 21h

mov ah,01
int 21h
sub al,30h
mov opcion,al

;Comparacion de la opcion

cmp al,1
jz DectoBin
cmp al,2
jz BinoDec
cmp al,3
jz DectoHex
cmp al,4
jz HextoDec
cmp al,5
jz salir
loopne menu


DectoBin:

lea dx,salto
mov ah,09h
int 21h

lea dx,m1
mov ah,09h
int 21h

lea dx,salto
mov ah,09h
int 21h

xor bx, bx

lea dx, num
movah, 09h
int 21h

jmp inicio

inicio:

mov dx,offset buffer
mov ah,0ah
int 21h

mov bx,0
mov bl,buffer[1]
mov buffer[bx+2]

lea si,buffer+2
call binario

mov binary,cx
jcxz detener

lea dx,r1
mov ah,09h
int 21h

mov bx,binary
mov cx,8

imprimir:
mov ah,2
mov dl,'0'
test bx,10000000b
jz cero
mov dl,'1'

cero:
int 21h
shl bx,1
loop imprimir

detener:
lea dx,salto
mov ah,09h
int 21h

mov ah, 4ch
jmp main

binario proc near
push dx
push ax
push si
mov cs,0

sig_digito:
mov al,[si]
inc si


ret




