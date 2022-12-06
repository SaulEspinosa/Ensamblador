TITLE CONVERSOR
.MODEL SMALL
.STACK
.DATA
Intro db 10,13,7,"CONVERSOR BASICO",10,13,7,"-----------------",10,13,7,"$"

Menu db 10,13,7,"1-DECIMAL->BINARIO",10,13,7,"2-BINARIO->DECIMAL",10,13,7,"3-DECIMAL->HEXADECIMAL",10,13,7,"4-HEXADECIMAL A DECIMAL",10,13,7,"5-SALIR","$"
opcion db 0
Elija db 10,13,7,"ELIJA SU OPCION : ","$"
Ingrese db 10,13,7,   "INGRESE EL NUMERO :","$"
MResultado db 10,13,7,"RESULTADO         :","$"
Salto db 10,13,7,"$"
d1 db 0
d2 db 0
d3 db 0
d4 db 0
d5 db 0
d6 db 0
d7 db 0
d8 db 0
d9 db 0
d10 db 0
d11 db 0
d12 db 0
d13 db 0
d14 db 0
d15 db 0
d16 db 0
da1 dd 0
da2 dd 0
da3 dd 0
da4 dd 0
da5 dd 0
da6 dd 0
da7 dd 0
da8 dd 0
da9 dd 0
da10 dd 0
da11 dd 0
da12 dd 0
da13 dd 0
da14 dd 0
da15 dd 0
da16 dd 0
DM dd 0
UM dd 0
C dd 0
D db 0
U db 0
numero dd 0
n db 0
auxi  dd 0
auxi2 dd 0
auxi3 db 0
peso dd 0

.CODE

    mov ax,@DATA
    mov ds,ax
    mov ah,09h
    lea dx,Intro
    int 21h
M: ;Etiqueta
    mov ah,09h
    lea dx,Menu
    int 21h
    
ingresar: ;Etiqueta

    mov ah,09h
    lea dx,Elija
    int 21h
    mov ah,01h
    int 21h
    sub ax,30h
    mov opcion,al
    mov ah,09h
    lea dx,Salto
    int 21h
    
compracion: ;Etiqueta

    cmp opcion,1
    jz DEBI
    cmp opcion,2
    jz BIDE
    cmp opcion,3
    jz DEHE
    cmp opcion,4
    jz HEDE
    cmp opcion,5
    jz Salir
    
DEBI: ;Etiqueta

mov ah,09h
lea dx,Ingrese
int 21h
call Decimales
mov ax,0
mov ax,numero
cmp ax,255
jbe MENOR
ja Mayor

;--------MENOR--IMPRIMIR------
MENOR:
mov n,al
mov bl,2
call men
mov ah,auxi3
mov d1,ah
cmp n,0
je imprimir
call Men
mov ah,auxi3
mov d2,ah
cmp n,0
je imprimir
call Men
mov ah,auxi3
mov d3,ah
cmp n,0
je imprimir
call Men
mov ah,auxi3
mov d4,ah
cmp n,0
je imprimir
call Men
mov ah,auxi3
mov d5,ah
cmp n,0
je imprimir
call Men
mov ah,auxi3
mov d6,ah
cmp n,0
je imprimir
call Men
mov ah,auxi3
mov d7,ah
cmp n,0
je imprimir
call Men
mov ah,auxi3
mov d8,ah
cmp n,0
je imprimir
call Men
mov ah,auxi3
mov d9,ah
cmp n,0
je imprimir
jmp imprimir

Men proc ;Procedimiento
div bl
mov auxi3,ah
mov n,0
mov n,al

ret ;De regreso
Men Endp ;Marca el fin del proceso

imprimir: ;Etiqueta
mov ah,09h
lea dx,MResultado
int 21h
mov ax,0
mov al,d16
mov auxi3,al
call print ;llama al proceso
mov ax,0
mov al,d15
mov auxi3,al
call print
mov ax,0
mov al,d14
mov auxi3,al
call print
mov ax,0
mov al,d13
mov auxi3,al
call print
mov ax,0
mov al,d12
mov auxi3,al
call print
mov ax,0
mov al,d11
mov auxi3,al
call print
mov ax,0
mov al,d10
mov auxi3,al
call print
mov ax,0
mov al,d9
mov auxi3,al
call print
mov ax,0
mov al,d8
mov auxi3,al
call print
mov ax,0
mov al,d7
mov auxi3,al
call print
mov ax,0
mov al,d6
mov auxi3,al
call print
mov ax,0
mov al,d5
mov auxi3,al
call print
mov ax,0
mov al,d4
mov auxi3,al
call print
mov ax,0
mov al,d3
mov auxi3,al
call print
mov ax,0
mov al,d2
mov auxi3,al
call print
mov ax,0
mov al,d1
mov auxi3,al
call print
mov ax,0
jmp Limpiar ;Realiza salto

print proc
mov ah,02h
mov dl,auxi3
add dl,30h
int 21h

ret; Retroceso
print endp ;Finalizar proceso

;--------MAYOR--IMPRIMIR------
MAYOR: ;Etiqueta
mov numero,ax
mov cx,2
call MAY
mov dx,auxi
mov da1,dx
cmp numero,0
je imprimir2
call MAY
mov dx,auxi
mov da2,dx
cmp numero,0
je imprimir2
call MAY
mov dx,auxi
mov da3,dx
cmp numero,0
je imprimir2
call MAY
mov dx,auxi
mov da4,dx
cmp numero,0
je imprimir2
call MAY
mov dx,auxi
mov da5,dx
cmp numero,0
je imprimir2
call MAY
mov dx,auxi
mov da6,dx
cmp numero,0
je imprimir2
call MAY
mov dx,auxi
mov da7,dx
cmp numero,0
je imprimir2
call MAY
mov dx,auxi
mov da8,dx
cmp numero,0
je imprimir2
call MAY
mov dx,auxi
mov da9,dx
cmp numero,0
je imprimir2
call MAY
mov dx,auxi
mov da10,dx
cmp numero,0
je imprimir2
call MAY
mov dx,auxi
mov da11,dx
cmp numero,0
je imprimir2
call MAY
mov dx,auxi
mov da12,dx
cmp numero,0
je imprimir2
call MAY
mov dx,auxi
mov da13,dx
cmp numero,0
je imprimir2
call MAY
mov dx,auxi
mov da14,dx
cmp numero,0
je imprimir2
call MAY
mov dx,auxi
mov da15,dx
cmp numero,0
je imprimir2
call MAY
mov dx,auxi
mov da16,dx
cmp numero,0
je imprimir2
jmp imprimir2

MAY proc;Proncedimiento
div cx
mov auxi,dx
mov numero,0
mov numero,ax
ret;retorno
MAY endp ;fin del proceso

;---------IMPRIMIR2-------
imprimir2: ;Etiqueta

mov ah,09h
lea dx,MResultado
int  21h

mov ax,0
mov ax,da16
mov auxi,ax
call print2
mov ax,0
mov ax,da15
mov auxi,ax
call print2
mov ax,0
mov ax,da14
mov auxi,ax
call print2
mov ax,0
mov ax,da13
mov auxi,ax
call print2
mov ax,0
mov ax,da12
mov auxi,ax
call print2
mov ax,0
mov ax,da11
mov auxi,ax
call print2
mov ax,0
mov ax,da10
mov auxi,ax
call print2
mov ax,0
mov ax,da9
mov auxi,ax
call print2
mov ax,0
mov ax,da8
mov auxi,ax
call print2
mov ax,0
mov ax,da7
mov auxi,ax
call print2
mov ax,0
mov ax,da6
mov auxi,ax
call print2
mov ax,0
mov ax,da5
mov auxi,ax
call print2
mov ax,0
mov ax,da4
mov auxi,ax
call print2
mov ax,0
mov ax,da3
mov auxi,ax
call print2
mov ax,0
mov ax,da2
mov auxi,ax
call print2
mov ax,0
mov ax,da1
mov auxi,ax
call print2
jmp Limpiar

print2 proc ;inicio de proceso
mov ah,02h
mov dx,auxi
add dx,30h
int 21h
ret ;Regreso
print2 endp

;------------------------
Decimales proc ;Inicio del proceso (108)

    mov ah,01h
    int 21h
    sub ax,130h
    mov DM,ax
    mov ah,01h
    int 21h
    sub ax,130h
    mov UM,ax
    mov ah,01h
    int 21h
    sub ax,130h
    mov C,ax
    mov ah,01h
    int 21h
    sub ax,130h
    mov D,al
    mov ah,01h
    int 21h
    sub al,30h
    mov U,al
    
MultiplicarDM:
    xor ax,ax
    cmp DM,0
    jz MultiplicarUM
    mov ax,00
    mov ax,DM
    mov bx,10000
    mul bx
    mov DM,0
    mov DM,ax
    
MultiplicarUM:
    xor ax,ax
    cmp UM,0
    jz MulC
    mov ax,00
    mov ax,UM
    mov bx,1000
    mul bx
    mov UM,0
    mov UM,ax
    
MulC:
    xor ax,ax
    cmp C,0
    jz MulD
    mov ax,00
    mov ax,C
    mov bx,100
    mul bx
    mov C,0
    mov C,ax
    
MulD:
    xor ax,ax
    cmp D,0
    jz Armar
    mov ax,00
    mov al,D
    mov bl,10
    mul bl
    mov D,0
    mov D,al
    
Armar:
    xor ax,ax
    mov ax,DM
    add numero,ax
    mov ax,0
    mov ax,UM
    add numero,ax
    mov ax,0
    mov ax,C
    add numero,ax
    mov ax,0
    mov al,D
    add numero,ax
    mov ax,0
    mov al,U
    add numero,ax
    
ret ;retorno
Decimales endp ;Fin del proceso

;------------Binario-------

BIDE: ;Etiqueta (Binario a decimal)

mov ah,09h
lea dx,Ingrese
int 21h

ingresobinario:
call ingBin
mov da16,ax
mov ax,0
call ingBin
mov da15,ax
mov ax,0
call ingBin
mov da14,ax
mov ax,0
call ingBin
mov da13,ax
mov ax,0
call ingBin
mov da12,ax
mov ax,0
call ingBin
mov da11,ax
mov ax,0
call ingBin
mov da10,ax
mov ax,0
call ingBin
mov da9,ax
mov ax,0
call ingBin
mov da8,ax
mov ax,0
call ingBin
mov da7,ax
mov ax,0
call ingBin
mov da6,ax
mov ax,0
call ingBin
mov da5,ax
mov ax,0
call ingBin
mov da4,ax
mov ax,0
call ingBin
mov da3,ax
mov ax,0
call ingBin
mov da2,ax
mov ax,0
call ingBin
mov da1,ax
mov ax,0
jmp suma1

ingBin proc
    mov ah,01h
    int 21h
    sub ax,130h
    ret; Retorno
    ingBin endp ;Fin del proceso

;-------suma1------------
suma1: ;Etiqueta

mov ax,da1
mov auxi2,ax
mov peso,1
call Sum
mov ax,da2
mov auxi2,ax
mov peso,2
call Sum
mov ax,da3
mov auxi2,ax
mov peso,4
call Sum
mov ax,da4
mov auxi2,ax
mov peso,8
call Sum
mov ax,da5
mov auxi2,ax
mov peso,16
call Sum
mov ax,da6
mov auxi2,ax
mov peso,32
call Sum
mov ax,da7
mov auxi2,ax
mov peso,64
call Sum
mov ax,da8
mov auxi2,ax
mov peso,128
call Sum
mov ax,da9
mov auxi2,ax
mov peso,256
call Sum
mov ax,da10
mov auxi2,ax
mov peso,512
call Sum
mov ax,da11
mov auxi2,ax
mov peso,1024
call Sum
mov ax,da12
mov auxi2,ax
mov peso,2048
call Sum
mov ax,da13
mov auxi2,ax
mov peso,4096
call Sum
mov ax,da14
mov auxi2,ax
mov peso,8192
call Sum
mov ax,da15
mov auxi2,ax
mov peso,16384
call Sum
mov ax,da16
mov auxi2,ax
mov peso,32768
call Sum
jmp ArmarDE ;Salta

 proc Sum ;Inicio del proceso
mov ax,0
cmp auxi2,1
jb regreso
mov bx,peso
mov auxi,bx
mov ax,auxi
add numero,ax
regreso:
ret ;Retorno
Sum endp ;Fin del proceso

ArmarDe: ;Etiqueta
mov ah,09h
lea dx,MResultado
int 21h
jmp ArmarImprimir

;------ARMAR E IMPRIMIR ------
ArmarImprimir:
mov peso,10000
call ArmarDecimal
mov peso,1000
call ArmarDecimal
mov peso,100
call ArmarDecimal
mov peso,10
call ArmarDecimal

Unidades:
xor dx,dx
mov ax,0
mov bx,0
mov ax,numero
mov U,al

mov ah,09h
mov ah,02h
mov dl,U
add dl,30h
int 21h
jmp Limpiar

ArmarDecimal proc ;Proceso
xor dx,dx
mov ax,0
mov bx,peso

cmp numero,bx
jb regresate
mov ax,numero
mov bx,peso
div bx
mov auxi,ax
mov ax,0
mov ax,auxi
mov bx,peso
mul bx
sub numero,ax

imprime:
mov ah,02h
mov dx,aUxi
add  dx,30h
int 21h

regresate:
ret ;Retorno
ArmarDecimal endp

;-----DECINAL A HEXADECIMAL ---

DEHE: ;Etiqueta

mov ah,09h
lea dx,Ingrese
int 21h
call Decimales
xor dx,dx
mov ax,0
mov ax,numero
cmp ax,255
jbe MENOR2
ja MAYOR2

;-----MENOR--IMPRIMIR---
MENOR2: ;Etiqueta
mov n,al
mov bl,16
call hexa
mov ah,auxi3
mov d1,ah
mov n,al
cmp n,0
je imprimirh
mov ah,auxi3
mov d2,ah
mov n,al
cmp n,0
je imprimirh
mov ah,auxi3
mov d3,ah
mov n,00
je imprimirh
mov ah,auxi3
mov d4,ah
mov n,al
cmp n,0
je imprimirh
jmp imprimirh

hexa proc ;Inicio del procedimiento
div bl
mov auxi3,ah
mov n,0
mov n,al
ret ;Retorno
hexa endp ;Fin del proceso

imprimirh: ;Etiqueta

mov ah,09h
lea dx,MResultado
int 21h

cmp d4,10
je agregarA
cmp d4,11
je agregarB
cmp d4,12
je agregarC
cmp d4,13
je agregarD
cmp d4,14
je agregarE
cmp d4,15
je agregarF
jmp imH

agregarA: ;Etiqueta
mov d4,11h
mov ah,02h
mov dl,d4
add dl,30h
int 21h
jmp H2

agregarB: ;etiqueta
mov d4,12h
mov ah,02h
mov dl,d4
add dl,30h
int 21h
jmp H2

agregarC:
mov d4,13h
mov ah,02h
mov dl,d4
add dl,30h
int 21h
jmp H2

agregarD:
mov d4,14h
mov ah,02h
mov dl,d4
add dl,30h
int 21h
jmp H2

agregarE:
mov d4,15h
mov ah,02h
mov dl,d4
add dl,30h
int 21h
jmp H2

agregarF:
mov d4,16h
mov ah,02h
mov dl,d4
add dl,30h
int 21h
jmp H2

imH:
mov ah,02h
mov dl,d4
mov dl,30h
int 21h
jmp H2

H2:
cmp d3,10
je agregarA2
cmp d3,11
je agregarB2
cmp d3,12
je agregarC2
cmp d3,13
je agregarD2
cmp d3,14
je agregarE2
cmp d3,15
je agregarF2
jmp imH2

agregarA2:
mov d3,11h
mov ah,02h
mov dl,d3
add dl,30h
int 21h
jmp H3

agregarB2:
mov d3,11h
mov ah,02h
mov dl,d3
add dl,30h
int 21h
jmp H3

agregarC2:
mov d3,13h
mov ah,02h
mov dl,d3
add dl,30h
int 21h
jmp H3

agregarD2:
mov d3,14h
mov ah,02h
mov dl,d3
add dl,30h
int 21h
jmp H3

agregarE2:
mov d3,15h
mov ah,02h
mov dl,d3
add dl,30h
int 21h
jmp H3

agregarF2:
mov d3,16h
mov ah,02h
mov dl,d3
add dl,30h
int 21h
jmp H3

imH2:
mov ah,02h
mov dl,d3
add dl,30h
int 21h
jmp H3

H3:
cmp d2,10
je agregarA3
cmp d2,11
je agregarB3
cmp d2,12
je agregarC3
cmp d2,13
je agregarD3
cmp d2,14
je agregarE3
cmp d2,15
je agregarF3
jmp imH3

agregarA3:
mov d2,11h
mov ah,02h
mov dl,d2
add dl,30h
int 21h
jmp H4

agregarB3:
mov d2,12h
mov ah,02h
mov dl,d2
add dl,30h
int 21h
jmp H4

agregarC3:
mov d2,13h
mov ah,02h
mov dl,d2
add dl,30h
int 21h
jmp H4

agregarD3:
mov d2,14h
mov ah,02h
mov dl,d2
add dl,30h
int 21h
jmp H4

agregarE3:
mov d2,15h
mov ah,02h
mov dl,d2
add dl,30h
int 21h
jmp H4

agregarF3:
mov d2,16h
mov ah,02h
mov dl,d2
add dl,30h
int 21h
jmp H4

imH3:
mov ah,02h
mov dl,d2
add dl,30h
int 21h
jmp H4

H4: ;Etiqueta
cmp d1,10
je agregarA4
cmp d1,11
je agregarB4
cmp d1,12
je agregarC4
cmp d1,13
je agregarD4
cmp d1,14
je agregarE4
cmp d1,15
je agregarF4
jmp imH4

agregarA4:
mov d1,11h
mov ah,02h
mov dl,d1
add dl,30h
int 21h
jmp Limpiar

agregarB4:
mov d1,12h
mov ah,02h
mov dl,d1
add dl,30h
int 21h
jmp Limpiar

agregarC4:
mov d1,13h
mov ah,02h
mov dl,d1
add dl,30h
int 21h
jmp Limpiar

agregarD4:
mov d1,14h
mov ah,02h
mov dl,d1
add dl,30h
int 21h
jmp Limpiar

agregarE4:
mov d1,15h
mov ah,02h
mov dl,d1
add dl,30h
int 21h
jmp Limpiar

agregarF4:
mov d1,16h
mov ah,02h
mov dl,d1
add dl,30h
int 21h
jmp Limpiar

imH4:
mov ah,02h
mov dl,d1
add dl,30h
int 21h
jmp Limpiar

;----------Cuando es mayor que 255 -------
MAYOR2: ;Etiqueta

hexa1M: ;Etiqueta

mov cx,16
div cx
mov dA1,dx
mov numero,0
mov numero,ax
cmp numero,0
je imprimirh2

hexa2M: ;Etiqueta
mov ax,numero
cmp ax,numero
ja hexa3M
div cx
mov da2,dx
mov numero,0
mov numero,ax
cmp numero,0
je imprimirh2

hexa3M: ;Etiqueta
mov ax,numero
cmp ax,numero
ja hexa4M
div cx
mov da3,dx
mov numero,0
mov numero,ax
cmp numero,0
je imprimirh2

hexa4M: ;Etiqueta
mov ax,numero
cmp ax,numero
ja imprimirh2
div cx
mov da4,dx
mov numero,0
mov numero,ax
cmp numero,0
je imprimirh2

imprimirh2: ;Etiqueta
mov ah,09h
lea dx,MResultado
int 21h

cmp da4,10
je agregarAM
cmp da4,11
je agregarBM
cmp da4,12
je agregarCM
cmp da4,13
je agregarDM
cmp da4,14
je agregarEM
cmp da4,15
je agregarFM
jmp imHM

agregarAM: ;Etiqueta
mov da4,11h
mov ah,02h
mov dx,da4
add dx,30h
int 21h
jmp H2M

agregarBM: ;Etiqueta
mov da4,12h
mov ah,02h
mov dx,da4
add dx,30h
int 21h
jmp H2M

agregarCM: ;Etiqueta
mov da4,13h
mov ah,02h
mov dx,da4
add dx,30h
int 21h
jmp H2M

agregarDM: ;Etiqueta
mov da4,14h
mov ah,02h
mov dx,da4
add dx,30h
int 21h
jmp H2M

agregarEM: ;Etiqueta
mov da4,15h
mov ah,02h
mov dx,da4
add dx,30h
int 21h
jmp H2M

agregarFM: ;Etiqueta
mov da4,16h
mov ah,02h
mov dx,da4
add dx,30h
int 21h
jmp H2M

imHM:
Mov ah,02h
mov dx,da4
add dx,30h
int 21h
jmp H2M

H2M: ;Etiqueta
cmp da3,10
je agregarA2M
cmp da3,11
je agregarB2M
cmp da3,12
je agregarC2M
cmp da3,13
je agregarD2M
cmp da3,14
je agregarE2M
cmp da3,15
je agregarF2M
jmp imH2M

agregarA2M:
mov da3,11h
mov ah,02h
mov dx,da3
add dx,30h
int 21h
jmp H3M

agregarB2M:
mov da3,11h
mov ah,02h
mov dx,da3
add dx,30h
int 21h
jmp H3M

agregarC2M:
mov da3,13h
mov ah,02h
mov dx,da3
add dx,30h
int 21h
jmp H3M

agregarD2M:
mov da3,14h
mov ah,02h
mov dx,da3
add dx,30h
int 21h
jmp H3M

agregarE2M:
mov da3,15h
mov ah,02h
mov dx,da3
add dx,30h
int 21h
jmp H3M

agregarF2M:
mov da3,16h
mov ah,02h
mov dx,da3
add dx,30h
int 21h
jmp H3M

imH2M:
mov ah,02h
mov dx,da3
add dx,30h
int 21h
jmp H3M

H3M: ;Etiqueta
cmp da2,10
je agregarA3M
cmp da2,11
je agregarB3M
cmp da2,12
je agregarC3M
cmp da2,13
je agregarD3M
cmp da2,14
je agregarE3M
cmp da2,15
je agregarF3M
jmp imH3M

agregarA3M:
mov da2,11h
mov ah,02h
mov dx,da2
add dx,30h
int 21h
jmp H4M

agregarB3M:
mov da2,12h
mov ah,02h
mov dx,da2
add dx,30h
int 21h
jmp H4M

agregarC3M:
mov da2,13h
mov ah,02h
mov dx,da2
add dx,30h
int 21h
jmp H4M

agregarD3M:
mov da2,14h
mov ah,02h
mov dx,da2
add dx,30h
int 21h
jmp H4M

agregarE3M:
mov da2,15h
mov ah,02h
mov dx,da2
add dx,30h
int 21h
jmp H4M

agregarF3M:
mov da2,16h
mov ah,02h
mov dx,da2
add dx,30h
int 21h
jmp H4M

imH3M:
mov ah,02H
mov dx,da2
add dl,30h
int 21h
jmp H4M

H4M: ;Etiqueta
cmp da1,10
je agregarA4M
cmp da1,11
je agregarB4M
cmp da1,12
je agregarC4M
cmp da1,13
je agregarD4M
cmp da1,14
je agregarE4M
cmp da1,15
je agregarF4M
jmp imH4M

agregarA4M:
mov da1,11h
mov ah,02h
mov dx,da1
add dx,30h
int 21h
jmp Limpiar

agregarB4M:
mov da1,12h
mov ah,02h
mov dx,da1
add dx,30h
int 21h
jmp Limpiar

agregarC4M:
mov da1,13h
mov ah,02h
mov dx,da1
add dx,30h
int 21h
jmp Limpiar

agregarD4M:
mov da1,14h
mov ah,02h
mov dx,da1
add dx,30h
int 21h
jmp Limpiar

agregarE4M:
mov da1,15h
mov ah,02h
mov dx,da1
add dx,30h
int 21h
jmp Limpiar

agregarF4M:
mov da1,16h
mov ah,02h
mov dx,da1
add dx,30h
int 21h
jmp Limpiar

imH4M:
mov ah,02h
mov dx,da1
add dx,30h
int 21h
jmp Limpiar

;----HEXADECIMAL-DECIMAL-----

HEDE: ;Etiqueta

mov ah,09h
lea dx,Ingrese
int 21h

ingresoHEXA:

mov ah,01h
int 21h
sub ax,130h
mov da1,ax

mov ah,01h
int 21h
sub ax,130h
mov da2,ax

mov ah,01h
int 21h
sub ax,130h
mov da3,ax

mov ah,01h
int 21h
sub ax,130h
mov da4,ax

suma1h:
mov ax,0
cmp da1,0
je suma2h

ponerA:
cmp da1,11h
ja ponerb
jb unir2
mov auxi2,10
mov ax,auxi2
mov da1,ax
jmp unir1

ponerb:
cmp da1,12h
ja ponerc
mov auxi2,11
mov ax,auxi2
mov da1,ax
jmp unir1

ponerc:
cmp da1,13h
ja ponerc
mov auxi2,12
mov ax,auxi2
mov da1,ax
jmp unir1

ponerd:
cmp da1,14h
ja ponerc
mov auxi2,13
mov ax,auxi2
mov da1,ax
jmp unir1

ponere:
cmp da1,15h
ja ponerc
mov auxi2,14
mov ax,auxi2
mov da1,ax
jmp unir1

ponerf:
cmp da1,16h
ja ponerc
mov auxi2,15
mov ax,auxi2
mov da1,ax
jmp unir1

unir1: ;Etiqueta
mov auxi,4096
mov ax,auxi
mov bx,da1
mul bx
add numero,ax

suma2h:
mov ax,0
cmp da2,0
je suma3h

ponerA2:
cmp da2,11h
ja ponerb2
jb unir2
mov auxi2,10
mov ax,auxi2
mov da2,ax
jmp unir2

ponerb2:
cmp da2,12h
ja ponerc2
jb unir2
mov auxi2,11
mov ax,auxi2
mov da2,ax
jmp unir2

ponerc2:
cmp da2,13h
ja ponerd2
jb unir2
mov auxi2,12
mov ax,auxi2
mov da2,ax
jmp unir2

ponerd2:
cmp da2,14h
ja ponere2
mov auxi2,13
mov ax,auxi2
mov da2,ax
jmp unir2

ponere2:
cmp da2,15h
ja ponerf2
mov auxi2,14
mov ax,auxi2
mov da2,ax
jmp unir2

ponerf2:
cmp da2,16h
mov auxi2,15
mov ax,auxi2
mov da2,ax
jmp unir2

unir2: ;Etiqueta 
mov auxi,256
mov ax,auxi
mov bx,da2
mul bx
add numero,ax

suma3h:
mov ax,0
cmp da3,0
je suma4h

ponerA3:
cmp da3,11h
ja ponerb3
jb unir3
mov auxi2,10
mov ax,auxi2
mov da3,ax
jmp unir3

ponerb3:
cmp da3,12h
ja ponerc3
mov auxi2,11
mov ax,auxi2
mov da3,ax
jmp unir3

ponerc3:
cmp da3,13h
ja ponerd3
jb unir3
mov auxi2,12
mov ax,auxi2
mov da3,ax
jmp unir3

ponerd3:
cmp da3,14h
ja ponere3
mov auxi2,13
mov ax,auxi2
mov da3,ax
jmp unir2

ponere3:
cmp da3,15h
ja ponerf3
mov auxi2,14
mov ax,auxi2
mov da3,ax
jmp unir3

ponerf3:
cmp da3,16h
mov auxi2,15
mov ax,auxi2
mov da3,ax
jmp unir3

unir3:
mov auxi,16
mov ax,auxi
mov bx,da3
mul bx
add numero,ax

suma4h:
mov ax,0
cmp da4,0
je IMPDE

ponerA4:
cmp da4,11h
ja ponerb4
jb unir4
mov auxi2,10
mov ax,auxi2
mov da4,ax
jmp unir4

ponerb4:
cmp da4,12
ja ponerc4
mov auxi2,11
mov ax,auxi2
mov da4,ax
jmp unir4

ponerc4:
cmp da4,13h
ja ponerd4
jb unir4
mov auxi2,12
mov ax,auxi2
mov da4,ax
jmp unir4

ponerd4:
cmp da4,14h
ja ponere4
mov auxi2,13
mov ax,auxi2
mov da4,ax
jmp unir4

ponere4:
cmp da4,15h
ja ponerf4
jb unir4
mov auxi2,14
mov ax,auxi2
mov da4,ax
jmp unir4

ponerf4:
cmp da4,16h
mov auxi2,15
mov ax,auxi2
mov da4,ax
jmp unir4

unir4:
mov auxi,1
mov ax,auxi
mov bx,da4
mul bx
add numero,ax

IMPDE:
mov ah,09h
lea dx,MResultado
int 21h
call ArmarImprimir
jmp Limpiar

Limpiar: ;Etiqueta
Mov ah,09h
lea dx,salto
int 21h
mov ax,0
mov bx,0
mov cx,0
xor dx,dx
xor cx,cx
mov numero,0
mov n,0
mov auxi,0
mov auxi2,0
jmp M

Salir: ;Etiqueta
    mov ax,4c00h
    int 21h
    end
    
    ;Por favor que compile
    ;Ya me quiero ir a dormir